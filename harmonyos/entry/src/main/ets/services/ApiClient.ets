import { http } from '@kit.NetworkKit';
import { ApiResponse, CloudItem, copySession, SessionData } from '../model/Types';
import { DesUtil } from '../utils/DesUtil';
import { HashUtil } from '../utils/HashUtil';
import { TextUtil } from '../utils/TextUtil';

const APP_KEY = 'dxk-pc';
const APP_SECRET = '2c8e320f948911eca3fafa163ec9';
const BASE_API = 'http://api.iflyink.com/xbew-api';
const ROOT_DIR_ID = '0';

class Param {
  key: string;
  value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

class FormRequestHeader {
  'Content-Type': string = 'application/x-www-form-urlencoded; charset=utf-8;';
  ainoteVersion: string = '';
  Authorization: string = '';
  userToken: string = '';
}

class EmptyRequestHeader {
  'Content-Type': string = '';
}

class AddDocPayload {
  docName: string = '';
  docExt: string = '';
  docType: string = '';
  url: string = '';
  docSize: number = 0;
  thumbnail: string = '';
}

export class ApiClient {
  session: SessionData = {
    phone: '',
    userId: '',
    auth: '',
    userToken: '',
    refreshToken: '',
    sn: ''
  };

  onSessionChanged?: (session: SessionData) => Promise<void>;
  onLog?: (message: string) => void;

  setSession(session: SessionData): void {
    this.session = copySession(session);
  }

  async sendSmsCode(mobile: string): Promise<void> {
    const response = await this.postBeforeLogin(`${BASE_API}/common/sms/pushLogin`, [
      new Param('mobile', mobile)
    ]);
    if (response.code !== 200) {
      throw new Error(`发送验证码失败: ${TextUtil.compact(response.raw)}`);
    }
  }

  async loginByCode(account: string, code: string): Promise<SessionData> {
    const response = await this.postBeforeLogin(`${BASE_API}/user/codeLogin`, [
      new Param('account', account),
      new Param('code', code)
    ]);
    return this.handleLoginResponse(response, account);
  }

  async loginByPassword(account: string, password: string): Promise<SessionData> {
    const response = await this.postBeforeLogin(`${BASE_API}/user/dxkLogin`, [
      new Param('account', account),
      new Param('pwd', DesUtil.encryptPassword(password))
    ]);
    return this.handleLoginResponse(response, account);
  }

  async fetchCloudItems(dirId: string): Promise<CloudItem[]> {
    const response = await this.postWithSession(`${BASE_API}/note/doc/getCloudFileList`, [
      new Param('userId', this.session.userId),
      new Param('page', ROOT_DIR_ID),
      new Param('limit', '10000'),
      new Param('type', ''),
      new Param('dirId', dirId),
      new Param('name', ''),
      new Param('sortField', 'updateTime'),
      new Param('sortType', 'descending')
    ]);
    if (response.code !== 200) {
      throw new Error(TextUtil.compact(response.raw));
    }
    return this.extractObjectList(response.raw);
  }

  async getUploadUrl(objectName: string, size: number): Promise<string> {
    const response = await this.postWithSession(`${BASE_API}/common/common/getUploadUrl`, [
      new Param('userId', this.session.userId),
      new Param('dir', 'attachment'),
      new Param('objectName', objectName),
      new Param('size', `${size}`),
      new Param('expiration', '86400'),
      new Param('increment', ROOT_DIR_ID)
    ]);
    if (response.code !== 200) {
      throw new Error(`获取上传地址失败: ${TextUtil.compact(response.raw)}`);
    }
    return TextUtil.firstNonEmpty(
      this.extractString(response.raw, 'url'),
      this.extractString(response.raw, 'uploadUrl')
    );
  }

