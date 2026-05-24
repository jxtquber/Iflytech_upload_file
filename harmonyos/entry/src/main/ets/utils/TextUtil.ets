import { CloudItem } from '../model/Types';

export class TextUtil {
  static firstNonEmpty(...values: string[]): string {
    for (const value of values) {
      if (value !== undefined && value !== null && value.length > 0 && value !== 'null') {
        return value;
      }
    }
    return '';
  }

  static extension(name: string): string {
    const index = name.lastIndexOf('.');
    return index < 0 ? '' : name.substring(index);
  }

  static safeFileName(name: string): string {
    const safe = name.replace(/[\\/:*?"<>|]/g, '_').trim();
    return safe.length > 0 ? safe : 'download.bin';
  }

  static compact(raw: string): string {
    const masked = TextUtil.maskSecrets(raw);
    if (masked.length <= 500) {
      return masked;
    }
    return `${masked.substring(0, 500)}...`;
  }

  static maskSecrets(raw: string): string {
    return raw
      .replace(/("(?:access_token|refresh_token|userToken|refreshToken|token|Authorization)"\s*:\s*")[^"]*"/gi, '$1***"')
      .replace(/([?&](?:access_token|refresh_token|userToken|refreshToken|token|Authorization)=)[^&]*/gi, '$1***');
  }

  static formatBytes(size: number): string {
    if (size <= 0) {
      return '';
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB'];
    let value = size;
    let unit = 0;
    while (value >= 1024 && unit < units.length - 1) {
      value /= 1024;
      unit++;
    }
    return `${value.toFixed(unit === 0 ? 0 : 1)} ${units[unit]}`;
  }

  static objString(item: CloudItem, key: string): string {
    if (key === 'fileName') {
      return item.fileName;
    }
    if (key === 'docName') {
      return item.docName;
    }
    if (key === 'dirName') {
      return item.dirName;
    }
    if (key === 'name') {
      return item.name;
    }
    if (key === 'docType') {
      return item.docType;
    }
    if (key === 'fileType') {
      return item.fileType;
    }
    if (key === 'type') {
      return item.type;
    }
    if (key === 'fileExt') {
      return item.fileExt;
    }
    if (key === 'docExt') {
      return item.docExt;
    }
    if (key === 'dirId') {
      return item.dirId;
    }
    if (key === 'fileId') {
      return item.fileId;
    }
    if (key === 'id') {
      return item.id;
    }
    if (key === 'url') {
      return item.url;
    }
    if (key === 'objectName') {
      return item.objectName;
    }
    if (key === 'filePath') {
      return item.filePath;
    }
    if (key === 'fileSize') {
      return item.fileSize > 0 ? `${item.fileSize}` : '';
    }
    if (key === 'docSize') {
      return item.docSize > 0 ? `${item.docSize}` : '';
    }
    if (key === 'size') {
      return item.size > 0 ? `${item.size}` : '';
    }
    return '';
  }

  static objString3(item: CloudItem, first: string, second: string, third: string): string {
    return TextUtil.firstNonEmpty(
      TextUtil.objString(item, first),
      TextUtil.objString(item, second),
      TextUtil.objString(item, third)
    );
  }

  static cloudName(item: CloudItem): string {
    return TextUtil.firstNonEmpty(
      item.fileName,
      item.docName,
      item.dirName,
      item.name,
      '未命名'
    );
  }

  static fileExtLabel(item: CloudItem): string {
    const label = TextUtil.firstNonEmpty(
      item.fileExt,
      item.docExt,
      item.docType,
      TextUtil.extension(TextUtil.cloudName(item)).replace('.', '')
    );
    return label.length > 0 ? label.toUpperCase() : '文件';
  }

  static stripHtml(raw: string): string {
    return raw
      .replace(/<style[\s\S]*?<\/style>/gi, '')
      .replace(/<script[\s\S]*?<\/script>/gi, '')
      .replace(/<[^>]+>/g, '')
      .replace(/&nbsp;/g, ' ')
      .replace(/&amp;/g, '&')
      .replace(/&lt;/g, '<')
      .replace(/&gt;/g, '>')
      .replace(/&quot;/g, '"')
      .replace(/\s+/g, ' ')
      .trim();
  }

  static formatNoteTime(time: number): string {
    if (time <= 0) {
      return '';
    }
    const date = new Date(time);
    const month = date.getMonth() + 1;
    const hour = `${date.getHours()}`.padStart(2, '0');
    const minute = `${date.getMinutes()}`.padStart(2, '0');
    return `${month}月 · ${hour}:${minute}`;
  }

  static isCloudDir(item: CloudItem): boolean {
    const type = TextUtil.firstNonEmpty(item.docType, item.fileType, item.type).toLowerCase();
    if (type === 'dir' || type === 'folder' || type === 'directory') {
      return true;
    }

    const hasFileIdentity = TextUtil.firstNonEmpty(
      item.fileName,
      item.docName,
      item.fileId,
      item.url,
      item.objectName,
      item.filePath,
      item.fileExt,
      item.docExt
    ).length > 0;
    const hasFileSize = item.fileSize > 0 || item.docSize > 0 || item.size > 0;
    if (hasFileIdentity || hasFileSize) {
      return false;
    }

    return item.dirName.length > 0 || item.dirId.length > 0;
  }

  static fileTypeColor(ext: string): string {
    const lower = ext.toLowerCase();
    if (lower === 'pdf') {
      return '#EC5252';
    }
    if (lower === 'doc' || lower === 'docx' || lower === 'word') {
      return '#437EE8';
    }
    if (lower === 'ppt' || lower === 'pptx') {
      return '#EB8334';
    }
    if (lower === 'xls' || lower === 'xlsx' || lower === 'excel') {
      return '#34A462';
    }
    if (lower === 'epub' || lower === 'mobi' || lower === 'azw3' || lower === 'txt') {
      return '#8464D6';
    }
    if (lower === 'jpg' || lower === 'jpeg' || lower === 'png') {
      return '#2AA9B9';
    }
    return '#667C94';
  }
}
