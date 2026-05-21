import { fileIo as fs, picker } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { ApiClient } from './ApiClient';
import { DigestResult, SelectedFile } from '../model/Types';
import { HashUtil } from '../utils/HashUtil';
import { TextUtil } from '../utils/TextUtil';

export class FileService {
  constructor(private context: common.UIAbilityContext, private api: ApiClient) {
  }

  async pickFiles(): Promise<SelectedFile[]> {
    const documentPicker = new picker.DocumentViewPicker(this.context);
    const options = new picker.DocumentSelectOptions();
    options.maxSelectNumber = 100;
    const uris = await documentPicker.select(options);
    return uris.map((uri) => {
      return {
        uri,
        name: this.nameFromUri(uri),
        size: this.safeSize(uri)
      };
    });
  }

  async readFile(uri: string): Promise<ArrayBuffer> {
    const file = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    try {
      const stat = fs.statSync(file.fd);
      const buffer = new ArrayBuffer(stat.size);
      fs.readSync(file.fd, buffer);
      return buffer;
    } finally {
      fs.closeSync(file);
    }
  }

  async digest(file: SelectedFile): Promise<DigestResult> {
    const buffer = await this.readFile(file.uri);
    return {
      md5: HashUtil.md5Buffer(buffer),
      size: buffer.byteLength
    };
  }

  async uploadFile(file: SelectedFile, index: number, total: number, onProgress: (percent: number, message: string) => void): Promise<void> {
    const current = index + 1;
    onProgress(Math.max(1, Math.floor(index * 100 / total)), `正在处理 ${current}/${total}: ${file.name}`);
    const buffer = await this.readFile(file.uri);
    const md5 = HashUtil.md5Buffer(buffer).toUpperCase();
    const objectName = `${md5}${TextUtil.extension(file.name)}`;
    const size = buffer.byteLength > 0 ? buffer.byteLength : file.size;
    const uploadUrl = await this.api.getUploadUrl(objectName, size);
    if (uploadUrl.length === 0) {
      throw new Error('上传地址为空');
    }
    onProgress(Math.min(99, Math.floor((index * 100 + 70) / total)), `正在上传 ${current}/${total}: ${file.name}`);
    await this.api.putFile(uploadUrl, buffer);
    await this.api.addCloudDoc(file.name, objectName, size);
    onProgress(Math.floor(current * 100 / total), `已完成 ${current}/${total}: ${file.name}`);
  }

  async saveToDownloads(fileName: string, data: ArrayBuffer): Promise<string> {
    const safeName = TextUtil.safeFileName(fileName);
    const baseDir = this.context.filesDir;
    const path = `${baseDir}/${Date.now()}_${safeName}`;
    const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    try {
      fs.writeSync(file.fd, data);
    } finally {
      fs.closeSync(file);
    }
    return path;
  }

  private safeSize(uri: string): number {
    try {
      const file = fs.openSync(uri, fs.OpenMode.READ_ONLY);
      try {
        return fs.statSync(file.fd).size;
      } finally {
        fs.closeSync(file);
      }
    } catch (_) {
      return 0;
    }
  }

  private nameFromUri(uri: string): string {
    const slash = uri.lastIndexOf('/');
    const raw = slash >= 0 ? uri.substring(slash + 1) : uri;
    try {
      return decodeURIComponent(raw);
    } catch (_) {
      return raw.length > 0 ? raw : 'upload.bin';
    }
  }
}