  async addCloudDoc(fileName: string, objectName: string, size: number): Promise<void> {
    const ext = TextUtil.extension(fileName).replace('.', '').toLowerCase();
    const payload = new AddDocPayload();
    payload.docName = fileName;
    payload.docExt = ext;
    payload.docType = ext;
    payload.url = `attachment/${objectName}`;
    payload.docSize = size;
    const response = await this.postWithSession(`${BASE_API}/note/doc/addDoc`, [
      new Param('userId', this.session.userId),
      new Param('doc', JSON.stringify(payload)),
      new Param('dirId', ROOT_DIR_ID),
      new Param('checkFileExist', 'true')
    ]);
    if (response.code !== 200) {
      throw new Error(`登记云盘失败: ${TextUtil.compact(response.raw)}`);
    }
  }

  async getDownloadUrl(item: CloudItem): Promise<string> {
    let objectName = TextUtil.firstNonEmpty(item.url, item.objectName, item.filePath);
    if (objectName.startsWith('attachment/')) {
      objectName = objectName.substring('attachment/'.length);
    }
    if (objectName.length === 0) {
      throw new Error('文件 objectName 为空');
    }
    const response = await this.postWithSession(`${BASE_API}/common/common/getDownloadUrl`, [
      new Param('userId', this.session.userId),
      new Param('dir', 'attachment'),
      new Param('objectName', objectName),
      new Param('expiration', '86400'),
      new Param('increment', ROOT_DIR_ID)
    ]);
    if (response.code !== 200) {
      throw new Error(TextUtil.compact(response.raw));
    }
    return this.extractDownloadUrl(response.raw);
  }

  private async handleLoginResponse(response: ApiResponse, phone: string): Promise<SessionData> {
    if (response.code !== 200) {
      throw new Error(`登录失败: ${TextUtil.compact(response.raw)}`);
    }
    const userId = TextUtil.firstNonEmpty(this.extractString(response.raw, 'userId'), this.extractString(response.raw, 'id'));
    const userToken = this.extractString(response.raw, 'userToken');
    const refreshToken = this.extractString(response.raw, 'refreshToken');
    const sn = this.extractString(response.raw, 'sn');
    if (userId.length === 0 || userToken.length === 0) {
      throw new Error('登录失败: 返回缺少 userId 或 userToken');
    }
    this.session = {
      phone,
      userId,
      auth: this.session.auth,
      userToken,
      refreshToken,
      sn
    };
    await this.refreshAccessToken();
    await this.persistSession();
    return copySession(this.session);
  }

  private async postWithSession(url: string, params: Param[]): Promise<ApiResponse> {
    let response = await this.postSigned(url, params, this.session.auth, this.session.userToken);
    if (response.code === 401) {
      this.onLog?.('登录态过期，正在刷新...');
      if (await this.refreshAccessToken()) {
        response = await this.postSigned(url, params, this.session.auth, this.session.userToken);
      }
    }
    if (response.code === 406) {
      this.onLog?.('userToken 过期，正在刷新...');
      if (await this.refreshUserToken()) {
        response = await this.postSigned(url, params, this.session.auth, this.session.userToken);
      }
    }
    return response;
  }

  private async postBeforeLogin(url: string, params: Param[]): Promise<ApiResponse> {
    let response = await this.postSigned(url, params, this.session.auth, '');
    if (response.code === 401 && await this.refreshAccessToken()) {
      response = await this.postSigned(url, params, this.session.auth, '');
    }
    return response;
  }

  private async refreshAccessToken(): Promise<boolean> {
    const response = await this.postSigned(`${BASE_API}/auth/oauth/token`, [], this.session.auth, this.session.userToken);
    if (response.code !== 200) {
      return false;
    }
    const token = TextUtil.firstNonEmpty(
      this.extractString(response.raw, 'access_token'),
      this.extractString(response.raw, 'token')
    );
    if (token.length === 0) {
      return false;
    }
    this.session.auth = token;
    await this.persistSession();
    return true;
  }

