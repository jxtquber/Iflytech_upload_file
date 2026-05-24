import { http } from '@kit.NetworkKit';
import { ApiResponse, CloudItem, copySession, NoteDir, NoteImage, NoteItem, SessionData } from '../model/Types';
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

  async deleteCloudDoc(item: CloudItem): Promise<void> {
    if (TextUtil.isCloudDir(item)) {
      throw new Error('当前项是文件夹，不能按文件删除');
    }
    const fileId = TextUtil.firstNonEmpty(item.fileId, item.id);
    if (fileId.length === 0) {
      throw new Error('文件 ID 为空，无法删除');
    }
    const docList: string[] = [];
    const ebookList: string[] = [];
    const picList: string[] = [];
    const bucket = this.cloudDeleteBucket(item);
    if (bucket === 'image') {
      picList.push(fileId);
    } else if (bucket === 'ebook') {
      ebookList.push(fileId);
    } else {
      docList.push(fileId);
    }

    const response = await this.postWithSession(`${BASE_API}/note/doc/deleteDirFile`, [
      new Param('userId', this.session.userId),
      new Param('dirList', '[]'),
      new Param('docList', JSON.stringify(docList)),
      new Param('ebookList', JSON.stringify(ebookList)),
      new Param('picList', JSON.stringify(picList))
    ]);
    if (response.code !== 200) {
      throw new Error(`删除云文档失败: ${TextUtil.compact(response.raw)}`);
    }
  }

  async fetchNoteDirs(): Promise<NoteDir[]> {
    const response = await this.postWithSession(`${BASE_API}/note/dir/getListAllByUserIdPc`, [
      new Param('userId', this.session.userId),
      new Param('orderField', 'create_time'),
      new Param('orderType', 'desc'),
      new Param('synTime', '0')
    ]);
    if (response.code !== 200) {
      throw new Error(`加载笔记文件夹失败: ${TextUtil.compact(response.raw)}`);
    }
    return this.extractNoteDirList(response.raw);
  }

  async fetchNotes(): Promise<NoteItem[]> {
    const response = await this.postWithSession(`${BASE_API}/note/dxk/getAllNoteByPage`, [
      new Param('userId', this.session.userId),
      new Param('page', '1'),
      new Param('sn', this.session.sn),
      new Param('supportType', '1,2,10,21,20'),
      new Param('syntime', '0')
    ]);
    if (response.code !== 200) {
      throw new Error(`加载笔记失败: ${TextUtil.compact(response.raw)}`);
    }
    return this.extractNoteList(response.raw);
  }

  async fetchNoteDetail(noteId: string): Promise<NoteItem> {
    const response = await this.postWithSession(`${BASE_API}/note/dxk/getNoteDetail`, [
      new Param('id', noteId)
    ]);
    if (response.code !== 200) {
      throw new Error(`加载笔记详情失败: ${TextUtil.compact(response.raw)}`);
    }
    if (this.extractRaw(response.raw, 'data') === 'null') {
      throw new Error('笔记详情为空');
    }
    const dataText = this.findObjectText(response.raw, 'data');
    if (dataText.length === 0) {
      throw new Error('笔记详情为空');
    }
    return this.noteDetailFromJson(dataText);
  }

  async fetchNoteImageUrl(objectName: string): Promise<string> {
    const response = await this.postWithSession(`${BASE_API}/common/common/getDownloadUrl`, [
      new Param('userId', this.session.userId),
      new Param('dir', 'image'),
      new Param('objectName', objectName),
      new Param('expiration', '86400'),
      new Param('increment', ROOT_DIR_ID)
    ]);
    if (response.code !== 200) {
      return '';
    }
    return this.extractDownloadUrl(response.raw);
  }

  private cloudDeleteBucket(item: CloudItem): string {
    const type = TextUtil.firstNonEmpty(item.fileType, item.docType, item.type).toLowerCase();
    const ext = TextUtil.firstNonEmpty(
      item.fileExt,
      item.docExt,
      TextUtil.extension(TextUtil.cloudName(item)).replace('.', '')
    ).toLowerCase();

    if (type === 'image' || ext === 'jpg' || ext === 'jpeg' || ext === 'png') {
      return 'image';
    }
    if (type === 'ebook' || ext === 'epub' || ext === 'mobi' || ext === 'azw3') {
      return 'ebook';
    }
    return 'office';
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

  private extractNoteDirList(raw: string): NoteDir[] {
    let arrayText = this.findArrayText(raw, 'data');
    if (arrayText.length === 0) {
      arrayText = this.findArrayText(raw, 'list');
    }
    const dirs: NoteDir[] = [];
    if (arrayText.length === 0) {
      return dirs;
    }
    const objects = this.splitObjects(arrayText);
    for (const objectText of objects) {
      this.collectNoteDirs(objectText, ROOT_DIR_ID, dirs);
    }
    return dirs;
  }

  private collectNoteDirs(raw: string, fallbackParentId: string, dirs: NoteDir[]): void {
    const dir = this.noteDirFromJson(raw, fallbackParentId);
    if (dir.dirId.length > 0) {
      const index = dirs.findIndex((item: NoteDir) => item.dirId === dir.dirId);
      if (index < 0) {
        dirs.push(dir);
      } else {
        this.mergeNoteDir(dirs[index], dir, fallbackParentId);
      }
    }
    const parentId = TextUtil.firstNonEmpty(dir.dirId, fallbackParentId, ROOT_DIR_ID);
    this.collectNoteDirChildren(raw, 'children', parentId, dirs);
    this.collectNoteDirChildren(raw, 'childList', parentId, dirs);
    this.collectNoteDirChildren(raw, 'childs', parentId, dirs);
    this.collectNoteDirChildren(raw, 'subDirs', parentId, dirs);
    this.collectNoteDirChildren(raw, 'dirList', parentId, dirs);
    this.collectNoteDirChildren(raw, 'list', parentId, dirs);
  }

  private mergeNoteDir(target: NoteDir, source: NoteDir, fallbackParentId: string): void {
    if (target.parentDirId.length === 0 ||
      target.parentDirId === ROOT_DIR_ID ||
      target.parentDirId === target.dirId ||
      target.parentDirId === fallbackParentId) {
      target.parentDirId = source.parentDirId;
    }
    target.dirName = TextUtil.firstNonEmpty(target.dirName, source.dirName);
    target.level = target.level > 0 ? target.level : source.level;
    target.count = target.count > 0 ? target.count : source.count;
  }

  private collectNoteDirChildren(raw: string, key: string, parentId: string, dirs: NoteDir[]): void {
    const arrayText = this.findArrayText(raw, key);
    if (arrayText.length === 0) {
      return;
    }
    const objects = this.splitObjects(arrayText);
    for (const objectText of objects) {
      this.collectNoteDirs(objectText, parentId, dirs);
    }
  }

  private noteDirFromJson(raw: string, fallbackParentId: string): NoteDir {
    const dir = new NoteDir();
    dir.dirId = TextUtil.firstNonEmpty(
      this.extractString(raw, 'dirId'),
      this.extractString(raw, 'localId'),
      this.extractString(raw, 'id'),
      this.extractString(raw, 'cdirId')
    );
    dir.parentDirId = TextUtil.firstNonEmpty(
      this.extractString(raw, 'parentDirId'),
      this.extractString(raw, 'parentId'),
      this.extractString(raw, 'parentFolderId'),
      this.extractString(raw, 'parentLocalId'),
      this.extractString(raw, 'parentCdirId'),
      this.extractString(raw, 'pid'),
      this.extractString(raw, 'pId'),
      fallbackParentId,
      ROOT_DIR_ID
    );
    dir.dirName = TextUtil.firstNonEmpty(
      this.extractString(raw, 'dirName'),
      this.extractString(raw, 'name'),
      this.extractString(raw, 'label'),
      '未命名文件夹'
    );
    dir.level = this.extractNumber(raw, 'level');
    dir.count = this.extractNumber(raw, 'count');
    return dir;
  }

  private extractNoteList(raw: string): NoteItem[] {
    let arrayText = this.findArrayText(raw, 'data');
    if (arrayText.length === 0) {
      arrayText = this.findArrayText(raw, 'list');
    }
    const notes: NoteItem[] = [];
    if (arrayText.length === 0) {
      return notes;
    }
    const objects = this.splitObjects(arrayText);
    for (const objectText of objects) {
      notes.push(this.noteItemFromJson(objectText));
    }
    return notes;
  }

  private noteItemFromJson(raw: string): NoteItem {
    const note = new NoteItem();
    note.noteId = TextUtil.firstNonEmpty(this.extractString(raw, 'noteId'), this.extractString(raw, 'id'));
    note.noteName = TextUtil.firstNonEmpty(this.extractString(raw, 'noteName'), this.extractString(raw, 'name'), '未命名笔记');
    note.type = this.extractString(raw, 'type');
    note.dir = TextUtil.firstNonEmpty(this.extractString(raw, 'dir'), this.extractString(raw, 'cdirId'), ROOT_DIR_ID);
    note.dirName = this.extractString(raw, 'dirName');
    note.summary = this.extractString(raw, 'summary');
    note.contentText = this.extractString(raw, 'contentText');
    note.html = this.extractString(raw, 'html');
    note.content = this.extractString(raw, 'content');
    note.tempId = this.extractString(raw, 'tempId');
    note.createTime = this.extractNumber(raw, 'createTime');
    note.updateTime = this.extractNumber(raw, 'updateTime');
    note.isEncrypt = this.extractNumber(raw, 'isEncrypt');
    if (note.html.length === 0 && note.content.length > 0) {
      note.html = this.extractString(note.content, 'html');
    }
    if (note.contentText.length === 0 && note.content.length > 0) {
      note.contentText = this.extractString(note.content, 'contentText');
    }
    return note;
  }

  private noteDetailFromJson(raw: string): NoteItem {
    const note = this.noteItemFromJson(raw);
    const propText = this.findObjectText(raw, 'prop');
    if (propText.length > 0) {
      const prop = this.noteItemFromJson(propText);
      note.noteId = TextUtil.firstNonEmpty(prop.noteId, note.noteId);
      note.noteName = TextUtil.firstNonEmpty(prop.noteName, note.noteName);
      note.type = TextUtil.firstNonEmpty(prop.type, note.type);
      note.dir = TextUtil.firstNonEmpty(prop.dir, note.dir);
      note.dirName = TextUtil.firstNonEmpty(prop.dirName, note.dirName);
      note.summary = TextUtil.firstNonEmpty(prop.summary, note.summary);
      note.tempId = TextUtil.firstNonEmpty(prop.tempId, note.tempId);
      note.createTime = prop.createTime > 0 ? prop.createTime : note.createTime;
      note.updateTime = prop.updateTime > 0 ? prop.updateTime : note.updateTime;
      note.isEncrypt = prop.isEncrypt > 0 ? prop.isEncrypt : note.isEncrypt;
    }

    const noteText = this.findObjectText(raw, 'note');
    if (noteText.length > 0) {
      const body = this.noteItemFromJson(noteText);
      note.content = TextUtil.firstNonEmpty(body.content, note.content);
      note.html = TextUtil.firstNonEmpty(body.html, note.html);
      note.contentText = TextUtil.firstNonEmpty(body.contentText, note.contentText);
      note.summary = TextUtil.firstNonEmpty(body.summary, note.summary);
    }

    if (note.noteName === '未命名笔记') {
      note.noteName = TextUtil.firstNonEmpty(this.extractString(raw, 'noteName'), '未命名笔记');
    }
    return note;
  }

  extractNoteImages(note: NoteItem): NoteImage[] {
    const content = note.content.length > 0 ? note.content : note.html;
    const names: string[] = [];
    this.collectImageNames(content, 'image.png', names);
    this.collectImageNames(content, 'image.jpg', names);
    this.collectImageNames(content, 'thumbnail.jpeg', names);
    const images: NoteImage[] = [];
    for (const name of names) {
      const image = new NoteImage();
      image.objectName = name;
      images.push(image);
    }
    return images;
  }

  private collectImageNames(raw: string, key: string, names: string[]): void {
    let searchFrom = 0;
    while (searchFrom < raw.length) {
      const marker = `"${key}"`;
      const keyIndex = raw.indexOf(marker, searchFrom);
      if (keyIndex < 0) {
        return;
      }
      const colonIndex = raw.indexOf(':', keyIndex + marker.length);
      const valueStart = colonIndex < 0 ? -1 : this.findValueStart(raw, colonIndex + 1);
      if (valueStart >= 0 && raw.charAt(valueStart) === '"') {
        const value = this.readQuotedString(raw, valueStart);
        if (value.length > 0 && names.indexOf(value) < 0) {
          names.push(value);
        }
        searchFrom = valueStart + value.length + 2;
      } else {
        searchFrom = keyIndex + marker.length;
      }
    }
  }

  private findArrayText(raw: string, key: string): string {
    const colonIndex = this.findFieldColon(raw, key);
    if (colonIndex < 0) {
      return '';
    }
    const arrayStart = this.findValueStart(raw, colonIndex + 1);
    if (arrayStart < 0 || raw.charAt(arrayStart) !== '[') {
      return '';
    }
    return this.balancedText(raw, arrayStart, '[', ']');
  }

  private findObjectText(raw: string, key: string): string {
    const colonIndex = this.findFieldColon(raw, key);
    if (colonIndex < 0) {
      return '';
    }
    const objectStart = this.findValueStart(raw, colonIndex + 1);
    if (objectStart < 0 || raw.charAt(objectStart) !== '{') {
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
    const valueStart = this.findValueStart(raw, 1);
    if (valueStart < 0 || raw.charAt(valueStart) !== '"') {
      return '';
    }
    return this.readQuotedString(raw, valueStart);
  }

  private extractString(raw: string, key: string): string {
    const colonIndex = this.findFieldColon(raw, key);
    if (colonIndex < 0) {
      return '';
    }
    const valueStart = this.findValueStart(raw, colonIndex + 1);
    if (valueStart < 0) {
      return '';
    }
    if (raw.charAt(valueStart) === '"') {
      return this.readQuotedString(raw, valueStart);
    }
    const rawValue = this.readRawValue(raw, valueStart);
    return rawValue === 'null' ? '' : rawValue;
  }

  private extractRaw(raw: string, key: string): string {
    const colonIndex = this.findFieldColon(raw, key);
    if (colonIndex < 0) {
      return '';
    }
    const valueStart = this.findValueStart(raw, colonIndex + 1);
    if (valueStart < 0) {
      return '';
    }
    return this.readRawValue(raw, valueStart).replace(/["\s]/g, '');
  }

  private findFieldColon(raw: string, key: string): number {
    const marker = `"${key}"`;
    let searchFrom = 0;
    while (searchFrom < raw.length) {
      const keyIndex = raw.indexOf(marker, searchFrom);
      if (keyIndex < 0) {
        return -1;
      }
      const colonIndex = raw.indexOf(':', keyIndex + marker.length);
      if (colonIndex < 0) {
        return -1;
      }
      const between = raw.substring(keyIndex + marker.length, colonIndex);
      if (between.trim().length === 0) {
        return colonIndex;
      }
      searchFrom = keyIndex + marker.length;
    }
    return -1;
  }

  private findValueStart(raw: string, start: number): number {
    for (let i = start; i < raw.length; i++) {
      if (!this.isWhitespace(raw.charAt(i))) {
        return i;
      }
    }
    return -1;
  }

  private readQuotedString(raw: string, quoteIndex: number): string {
    let value = '';
    let escaped = false;
    for (let i = quoteIndex + 1; i < raw.length; i++) {
      const ch = raw.charAt(i);
      if (escaped) {
        if (ch === 'u' && i + 4 < raw.length) {
          const code = Number.parseInt(raw.substring(i + 1, i + 5), 16);
          if (!Number.isNaN(code)) {
            value += String.fromCharCode(code);
            i += 4;
          } else {
            value += ch;
          }
        } else {
          value += this.unescapeJsonChar(ch);
        }
        escaped = false;
      } else if (ch === '\\') {
        escaped = true;
      } else if (ch === '"') {
        return value;
      } else {
        value += ch;
      }
    }
    return '';
  }

  private unescapeJsonChar(ch: string): string {
    if (ch === '"' || ch === '\\' || ch === '/') {
      return ch;
    }
    if (ch === 'b') {
      return '\b';
    }
    if (ch === 'f') {
      return '\f';
    }
    if (ch === 'n') {
      return '\n';
    }
    if (ch === 'r') {
      return '\r';
    }
    if (ch === 't') {
      return '\t';
    }
    return ch;
  }

  private readRawValue(raw: string, start: number): string {
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
      } else if (ch === ',' || ch === '}' || ch === ']') {
        return raw.substring(start, i).trim();
      }
    }
    return raw.substring(start).trim();
  }

  private isWhitespace(ch: string): boolean {
    return ch === ' ' || ch === '\n' || ch === '\r' || ch === '\t';
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
