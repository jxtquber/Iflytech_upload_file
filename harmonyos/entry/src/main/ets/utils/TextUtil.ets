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
    if (raw.length <= 500) {
      return raw;
    }
    return `${raw.substring(0, 500)}...`;
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

  static objString(item: Record<string, Object | string | number | boolean | null | undefined>, ...keys: string[]): string {
    for (const key of keys) {
      const value = item[key];
      if (value !== undefined && value !== null) {
        const text = `${value}`;
        if (text.length > 0 && text !== 'null') {
          return text;
        }
      }
    }
    return '';
  }

  static cloudName(item: Record<string, Object | string | number | boolean | null | undefined>): string {
    return TextUtil.firstNonEmpty(
      TextUtil.objString(item, 'fileName'),
      TextUtil.objString(item, 'docName'),
      TextUtil.objString(item, 'dirName'),
      TextUtil.objString(item, 'name'),
      '未命名'
    );
  }

  static fileExtLabel(item: Record<string, Object | string | number | boolean | null | undefined>): string {
    const label = TextUtil.firstNonEmpty(
      TextUtil.objString(item, 'fileExt'),
      TextUtil.objString(item, 'docExt'),
      TextUtil.objString(item, 'docType'),
      TextUtil.extension(TextUtil.cloudName(item)).replace('.', '')
    );
    return label.length > 0 ? label.toUpperCase() : '文件';
  }

  static isCloudDir(item: Record<string, Object | string | number | boolean | null | undefined>): boolean {
    const type = TextUtil.objString(item, 'docType', 'fileType', 'type').toLowerCase();
    return type === 'dir' || type === 'folder' || TextUtil.objString(item, 'dirName').length > 0;
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