  private async refreshUserToken(): Promise<boolean> {
    if (this.session.userId.length === 0 || this.session.refreshToken.length === 0 || this.session.sn.length === 0) {
      return false;
    }
    const response = await this.postSigned(`${BASE_API}/user/refreshToken`, [
      new Param('userId', this.session.userId),
      new Param('refreshToken', this.session.refreshToken),
      new Param('sn', this.session.sn)
    ], this.session.auth, this.session.userToken);
    if (response.code !== 200) {
      return false;
    }
    const userToken = this.extractString(response.raw, 'userToken');
    if (userToken.length === 0) {
      return false;
    }
    this.session.userToken = userToken;
    this.session.refreshToken = TextUtil.firstNonEmpty(this.extractString(response.raw, 'refreshToken'), this.session.refreshToken);
    this.session.sn = TextUtil.firstNonEmpty(this.extractString(response.raw, 'sn'), this.session.sn);
    await this.persistSession();
    return true;
  }

  private async postSigned(url: string, params: Param[], auth: string, userToken: string): Promise<ApiResponse> {
    const signed: Param[] = params.slice();
    signed.push(new Param('istv', 's'));
    const timestamp = `${Date.now()}`;
    signed.push(new Param('timestamp', timestamp));
    signed.push(new Param('appKey', APP_KEY));
    signed.push(new Param('nonce', HashUtil.md5Text(`${timestamp}${this.randomDigits(10)}`)));
    signed.push(new Param('sign', this.sign(signed)));
    const request = http.createHttp();
    try {
      const response = await request.request(url, {
        method: http.RequestMethod.POST,
        connectTimeout: 30000,
        readTimeout: 180000,
        header: this.formHeaders(auth, userToken),
        extraData: this.formEncode(signed)
      });
      const raw = this.resultToString(response.result);
      return {
        code: this.responseCode(raw, response.responseCode),
        raw
      };
    } finally {
      request.destroy();
    }
  }

  async putFile(uploadUrl: string, data: ArrayBuffer): Promise<void> {
    const request = http.createHttp();
    try {
      const response = await request.request(uploadUrl, {
        method: http.RequestMethod.PUT,
        connectTimeout: 30000,
        readTimeout: 180000,
        header: new EmptyRequestHeader(),
        extraData: data
      });
      if (response.responseCode < 200 || response.responseCode >= 300) {
        throw new Error(`PUT upload failed HTTP ${response.responseCode}: ${TextUtil.compact(this.resultToString(response.result))}`);
      }
    } finally {
      request.destroy();
    }
  }

  async download(url: string): Promise<ArrayBuffer> {
    const request = http.createHttp();
    try {
      const response = await request.request(url, {
        method: http.RequestMethod.GET,
        connectTimeout: 30000,
        readTimeout: 180000
      });
      if (response.responseCode < 200 || response.responseCode >= 300) {
        throw new Error(`下载失败 HTTP ${response.responseCode}`);
      }
      if (typeof response.result === 'string') {
        return new Uint8Array(HashUtil.utf8Bytes(response.result)).buffer;
      }
      return response.result as ArrayBuffer;
    } finally {
      request.destroy();
    }
  }

  private sign(params: Param[]): string {
    const pairs: string[] = [];
    const values = params.slice();
    values.sort((left: Param, right: Param) => left.key.localeCompare(right.key));
    for (const param of values) {
      if (param.key !== 'sign' && param.value.length > 0) {
        pairs.push(`${param.key}=${param.value}`);
      }
    }
    pairs.push(`secret=${APP_SECRET}`);
    return HashUtil.sha256Text(pairs.join('&')).toUpperCase();
  }

  private formHeaders(auth: string, userToken: string): FormRequestHeader {
    const headers = new FormRequestHeader();
    headers.ainoteVersion = '';
    headers.Authorization = auth;
    headers.userToken = userToken;
    return headers;
  }

