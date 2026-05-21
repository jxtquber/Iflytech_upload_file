import { http } from '@kit.NetworkKit';
import { ApiResponse, CloudItem, SessionData } from '../model/Types';
import { HashUtil } from '../utils/HashUtil';
import { TextUtil } from '../utils/TextUtil';

const APP_KEY = 'dxk-pc';
const APP_SECRET = '2c8e320f948911eca3fafa163ec9';
const BASE_API = 'http://api.iflyink.com/xbew-api';
const ROOT_DIR_ID = '0';

type Params = Record<string, string>;

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
    this.session = { ...session };
  }

  async sendSmsCode(mobile: string): Promise<void> {
    const response = await this.postBeforeLogin(`${BASE_API}/common/sms/pushLogin`, { mobile });
    if (response.code !== 200) {
      throw new Error(`发送验证码失败: ${TextUtil.compact(response.raw)}`);
    }
  }

  async loginByCode(account: string, code: string): Promise<SessionData> {
    const response = await this.postBeforeLogin(`${BASE_API}/user/codeLogin`, { account, code });
    return this.handleLoginResponse(response, account);
  }

  async loginByPassword(): Promise<SessionData> {
    throw new Error('鸿蒙版暂未启用密码登录，请使用短信验证码登录');
  }

  async fetchCloudItems(dirId: string): Promise<CloudItem[]> {
    const response = await this.postWithSession(`${BASE_API}/note/doc/getCloudFileList`, {
      userId: this.session.userId,
      page: ROOT_DIR_ID,
      limit: '10000',
      type: '',
      dirId,
      name: '',
      sortField: 'updateTime',
      sortType: 'descending'
    });
    if (response.code !== 200) {
      throw new Error(TextUtil.compact(response.raw));
    }
    return this.extractObjectList(response.raw);
  }

  async getUploadUrl(objectName: string, size: number): Promise<string> {
    const response = await this.postWithSession(`${BASE_API}/common/common/getUploadUrl`, {
      userId: this.session.userId,
      dir: 'attachment',
      objectName,
      size: `${size}`,
      expiration: '86400',
      increment: ROOT_DIR_ID
    });
    if (response.code !== 200) {
      throw new Error(`获取上传地址失败: ${TextUtil.compact(response.raw)}`);
    }
    const data = this.parseJson(response.raw);
    return TextUtil.firstNonEmpty(
      this.nestedString(data, ['data', 'url']),
      this.nestedString(data, ['data', 'uploadUrl']),
      this.extractString(response.raw, 'url')
    );
  }

  async addCloudDoc(fileName: string, objectName: string, size: number): Promise<void> {
    const doc = JSON.stringify({
      docName: fileName,
      docExt: TextUtil.extension(fileName).replace('.', '').toLowerCase(),
      docType: TextUtil.extension(fileName).replace('.', '').toLowerCase(),
      url: `attachment/${objectName}`,
      docSize: size,
      thumbnail: ''
    });
    const response = await this.postWithSession(`${BASE_API}/note/doc/addDoc`, {
      userId: this.session.userId,
      doc,
      dirId: ROOT_DIR_ID,
      checkFileExist: 'true'
    });
    if (response.code !== 200) {
      throw new Error(`登记云盘失败: ${TextUtil.compact(response.raw)}`);
    }
  }

  async getDownloadUrl(item: CloudItem): Promise<string> {
    let objectName = TextUtil.firstNonEmpty(
      TextUtil.objString(item, 'url'),
      TextUtil.objString(item, 'objectName'),
      TextUtil.objString(item, 'filePath')
    );
    if (objectName.startsWith('attachment/')) {
      objectName = objectName.substring('attachment/'.length);
    }
    if (objectName.length === 0) {
      throw new Error('文件 objectName 为空');
    }
    const response = await this.postWithSession(`${BASE_API}/common/common/getDownloadUrl`, {
      userId: this.session.userId,
      dir: 'attachment',
      objectName,
      expiration: '86400',
      increment: ROOT_DIR_ID
    });
    if (response.code !== 200) {
      throw new Error(TextUtil.compact(response.raw));
    }
    return this.extractDownloadUrl(response.raw);
  }

  private async handleLoginResponse(response: ApiResponse, phone: string): Promise<SessionData> {
    if (response.code !== 200) {
      throw new Error(`登录失败: ${TextUtil.compact(response.raw)}`);
    }
    const root = this.parseJson(response.raw);
    const data = this.asRecord(root['data']);
    const detail = this.asRecord(data['detail']);
    const source = Object.keys(detail).length > 0 ? detail : (Object.keys(data).length > 0 ? data : root);

    const userId = TextUtil.firstNonEmpty(`${source['userId'] ?? ''}`, `${source['id'] ?? ''}`, this.extractString(response.raw, 'userId'));
    const userToken = TextUtil.firstNonEmpty(`${source['userToken'] ?? ''}`, this.extractString(response.raw, 'userToken'));
    const refreshToken = TextUtil.firstNonEmpty(`${source['refreshToken'] ?? ''}`, this.extractString(response.raw, 'refreshToken'));
    const sn = TextUtil.firstNonEmpty(`${source['sn'] ?? ''}`, this.extractString(response.raw, 'sn'));
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
    return { ...this.session };
  }

  private async postWithSession(url: string, params: Params): Promise<ApiResponse> {
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

  private async postBeforeLogin(url: string, params: Params): Promise<ApiResponse> {
    let response = await this.postSigned(url, params, this.session.auth, '');
    if (response.code === 401 && await this.refreshAccessToken()) {
      response = await this.postSigned(url, params, this.session.auth, '');
    }
    return response;
  }

  private async refreshAccessToken(): Promise<boolean> {
    const response = await this.postSigned(`${BASE_API}/auth/oauth/token`, {}, this.session.auth, this.session.userToken);
    if (response.code !== 200) {
      return false;
    }
    const data = this.parseJson(response.raw);
    const token = TextUtil.firstNonEmpty(
      `${data['access_token'] ?? ''}`,
      this.nestedString(data, ['data', 'access_token']),
      this.nestedString(data, ['data', 'token']),
      this.extractString(response.raw, 'access_token')
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
    const response = await this.postSigned(`${BASE_API}/user/refreshToken`, {
      userId: this.session.userId,
      refreshToken: this.session.refreshToken,
      sn: this.session.sn
    }, this.session.auth, this.session.userToken);
    if (response.code !== 200) {
      return false;
    }
    const data = this.parseJson(response.raw);
    const userToken = TextUtil.firstNonEmpty(
      this.nestedString(data, ['data', 'detail', 'userToken']),
      this.nestedString(data, ['data', 'userToken']),
      this.extractString(response.raw, 'userToken')
    );
    if (userToken.length === 0) {
      return false;
    }
    this.session.userToken = userToken;
    this.session.refreshToken = TextUtil.firstNonEmpty(
      this.nestedString(data, ['data', 'detail', 'refreshToken']),
      this.nestedString(data, ['data', 'refreshToken']),
      this.extractString(response.raw, 'refreshToken'),
      this.session.refreshToken
    );
    this.session.sn = TextUtil.firstNonEmpty(
      this.nestedString(data, ['data', 'detail', 'sn']),
      this.nestedString(data, ['data', 'sn']),
      this.extractString(response.raw, 'sn'),
      this.session.sn
    );
    await this.persistSession();
    return true;
  }

  private async postSigned(url: string, params: Params, auth: string, userToken: string): Promise<ApiResponse> {
    const signed: Params = { ...params };
    signed['istv'] = 's';
    const timestamp = `${Date.now()}`;
    signed['timestamp'] = timestamp;
    signed['appKey'] = APP_KEY;
    signed['nonce'] = HashUtil.md5Text(`${timestamp}${this.randomDigits(10)}`);
    signed['sign'] = this.sign(signed);
    const request = http.createHttp();
    try {
      const response = await request.request(url, {
        method: http.RequestMethod.POST,
        connectTimeout: 30000,
        readTimeout: 180000,
        header: this.headers(auth, userToken, 'application/x-www-form-urlencoded; charset=utf-8;'),
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
        header: { 'Content-Type': '' },
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

  private sign(params: Params): string {
    const keys = Object.keys(params).filter((key) => key !== 'sign' && params[key].length > 0).sort();
    const pairs: string[] = keys.map((key) => `${key}=${params[key]}`);
    pairs.push(`secret=${APP_SECRET}`);
    return HashUtil.sha256Text(pairs.join('&')).toUpperCase();
  }

  private headers(auth: string, userToken: string, contentType: string): Record<string, string> {
    const headers: Record<string, string> = {
      'Content-Type': contentType,
      'ainoteVersion': ''
    };
    if (auth.length > 0) {
      headers['Authorization'] = auth;
    }
    if (userToken.length > 0) {
      headers['userToken'] = userToken;
    }
    return headers;
  }

  private formEncode(params: Params): string {
    return Object.keys(params)
      .map((key) => `${encodeURIComponent(key)}=${encodeURIComponent(params[key])}`)
      .join('&');
  }

  private responseCode(raw: string, fallback: number): number {
    const data = this.parseJson(raw);
    const code = data['code'];
    if (typeof code === 'number') {
      return code;
    }
    const text = this.extractRaw(raw, 'code');
    const parsed = Number.parseInt(text);
    return Number.isNaN(parsed) ? fallback : parsed;
  }

  private extractObjectList(raw: string): CloudItem[] {
    const root = this.parseJson(raw);
    return this.collectObjects(root['data']);
  }

  private collectObjects(value: Object | string | number | boolean | null | undefined): CloudItem[] {
    if (Array.isArray(value)) {
      return value.filter((item) => typeof item === 'object' && item !== null) as CloudItem[];
    }
    const record = this.asRecord(value);
    const list = record['list'] ?? record['records'] ?? record['data'];
    if (Array.isArray(list)) {
      return list.filter((item) => typeof item === 'object' && item !== null) as CloudItem[];
    }
    return Object.keys(record).length > 0 ? [record as CloudItem] : [];
  }

  private extractDownloadUrl(raw: string): string {
    const root = this.parseJson(raw);
    const data = this.asRecord(root['data']);
    const url = data['url'];
    if (Array.isArray(url) && url.length > 0) {
      return `${url[0]}`;
    }
    return TextUtil.firstNonEmpty(`${url ?? ''}`, this.extractString(raw, 'url'));
  }

  private nestedString(root: Record<string, Object | string | number | boolean | null | undefined>, keys: string[]): string {
    let value: Object | string | number | boolean | null | undefined = root;
    for (const key of keys) {
      const record = this.asRecord(value);
      value = record[key];
    }
    return value === undefined || value === null ? '' : `${value}`;
  }

  private parseJson(raw: string): Record<string, Object | string | number | boolean | null | undefined> {
    try {
      return JSON.parse(raw) as Record<string, Object | string | number | boolean | null | undefined>;
    } catch (_) {
      return {};
    }
  }

  private asRecord(value: Object | string | number | boolean | null | undefined): Record<string, Object | string | number | boolean | null | undefined> {
    if (typeof value === 'object' && value !== null && !Array.isArray(value)) {
      return value as Record<string, Object | string | number | boolean | null | undefined>;
    }
    return {};
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
      value += digits[Math.floor(Math.random() * digits.length)];
    }
    return value;
  }

  private async persistSession(): Promise<void> {
    if (this.onSessionChanged) {
      await this.onSessionChanged({ ...this.session });
    }
  }
}
