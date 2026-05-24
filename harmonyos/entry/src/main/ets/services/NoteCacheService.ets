import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { NoteItem } from '../model/Types';
import { TextUtil } from '../utils/TextUtil';

export class NoteCacheService {
  private context: common.UIAbilityContext;

  constructor(context: common.UIAbilityContext) {
    this.context = context;
  }

  async load(userId: string, noteId: string): Promise<NoteItem | undefined> {
    const path = this.cachePath(userId, noteId);
    try {
      const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
      try {
        const stat = fs.statSync(file.fd);
        if (stat.size <= 0) {
          return undefined;
        }
        const buffer = new ArrayBuffer(stat.size);
        fs.readSync(file.fd, buffer);
        const raw = this.arrayBufferToString(buffer);
        const data = JSON.parse(raw) as Record<string, Object>;
        return this.noteFromRecord(data);
      } finally {
        fs.closeSync(file);
      }
    } catch (_) {
      return undefined;
    }
  }

  async save(userId: string, note: NoteItem): Promise<void> {
    if (userId.length === 0 || note.noteId.length === 0) {
      return;
    }
    this.ensureDir(this.cacheDir(userId));
    const raw = JSON.stringify(note);
    const buffer = this.stringToArrayBuffer(raw);
    const file = fs.openSync(this.cachePath(userId, note.noteId), fs.OpenMode.CREATE | fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
    try {
      fs.writeSync(file.fd, buffer);
    } finally {
      fs.closeSync(file);
    }
  }

  private noteFromRecord(data: Record<string, Object>): NoteItem {
    const note = new NoteItem();
    note.noteId = this.stringField(data, 'noteId');
    note.noteName = TextUtil.firstNonEmpty(this.stringField(data, 'noteName'), '未命名笔记');
    note.type = this.stringField(data, 'type');
    note.dir = TextUtil.firstNonEmpty(this.stringField(data, 'dir'), '0');
    note.dirName = this.stringField(data, 'dirName');
    note.summary = this.stringField(data, 'summary');
    note.contentText = this.stringField(data, 'contentText');
    note.html = this.stringField(data, 'html');
    note.content = this.stringField(data, 'content');
    note.tempId = this.stringField(data, 'tempId');
    note.createTime = this.numberField(data, 'createTime');
    note.updateTime = this.numberField(data, 'updateTime');
    note.isEncrypt = this.numberField(data, 'isEncrypt');
    return note;
  }

  private stringField(data: Record<string, Object>, key: string): string {
    const value = data[key];
    if (value === undefined || value === null) {
      return '';
    }
    return `${value}`;
  }

  private numberField(data: Record<string, Object>, key: string): number {
    const value = Number.parseInt(this.stringField(data, key));
    return Number.isNaN(value) ? 0 : value;
  }

  private cacheDir(userId: string): string {
    return `${this.context.filesDir}/note_cache_${TextUtil.safeFileName(userId)}`;
  }

  private cachePath(userId: string, noteId: string): string {
    return `${this.cacheDir(userId)}/${TextUtil.safeFileName(noteId)}.json`;
  }

  private ensureDir(path: string): void {
    try {
      fs.mkdirSync(path);
    } catch (_) {
    }
  }

  private stringToArrayBuffer(text: string): ArrayBuffer {
    const bytes: number[] = [];
    for (let i = 0; i < text.length; i++) {
      const code = text.charCodeAt(i);
      if (code < 0x80) {
        bytes.push(code);
      } else if (code < 0x800) {
        bytes.push(0xC0 | (code >> 6), 0x80 | (code & 0x3F));
      } else if (code >= 0xD800 && code <= 0xDBFF && i + 1 < text.length) {
        const next = text.charCodeAt(++i);
        const point = 0x10000 + ((code - 0xD800) << 10) + (next - 0xDC00);
        bytes.push(0xF0 | (point >> 18), 0x80 | ((point >> 12) & 0x3F), 0x80 | ((point >> 6) & 0x3F), 0x80 | (point & 0x3F));
      } else {
        bytes.push(0xE0 | (code >> 12), 0x80 | ((code >> 6) & 0x3F), 0x80 | (code & 0x3F));
      }
    }
    const buffer = new ArrayBuffer(bytes.length);
    const view = new Uint8Array(buffer);
    for (let i = 0; i < bytes.length; i++) {
      view[i] = bytes[i];
    }
    return buffer;
  }

  private arrayBufferToString(buffer: ArrayBuffer): string {
    const bytes = new Uint8Array(buffer);
    let text = '';
    for (let i = 0; i < bytes.length;) {
      const first = bytes[i++];
      if (first < 0x80) {
        text += String.fromCharCode(first);
      } else if (first >= 0xC0 && first < 0xE0 && i < bytes.length) {
        const second = bytes[i++];
        text += String.fromCharCode(((first & 0x1F) << 6) | (second & 0x3F));
      } else if (first >= 0xE0 && first < 0xF0 && i + 1 < bytes.length) {
        const second = bytes[i++];
        const third = bytes[i++];
        text += String.fromCharCode(((first & 0x0F) << 12) | ((second & 0x3F) << 6) | (third & 0x3F));
      } else if (first >= 0xF0 && first < 0xF8 && i + 2 < bytes.length) {
        const second = bytes[i++];
        const third = bytes[i++];
        const fourth = bytes[i++];
        const codePoint = ((first & 0x07) << 18) | ((second & 0x3F) << 12) | ((third & 0x3F) << 6) | (fourth & 0x3F);
        const adjusted = codePoint - 0x10000;
        text += String.fromCharCode(0xD800 + (adjusted >> 10), 0xDC00 + (adjusted & 0x3FF));
      } else {
        text += String.fromCharCode(first);
      }
    }
    return text;
  }
}