  private formEncode(params: Param[]): string {
    const encoded: string[] = [];
    for (const param of params) {
      encoded.push(`${encodeURIComponent(param.key)}=${encodeURIComponent(param.value)}`);
    }
    return encoded.join('&');
  }

  private responseCode(raw: string, fallback: number): number {
    const text = this.extractRaw(raw, 'code');
    const parsed = Number.parseInt(text);
    return Number.isNaN(parsed) ? fallback : parsed;
  }

  private extractObjectList(raw: string): CloudItem[] {
    let arrayText = this.findArrayText(raw, 'list');
    if (arrayText.length === 0) {
      arrayText = this.findArrayText(raw, 'records');
    }
    if (arrayText.length === 0) {
      arrayText = this.findArrayText(raw, 'data');
    }
    if (arrayText.length === 0) {
      const objectText = this.findObjectText(raw, 'data');
      if (objectText.length > 0) {
        const single: CloudItem[] = [];
        single.push(this.cloudItemFromJson(objectText));
        return single;
      }
      return [];
    }
    const objects = this.splitObjects(arrayText);
    const items: CloudItem[] = [];
    for (const objectText of objects) {
      items.push(this.cloudItemFromJson(objectText));
    }
    return items;
  }

  private extractDownloadUrl(raw: string): string {
    const arrayText = this.findArrayText(raw, 'url');
    if (arrayText.length > 0) {
      const first = this.firstQuotedValue(arrayText);
      if (first.length > 0) {
        return first;
      }
    }
    return this.extractString(raw, 'url');
  }

  private cloudItemFromJson(raw: string): CloudItem {
    const item = new CloudItem();
    item.fileName = this.extractString(raw, 'fileName');
    item.docName = this.extractString(raw, 'docName');
    item.dirName = this.extractString(raw, 'dirName');
    item.name = this.extractString(raw, 'name');
    item.docType = this.extractString(raw, 'docType');
    item.fileType = this.extractString(raw, 'fileType');
    item.type = this.extractString(raw, 'type');
    item.fileExt = this.extractString(raw, 'fileExt');
    item.docExt = this.extractString(raw, 'docExt');
    item.dirId = this.extractString(raw, 'dirId');
    item.fileId = this.extractString(raw, 'fileId');
    item.id = this.extractString(raw, 'id');
    item.url = this.extractString(raw, 'url');
    item.objectName = this.extractString(raw, 'objectName');
    item.filePath = this.extractString(raw, 'filePath');
    item.fileSize = this.extractNumber(raw, 'fileSize');
    item.docSize = this.extractNumber(raw, 'docSize');
    item.size = this.extractNumber(raw, 'size');
    return item;
  }

  private findArrayText(raw: string, key: string): string {
    const marker = `"${key}"`;
    const keyIndex = raw.indexOf(marker);
    if (keyIndex < 0) {
      return '';
    }
    const colonIndex = raw.indexOf(':', keyIndex + marker.length);
    const arrayStart = raw.indexOf('[', colonIndex + 1);
    if (colonIndex < 0 || arrayStart < 0) {
      return '';
    }
    return this.balancedText(raw, arrayStart, '[', ']');
  }

  private findObjectText(raw: string, key: string): string {
    const marker = `"${key}"`;
    const keyIndex = raw.indexOf(marker);
    if (keyIndex < 0) {
      return '';
    }
    const colonIndex = raw.indexOf(':', keyIndex + marker.length);
    const objectStart = raw.indexOf('{', colonIndex + 1);
    if (colonIndex < 0 || objectStart < 0) {
      return '';
    }
    return this.balancedText(raw, objectStart, '{', '}');
  }

  private balancedText(raw: string, start: number, openChar: string, closeChar: string): string {
    let depth = 0;
    let inString = false;
    let escaped = false;
    for (let i = start; i < raw.length; i++) {
      const ch = raw.charAt(i);
      if (inString) {
        if (escaped) {
          escaped = false;
        } else if (ch === '\\') {
          escaped = true;
        } else if (ch === '"') {
          inString = false;
        }
        continue;
      }
      if (ch === '"') {
        inString = true;
      } else if (ch === openChar) {
        depth++;
      } else if (ch === closeChar) {
        depth--;
        if (depth === 0) {
          return raw.substring(start, i + 1);
        }
      }
    }
    return '';
  }

  private splitObjects(arrayText: string): string[] {
    const objects: string[] = [];
    let depth = 0;
    let inString = false;
    let escaped = false;
    let start = -1;
    for (let i = 0; i < arrayText.length; i++) {
      const ch = arrayText.charAt(i);
      if (inString) {
        if (escaped) {
          escaped = false;
        } else if (ch === '\\') {
          escaped = true;
        } else if (ch === '"') {
          inString = false;
        }
        continue;
      }
      if (ch === '"') {
        inString = true;
      } else if (ch === '{') {
        if (depth === 0) {
          start = i;
        }
        depth++;
      } else if (ch === '}') {
        depth--;
        if (depth === 0 && start >= 0) {
          objects.push(arrayText.substring(start, i + 1));
          start = -1;
        }
      }
    }
    return objects;
  }

  private firstQuotedValue(raw: string): string {
    const first = raw.indexOf('"');
    if (first < 0) {
      return '';
    }
    const second = raw.indexOf('"', first + 1);
    return second < 0 ? '' : raw.substring(first + 1, second);
  }

  private extractString(raw: string, key: string): string {
    const marker = `"${key}"`;
    const keyIndex = raw.indexOf(marker);
    if (keyIndex < 0) {
      return '';
    }
    const colonIndex = raw.indexOf(':', keyIndex + marker.length);
    const quoteIndex = raw.indexOf('"', colonIndex + 1);
    if (colonIndex < 0 || quoteIndex < 0) {
      return '';
    }
    const endIndex = raw.indexOf('"', quoteIndex + 1);
    return endIndex < 0 ? '' : raw.substring(quoteIndex + 1, endIndex);
  }

  private extractRaw(raw: string, key: string): string {
    const marker = `"${key}"`;
    const keyIndex = raw.indexOf(marker);
    if (keyIndex < 0) {
      return '';
    }
    const colonIndex = raw.indexOf(':', keyIndex + marker.length);
    if (colonIndex < 0) {
      return '';
    }
    let endIndex = raw.indexOf(',', colonIndex + 1);
    const braceIndex = raw.indexOf('}', colonIndex + 1);
    if (endIndex < 0 || (braceIndex >= 0 && braceIndex < endIndex)) {
      endIndex = braceIndex;
    }
    return endIndex < 0 ? '' : raw.substring(colonIndex + 1, endIndex).replace(/["\s]/g, '');
  }

  private extractNumber(raw: string, key: string): number {
    const text = this.extractRaw(raw, key);
    const value = Number.parseInt(text);
    return Number.isNaN(value) ? 0 : value;
  }

  private resultToString(result: string | Object | ArrayBuffer): string {
    if (typeof result === 'string') {
      return result;
    }
    if (result instanceof ArrayBuffer) {
      return this.arrayBufferToString(result);
    }
    return JSON.stringify(result);
  }

  private arrayBufferToString(buffer: ArrayBuffer): string {
    const bytes = new Uint8Array(buffer);
    let text = '';
    for (let i = 0; i < bytes.length; i++) {
      text += String.fromCharCode(bytes[i]);
    }
    return text;
  }

  private randomDigits(count: number): string {
    const digits = '0123456789';
    let value = '';
    for (let i = 0; i < count; i++) {
      value += digits.charAt(Math.floor(Math.random() * digits.length));
    }
    return value;
  }

  private async persistSession(): Promise<void> {
    if (this.onSessionChanged) {
      await this.onSessionChanged(copySession(this.session));
    }
  }
}
