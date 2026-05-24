import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';
import { AppTheme } from '../common/AppTheme';
import { CloudItem, copySession, EMPTY_SESSION, NoteDir, NoteDirDisplay, NoteImage, NoteItem, SelectedFile, SessionData } from '../model/Types';
import { ApiClient } from '../services/ApiClient';
import { FileService } from '../services/FileService';
import { NoteCacheService } from '../services/NoteCacheService';
import { SessionStore } from '../services/SessionStore';
import { TextUtil } from '../utils/TextUtil';

const ROOT_DIR_ID = '0';

@Entry
@Component
struct Index {
  private api: ApiClient = new ApiClient();
  private store?: SessionStore;
  private fileService?: FileService;
  private noteCache?: NoteCacheService;
  private loadedNoteDirs: NoteDir[] = [];

  @State session: SessionData = EMPTY_SESSION;
  @State phone: string = '';
  @State code: string = '';
  @State password: string = '';
  @State passwordLoginMode: boolean = true;
  @State loginMessage: string = '未登录';
  @State selectedFiles: SelectedFile[] = [];
  @State currentPage: number = 0;
  @State uploadPercent: number = 0;
  @State uploadMessage: string = '等待上传';
  @State uploading: boolean = false;
  @State cloudItems: CloudItem[] = [];
  @State cloudStatus: string = '等待加载云文档';
  @State cloudProgress: number = 0;
  @State cloudProgressMessage: string = '等待下载';
  @State currentCloudDirId: string = ROOT_DIR_ID;
  @State currentCloudDirName: string = '全部文件';
  @State cloudDirStack: string[] = [];
  @State cloudNameStack: string[] = [];
  @State cloudLoaded: boolean = false;
  @State noteDirs: NoteDir[] = [];
  @State notes: NoteItem[] = [];
  @State selectedNoteDirId: string = ROOT_DIR_ID;
  @State selectedNoteDirName: string = '全部笔记';
  @State noteStatus: string = '等待加载笔记';
  @State notesLoaded: boolean = false;
  @State noteRefreshing: boolean = false;
  @State noteDirPanelVisible: boolean = false;
  @State expandedNoteDirIds: string[] = [ROOT_DIR_ID];
  @State visibleNoteDirs: NoteDirDisplay[] = [];
  @State selectedNote?: NoteItem = undefined;
  @State noteImages: NoteImage[] = [];
  @State exitConfirmVisible: boolean = false;

  aboutToAppear(): void {
    const context = getContext(this) as common.UIAbilityContext;
    this.store = new SessionStore(context);
    this.fileService = new FileService(context, this.api);
    this.noteCache = new NoteCacheService(context);
    this.api.onSessionChanged = async (session: SessionData) => {
      this.session = copySession(session);
      await this.store?.save(session);
    };
    this.api.onLog = (message: string) => this.setMessage(message);
    this.loadSession();
  }

  private async loadSession(): Promise<void> {
    const session = await this.store?.load() ?? EMPTY_SESSION;
    this.session = copySession(session);
    this.phone = session.phone;
    this.api.setSession(session);
    this.loginMessage = session.userId.length > 0 ? `已登录，可上传文件到根目录` : '未登录';
    if (session.userId.length > 0 && this.currentPage === 0) {
      await this.loadNotes();
    }
  }

  private async sendSmsCode(): Promise<void> {
    const mobile = this.phone.trim();
    if (mobile.length === 0) {
      this.setMessage('请先填写手机号');
      return;
    }
    try {
      this.setMessage('正在发送验证码...');
      const savedSession = copySession(this.session);
      savedSession.phone = mobile;
      await this.store?.save(savedSession);
      await this.api.sendSmsCode(mobile);
      this.setMessage('验证码已发送，请查看短信');
    } catch (error) {
      this.setMessage(this.errorMessage('发送验证码失败', error));
    }
  }

  private async login(): Promise<void> {
    const mobile = this.phone.trim();
    if (mobile.length === 0) {
      this.setMessage('请先填写手机号');
      return;
    }
    try {
      if (this.passwordLoginMode) {
        if (this.password.length === 0) {
          this.setMessage('请填写密码');
          return;
        }
        this.setMessage('正在密码登录...');
        const session = await this.api.loginByPassword(mobile, this.password);
        this.session = copySession(session);
        this.api.setSession(session);
        this.setMessage(`登录成功，userId=${session.userId}`);
        return;
      }
      const smsCode = this.code.trim();
      if (smsCode.length === 0) {
        this.setMessage('请填写短信验证码');
        return;
      }
      this.setMessage('正在验证码登录...');
      const session = await this.api.loginByCode(mobile, smsCode);
      this.session = copySession(session);
      this.api.setSession(session);
      this.setMessage(`登录成功，userId=${session.userId}`);
    } catch (error) {
      this.setMessage(this.errorMessage('登录失败', error));
    }
  }

  private async logout(): Promise<void> {
    this.session = copySession(EMPTY_SESSION);
    this.api.setSession(this.session);
    await this.store?.clear();
    this.selectedFiles = [];
    this.cloudItems = [];
    this.cloudLoaded = false;
    this.notes = [];
    this.noteDirs = [];
    this.loadedNoteDirs = [];
    this.visibleNoteDirs = [];
    this.expandedNoteDirIds = [ROOT_DIR_ID];
    this.notesLoaded = false;
    this.selectedNote = undefined;
    this.uploadPercent = 0;
    this.uploadMessage = '等待上传';
    this.loginMessage = '未登录';
  }

  private async pickFiles(): Promise<void> {
    try {
      const files = await this.fileService?.pickFiles() ?? [];
      this.selectedFiles = files;
      this.uploadMessage = files.length > 0 ? `已选择 ${files.length} 个文件` : '未选择文件';
    } catch (error) {
      this.setMessage(this.errorMessage('选择文件失败', error));
    }
  }

  private uploadSelectedFiles(): void {
    if (this.selectedFiles.length === 0) {
      this.setMessage('请先选择文件');
      return;
    }
    if (this.uploading) {
      this.setMessage('正在上传，请稍等');
      return;
    }
    AlertDialog.show({
      title: '确认上传',
      message: `将 ${this.selectedFiles.length} 个文件上传到读写云盘根目录，确认继续吗？`,
      primaryButton: {
        value: '确认上传',
        action: () => {
          this.startUploadSelectedFiles();
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
        }
      }
    });
  }

  private async startUploadSelectedFiles(): Promise<void> {
    if (this.session.userId.length === 0 || this.session.userToken.length === 0) {
      this.setMessage('请先登录');
      return;
    }
    this.uploading = true;
    this.uploadPercent = 0;
    this.uploadMessage = '准备上传...';
    try {
      for (let i = 0; i < this.selectedFiles.length; i++) {
        await this.fileService?.uploadFile(this.selectedFiles[i], i, this.selectedFiles.length, (percent: number, message: string) => {
          this.uploadPercent = percent;
          this.uploadMessage = message;
          this.setMessage(message);
        });
      }
      this.uploadPercent = 100;
      this.uploadMessage = '全部上传完成';
      promptAction.showToast({ message: '上传完成' });
      this.cloudLoaded = false;
    } catch (error) {
      this.setMessage(this.errorMessage('上传失败', error));
    } finally {
      this.uploading = false;
    }
  }

  private async switchPage(page: number): Promise<void> {
    this.currentPage = page;
    if (page === 0 && this.session.userId.length > 0 && !this.notesLoaded) {
      await this.loadNotes();
    }
    if (page === 2 && this.session.userId.length > 0 && !this.cloudLoaded) {
      await this.loadCloud(ROOT_DIR_ID, '全部文件', true);
    }
  }

  private async loadCloud(dirId: string, dirName: string, resetStack: boolean): Promise<void> {
    if (this.session.userId.length === 0) {
      this.cloudStatus = '请先登录';
      return;
    }
    if (resetStack) {
      this.cloudDirStack = [];
      this.cloudNameStack = [];
    }
    this.currentCloudDirId = dirId;
    this.currentCloudDirName = dirName;
    this.cloudStatus = '正在加载云文档...';
    try {
      const items = await this.api.fetchCloudItems(dirId);
      this.cloudItems = items;
      this.cloudLoaded = true;
      this.cloudStatus = `已加载 ${items.length} 项`;
    } catch (error) {
      this.cloudStatus = this.errorMessage('云文档加载失败', error);
    }
  }

  private async openCloudDir(item: CloudItem): Promise<void> {
    const newDirStack = this.cloudDirStack.slice();
    const newNameStack = this.cloudNameStack.slice();
    newDirStack.push(this.currentCloudDirId);
    newNameStack.push(this.currentCloudDirName);
    this.cloudDirStack = newDirStack;
    this.cloudNameStack = newNameStack;
    const dirId = TextUtil.firstNonEmpty(
      TextUtil.objString(item, 'dirId'),
      TextUtil.objString(item, 'fileId'),
      TextUtil.objString(item, 'id'),
      ROOT_DIR_ID
    );
    await this.loadCloud(dirId, TextUtil.cloudName(item), false);
  }

  private async goCloudParent(): Promise<void> {
    if (this.cloudDirStack.length === 0) {
      this.cloudStatus = '已在根目录';
      return;
    }
    const dirs = this.cloudDirStack.slice();
    const names = this.cloudNameStack.slice();
    const dirId = dirs.pop() ?? ROOT_DIR_ID;
    const dirName = names.pop() ?? '全部文件';
    this.cloudDirStack = dirs;
    this.cloudNameStack = names;
    await this.loadCloud(dirId, dirName, false);
  }

  private async loadNotes(): Promise<void> {
    if (this.session.userId.length === 0) {
      this.noteStatus = '请先登录';
      return;
    }
    this.noteStatus = '正在加载笔记文件夹...';
    try {
      const dirs = await this.api.fetchNoteDirs();
      this.loadedNoteDirs = dirs;
      this.noteDirs = [this.noteRootDir()].concat(this.mergeNoteDirs(dirs, []));
      this.rebuildVisibleNoteDirs();
      this.notes = [];
      this.notesLoaded = true;
      this.noteStatus = `已加载 ${this.noteDirs.length - 1} 个文件夹，请选择文件夹`;
    } catch (error) {
      this.noteStatus = this.errorMessage('笔记加载失败', error);
    }
  }

  private async loadSelectedFolderNoteIndexes(): Promise<void> {
    if (this.session.userId.length === 0) {
      this.noteStatus = '请先登录';
      return;
    }
    if (this.selectedNoteDirId === ROOT_DIR_ID) {
      this.notes = [];
      this.noteStatus = `已加载 ${this.noteDirs.length - 1} 个文件夹，请选择具体文件夹`;
      return;
    }
    this.noteStatus = '正在加载当前文件夹笔记...';
    try {
      const indexes = await this.api.fetchNotes();
      this.noteDirs = [this.noteRootDir()].concat(this.mergeNoteDirs(this.loadedNoteDirs, indexes));
      this.rebuildVisibleNoteDirs();
      const targetIndexes = this.filterNotesForSelectedDir(indexes);
      this.notes = await this.loadNotesWithCache(targetIndexes, false);
      this.noteStatus = `已加载 ${this.notes.length} 条笔记`;
    } catch (error) {
      this.noteStatus = this.errorMessage('笔记加载失败', error);
    }
  }

  private async refreshCurrentFolderNotes(): Promise<void> {
    if (this.noteRefreshing) {
      promptAction.showToast({ message: '正在刷新，请稍等' });
      return;
    }
    if (this.session.userId.length === 0) {
      this.noteStatus = '请先登录';
      promptAction.showToast({ message: '请先登录' });
      return;
    }
    this.noteRefreshing = true;
    this.noteStatus = '正在刷新当前文件夹...';
    try {
      if (this.selectedNoteDirId === ROOT_DIR_ID) {
        await this.loadNotes();
        await this.reloadCurrentNoteListAfterRefresh();
        promptAction.showToast({ message: '文件夹列表刷新成功' });
        return;
      }
      const indexes = await this.api.fetchNotes();
      this.noteDirs = [this.noteRootDir()].concat(this.mergeNoteDirs(this.loadedNoteDirs, indexes));
      this.rebuildVisibleNoteDirs();
      const targetIndexes = this.filterNotesForSelectedDir(indexes);
      const targetIds = targetIndexes.map((note: NoteItem) => note.noteId);
      const refreshed = await this.loadNotesWithCache(targetIndexes, true, targetIds);
      this.notes = refreshed;
      this.notesLoaded = true;
      await this.reloadCurrentNoteListAfterRefresh();
      this.noteStatus = `已刷新 ${targetIds.length} 条笔记`;
      promptAction.showToast({ message: `刷新成功，共 ${targetIds.length} 条笔记` });
    } catch (error) {
      const message = this.errorMessage('刷新失败', error);
      this.noteStatus = message;
      promptAction.showToast({ message });
    } finally {
      this.noteRefreshing = false;
    }
  }

  private async reloadCurrentNoteListAfterRefresh(): Promise<void> {
    if (this.session.userId.length === 0) {
      return;
    }
    const indexes = await this.api.fetchNotes();
    if (this.selectedNoteDirId === ROOT_DIR_ID) {
      this.notes = await this.loadNotesWithCache(indexes, true, indexes.map((note: NoteItem) => note.noteId));
    } else {
      const targetIndexes = this.filterNotesForSelectedDir(indexes);
      this.notes = await this.loadNotesWithCache(targetIndexes, true, targetIndexes.map((note: NoteItem) => note.noteId));
    }
    this.notesLoaded = true;
  }

  private async loadNotesWithCache(notes: NoteItem[], forceRefresh: boolean, targetIds: string[] = []): Promise<NoteItem[]> {
    const enriched: NoteItem[] = [];
    for (const note of notes) {
      const shouldRefresh = forceRefresh && (targetIds.length === 0 || targetIds.indexOf(note.noteId) >= 0);
      try {
        const cached = await this.noteCache?.load(this.session.userId, note.noteId);
        if (!shouldRefresh) {
          enriched.push(cached ? this.mergeNoteItem(note, cached) : note);
          continue;
        }
        const detail = await this.api.fetchNoteDetail(note.noteId);
        const merged = this.mergeNoteItem(note, detail);
        await this.noteCache?.save(this.session.userId, merged);
        enriched.push(merged);
      } catch (error) {
        const cached = await this.noteCache?.load(this.session.userId, note.noteId);
        enriched.push(cached ? this.mergeNoteItem(note, cached) : note);
      }
    }
    return enriched;
  }

  private mergeNoteItem(base: NoteItem, detail: NoteItem): NoteItem {
    const note = new NoteItem();
    note.noteId = TextUtil.firstNonEmpty(detail.noteId, base.noteId);
    note.noteName = TextUtil.firstNonEmpty(detail.noteName, base.noteName);
    note.type = TextUtil.firstNonEmpty(detail.type, base.type);
    note.dir = TextUtil.firstNonEmpty(detail.dir, base.dir);
    note.dirName = TextUtil.firstNonEmpty(detail.dirName, base.dirName);
    note.summary = TextUtil.firstNonEmpty(detail.summary, base.summary);
    note.contentText = TextUtil.firstNonEmpty(detail.contentText, base.contentText);
    note.html = TextUtil.firstNonEmpty(detail.html, base.html);
    note.content = TextUtil.firstNonEmpty(detail.content, base.content);
    note.tempId = TextUtil.firstNonEmpty(detail.tempId, base.tempId);
    note.createTime = detail.createTime > 0 ? detail.createTime : base.createTime;
    note.updateTime = detail.updateTime > 0 ? detail.updateTime : base.updateTime;
    note.isEncrypt = detail.isEncrypt > 0 ? detail.isEncrypt : base.isEncrypt;
    return note;
  }

  private mergeNoteDirs(dirs: NoteDir[], notes: NoteItem[]): NoteDir[] {
    const merged: NoteDir[] = [];
    for (const source of dirs) {
      if (source.dirId.length === 0 || source.dirId === ROOT_DIR_ID) {
        continue;
      }
      const dir = new NoteDir();
      dir.dirId = source.dirId;
      dir.parentDirId = this.normalizeNoteParentId(source.parentDirId);
      dir.dirName = source.dirName;
      dir.level = source.level;
      dir.count = source.count;
      merged.push(dir);
    }
    for (const note of notes) {
      if (note.dir.length === 0 || note.dir === ROOT_DIR_ID) {
        continue;
      }
      if (merged.findIndex((dir: NoteDir) => dir.dirId === note.dir) >= 0) {
        continue;
      }
      const dir = new NoteDir();
      dir.dirId = note.dir;
      dir.parentDirId = ROOT_DIR_ID;
      dir.dirName = TextUtil.firstNonEmpty(note.dirName, '未分类');
      merged.push(dir);
    }
    this.rebuildNoteDirParentsByLevel(merged);
    const dirIds = [ROOT_DIR_ID].concat(merged.map((dir: NoteDir) => dir.dirId));
    for (let i = 0; i < merged.length; i++) {
      if (merged[i].parentDirId.length === 0 ||
        merged[i].parentDirId === merged[i].dirId ||
        merged[i].parentDirId === 'Root' ||
        merged[i].parentDirId === 'root' ||
        merged[i].parentDirId === '-1' ||
        merged[i].parentDirId === 'null' ||
        dirIds.indexOf(merged[i].parentDirId) < 0) {
        merged[i].parentDirId = ROOT_DIR_ID;
      }
    }
    return merged;
  }

  private rebuildNoteDirParentsByLevel(dirs: NoteDir[]): void {
    const knownIds = [ROOT_DIR_ID].concat(dirs.map((dir: NoteDir) => dir.dirId));
    const stack: NoteDir[] = [];
    for (let i = 0; i < dirs.length; i++) {
      const dir = dirs[i];
      const parentId = this.normalizeNoteParentId(dir.parentDirId);
      const parentExists = knownIds.indexOf(parentId) >= 0 && parentId !== dir.dirId;
      if (parentExists) {
        dir.parentDirId = parentId;
      } else if (dir.level > 0) {
        const parent = this.nearestNoteDirByLevel(stack, dir.level);
        dir.parentDirId = parent ? parent.dirId : ROOT_DIR_ID;
      } else {
        dir.parentDirId = ROOT_DIR_ID;
      }

      while (stack.length > 0 && stack[stack.length - 1].level >= dir.level) {
        stack.pop();
      }
      stack.push(dir);
    }
  }

  private nearestNoteDirByLevel(stack: NoteDir[], level: number): NoteDir | undefined {
    for (let i = stack.length - 1; i >= 0; i--) {
      if (stack[i].level < level) {
        return stack[i];
      }
    }
    return undefined;
  }

  private normalizeNoteParentId(parentId: string): string {
    if (parentId.length === 0 || parentId === 'Root' || parentId === 'root' || parentId === '-1' || parentId === 'null') {
      return ROOT_DIR_ID;
    }
    return parentId;
  }

  private selectNoteDir(dir: NoteDir, keepPanelOpen: boolean = false): void {
    this.selectedNoteDirId = dir.dirId;
    this.selectedNoteDirName = dir.dirName;
    this.noteDirPanelVisible = keepPanelOpen;
    this.rebuildVisibleNoteDirs();
    this.loadSelectedFolderNoteIndexes();
  }

  private toggleNoteDir(dir: NoteDir): void {
    this.toggleNoteDirById(dir.dirId);
  }

  private toggleNoteDirById(dirId: string): void {
    const ids = this.expandedNoteDirIds.slice();
    const index = ids.indexOf(dirId);
    if (index >= 0) {
      if (dirId !== ROOT_DIR_ID) {
        ids.splice(index, 1);
      }
    } else {
      ids.push(dirId);
    }
    this.expandedNoteDirIds = ids;
    this.rebuildVisibleNoteDirs();
  }

  private selectOrToggleNoteDir(row: NoteDirDisplay): void {
    const dir = this.noteDirFromDisplay(row);
    if (row.hasChildren) {
      this.toggleNoteDirById(row.dirId);
      this.selectNoteDir(dir, true);
      return;
    }
    this.selectNoteDir(dir);
  }

  private visibleNotes(): NoteItem[] {
    return this.notes;
  }

  private rebuildVisibleNoteDirs(): void {
    const rows: NoteDirDisplay[] = [];
    if (this.expandedNoteDirIds.indexOf(ROOT_DIR_ID) >= 0) {
      this.appendVisibleNoteDirRows(ROOT_DIR_ID, 1, rows);
    }
    this.visibleNoteDirs = rows;
  }

  private appendVisibleNoteDirRows(parentId: string, level: number, rows: NoteDirDisplay[]): void {
    const children = this.noteDirsByParent(parentId);
    for (const dir of children) {
      const row = new NoteDirDisplay();
      row.dirId = dir.dirId;
      row.parentDirId = dir.parentDirId;
      row.dirName = dir.dirName;
      row.level = level;
      row.hasChildren = this.noteDirHasChildren(dir);
      row.expanded = this.expandedNoteDirIds.indexOf(dir.dirId) >= 0;
      row.selected = this.selectedNoteDirId === dir.dirId;
      rows.push(row);
      if (row.expanded) {
        this.appendVisibleNoteDirRows(dir.dirId, level + 1, rows);
      }
    }
  }

  private filterNotesForSelectedDir(notes: NoteItem[]): NoteItem[] {
    if (this.selectedNoteDirId === ROOT_DIR_ID) {
      return notes;
    }
    return notes.filter((note: NoteItem) => note.dir === this.selectedNoteDirId);
  }

  private noteDirsByParent(parentId: string): NoteDir[] {
    return this.noteDirs.filter((dir: NoteDir) => dir.parentDirId === parentId && dir.dirId !== ROOT_DIR_ID);
  }

  private noteDirFromDisplay(row: NoteDirDisplay): NoteDir {
    const dir = new NoteDir();
    dir.dirId = row.dirId;
    dir.parentDirId = row.parentDirId;
    dir.dirName = row.dirName;
    dir.level = row.level;
    return dir;
  }

  private noteDirHasChildren(dir: NoteDir): boolean {
    return this.noteDirsByParent(dir.dirId).length > 0;
  }

  private noteDirExpanded(dir: NoteDir): boolean {
    return this.expandedNoteDirIds.indexOf(dir.dirId) >= 0;
  }

  private noteDirNameWidth(name: string): number {
    const length = Math.max(2, Math.min(name.length, 14));
    return length * 18 + 24;
  }

  private noteDirRowWidth(row: NoteDirDisplay): number {
    return row.level * 18 + 28 + 28 + this.noteDirNameWidth(row.dirName) + 12;
  }

  private noteDirRootRowWidth(): number {
    return 28 + 28 + this.noteDirNameWidth(this.noteRootDir().dirName) + 12;
  }

  private noteRootDir(): NoteDir {
    const root = new NoteDir();
    root.dirId = ROOT_DIR_ID;
    root.parentDirId = '';
    root.dirName = '全部笔记';
    return root;
  }

  private noteSummary(note: NoteItem): string {
    return TextUtil.firstNonEmpty(
      TextUtil.stripHtml(note.summary),
      TextUtil.stripHtml(note.contentText),
      TextUtil.stripHtml(note.html),
      '暂无内容'
    );
  }

  private noteTypeLabel(note: NoteItem): string {
    if (note.type === '1') {
      return '手写';
    }
    if (note.type === '2') {
      return '录音';
    }
    if (note.type === '20') {
      return '混合';
    }
    if (note.type === '21') {
      return '脑图';
    }
    return '文字';
  }

  private async openNote(note: NoteItem): Promise<void> {
    this.selectedNote = note;
    this.noteImages = [];
    this.noteStatus = '正在更新详情缓存...';
    try {
      const detail = await this.api.fetchNoteDetail(note.noteId);
      const merged = this.mergeNoteItem(note, detail);
      await this.noteCache?.save(this.session.userId, merged);
      this.selectedNote = merged;
      this.notes = this.notes.map((item: NoteItem) => item.noteId === merged.noteId ? merged : item);
      await this.loadNoteImages(merged);
      this.noteStatus = '详情已更新';
    } catch (error) {
      const cached = await this.noteCache?.load(this.session.userId, note.noteId);
      if (cached) {
        const merged = this.mergeNoteItem(note, cached);
        this.selectedNote = merged;
        await this.loadNoteImages(merged);
        this.noteStatus = '已从缓存打开';
      } else {
        this.noteStatus = this.errorMessage('详情加载失败', error);
      }
    }
  }

  private async loadNoteImages(note: NoteItem): Promise<void> {
    const images = this.api.extractNoteImages(note).slice(0, 6);
    for (let i = 0; i < images.length; i++) {
      images[i].url = await this.api.fetchNoteImageUrl(images[i].objectName);
    }
    this.noteImages = images.filter((image: NoteImage) => image.url.length > 0);
  }

  private closeNote(): void {
    this.selectedNote = undefined;
    this.noteImages = [];
  }

  private handleBack(): boolean {
    if (this.selectedNote) {
      this.closeNote();
      return true;
    }
    if (this.noteDirPanelVisible) {
      this.noteDirPanelVisible = false;
      return true;
    }
    if (this.currentPage !== 0) {
      this.switchPage(0);
      return true;
    }
    this.exitConfirmVisible = true;
    return true;
  }

  private confirmDownload(item: CloudItem): void {
    AlertDialog.show({
      title: '下载文件',
      message: `将获取文件下载链接并保存到应用沙盒：\n${TextUtil.cloudName(item)}`,
      primaryButton: {
        value: '确认下载',
        action: () => {
          this.downloadCloudFile(item);
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
        }
      }
    });
  }

  private confirmDelete(item: CloudItem): void {
    AlertDialog.show({
      title: '删除云文档',
      message: `确认删除这个文件吗？\n${TextUtil.cloudName(item)}`,
      primaryButton: {
        value: '确认删除',
        action: () => {
          this.deleteCloudFile(item);
        }
      },
      secondaryButton: {
        value: '取消',
        action: () => {
        }
      }
    });
  }

  private async deleteCloudFile(item: CloudItem): Promise<void> {
    try {
      this.cloudProgress = 0;
      this.cloudProgressMessage = `正在删除：${TextUtil.cloudName(item)}`;
      await this.api.deleteCloudDoc(item);
      this.cloudProgress = 100;
      this.cloudProgressMessage = '删除成功';
      promptAction.showToast({ message: '删除成功' });
      await this.loadCloud(this.currentCloudDirId, this.currentCloudDirName, false);
    } catch (error) {
      this.cloudProgressMessage = this.errorMessage('删除失败', error);
    }
  }

  private async downloadCloudFile(item: CloudItem): Promise<void> {
    try {
      this.cloudProgress = 0;
      this.cloudProgressMessage = '正在获取下载链接...';
      const url = await this.api.getDownloadUrl(item);
      if (url.length === 0) {
        throw new Error('下载链接为空');
      }
      this.cloudProgress = 30;
      this.cloudProgressMessage = `开始下载：${TextUtil.cloudName(item)}`;
      const data = await this.api.download(url);
      const path = await this.fileService?.saveToDownloads(TextUtil.cloudName(item), data) ?? '';
      this.cloudProgress = 100;
      this.cloudProgressMessage = `已保存到应用沙盒：${path}`;
    } catch (error) {
      this.cloudProgressMessage = this.errorMessage('下载失败', error);
    }
  }

  private setMessage(message: string): void {
    this.loginMessage = message;
  }

  private errorMessage(prefix: string, error: Object | string | undefined): string {
    const message = error instanceof Error ? error.message : `${error ?? ''}`;
    return `${prefix}: ${message}`;
  }

  private isCloudDir(item: CloudItem): boolean {
    return TextUtil.isCloudDir(item);
  }

  private cloudLabel(item: CloudItem): string {
    return this.isCloudDir(item) ? '目录' : TextUtil.fileExtLabel(item);
  }

  private cloudLabelColor(item: CloudItem): string {
    return this.isCloudDir(item) ? AppTheme.BLUE_DARK : AppTheme.WHITE;
  }

  private cloudLabelBackground(item: CloudItem): string {
    const label = this.cloudLabel(item);
    return this.isCloudDir(item) ? AppTheme.BLUE_LIGHT : TextUtil.fileTypeColor(label);
  }

  private cloudMeta(item: CloudItem): string {
    const size = item.fileSize > 0 ? item.fileSize : (item.docSize > 0 ? item.docSize : item.size);
    return this.isCloudDir(item) ? '文件夹' : TextUtil.formatBytes(size);
  }

  build() {
    Column() {
      this.Header()
      if (this.session.userId.length === 0) {
        this.LoginPanel()
      } else {
        this.MainPanel()
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16, top: 16, bottom: 16 })
    .backgroundColor(AppTheme.BG)
    .bindContentCover(this.exitConfirmVisible, this.ExitConfirmPanel(), {
      modalTransition: ModalTransition.NONE
    })
  }

  onBackPress(): boolean {
    return this.handleBack();
  }

  @Builder
  private Header() {
    Row() {
      Image($r('app.media.app_icon'))
        .width(42)
        .height(42)
        .borderRadius(8)
      Column() {
        Text('讯飞文件')
          .fontColor(AppTheme.TEXT_MAIN)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        Text('上传到读写云盘根目录')
          .fontColor(AppTheme.TEXT_MUTED)
          .fontSize(13)
      }
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10 })
      .layoutWeight(1)
      if (this.session.userId.length > 0) {
        Button('注销')
          .height(40)
          .fontSize(13)
          .backgroundColor(AppTheme.BLUE_LIGHT)
          .fontColor(AppTheme.BLUE_DARK)
          .onClick(() => {
            AlertDialog.show({
              title: '注销登录',
              message: '确认退出当前账号吗？',
              primaryButton: {
                value: '确认注销',
                action: () => this.logout()
              },
              secondaryButton: {
                value: '取消',
                action: () => {
                }
              }
            });
          })
      }
    }
    .height(58)
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  private LoginPanel() {
    Column({ space: 10 }) {
      TextInput({ placeholder: '手机号', text: this.phone })
        .height(44)
        .type(InputType.PhoneNumber)
        .onChange((value: string) => this.phone = value)
      Row({ space: 8 }) {
        Button('验证码登录')
          .height(40)
          .layoutWeight(1)
          .backgroundColor(this.passwordLoginMode ? AppTheme.WHITE : AppTheme.BLUE)
          .fontColor(this.passwordLoginMode ? AppTheme.BLUE_DARK : AppTheme.WHITE)
          .onClick(() => this.passwordLoginMode = false)
        Button('密码登录')
          .height(40)
          .layoutWeight(1)
          .backgroundColor(this.passwordLoginMode ? AppTheme.BLUE : AppTheme.WHITE)
          .fontColor(this.passwordLoginMode ? AppTheme.WHITE : AppTheme.BLUE_DARK)
          .onClick(() => this.passwordLoginMode = true)
      }
      if (this.passwordLoginMode) {
        TextInput({ placeholder: '密码', text: this.password })
          .height(44)
          .type(InputType.Password)
          .onChange((value: string) => this.password = value)
      } else {
        TextInput({ placeholder: '短信验证码', text: this.code })
          .height(44)
          .type(InputType.Number)
          .onChange((value: string) => this.code = value)
        Button('发送验证码')
          .width('100%')
          .height(40)
          .backgroundColor(AppTheme.BLUE_LIGHT)
          .fontColor(AppTheme.BLUE_DARK)
          .onClick(() => this.sendSmsCode())
      }
      Button('登录')
        .width('100%')
        .height(42)
        .backgroundColor(AppTheme.BLUE)
        .fontColor(AppTheme.WHITE)
        .onClick(() => this.login())
      Text(this.loginMessage)
        .fontSize(13)
        .fontColor(AppTheme.TEXT_MUTED)
        .padding({ top: 4 })
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 18 })
  }

  @Builder
  private MainPanel() {
    Column() {
      if (this.currentPage === 0) {
        this.NotesPage()
      } else if (this.currentPage === 1) {
        this.UploadPage()
      } else if (this.currentPage === 2) {
        this.CloudPage()
      }
      Row({ space: 8 }) {
        this.NavButton('笔记', 0)
        this.NavButton('上传', 1)
        this.NavButton('云文档', 2)
      }
      .width('100%')
      .height(54)
      .padding({ top: 8 })
    }
    .width('100%')
    .layoutWeight(1)
  }

  @Builder
  private UploadPage() {
    Column({ space: 12 }) {
      Button('选择文件')
        .width('100%')
        .height(42)
        .backgroundColor(AppTheme.BLUE)
        .fontColor(AppTheme.WHITE)
        .onClick(() => this.pickFiles())
      Text(this.selectedFiles.length === 0 ? '未选择文件' : `已选择 ${this.selectedFiles.length} 个文件`)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppTheme.TEXT_MAIN)
      Scroll() {
        Column({ space: 8 }) {
          ForEach(this.selectedFiles, (file: SelectedFile, index: number) => {
            this.SelectedFileRow(file, index)
          }, (file: SelectedFile) => file.uri)
        }
        .width('100%')
      }
      .layoutWeight(1)
      Button(this.uploading ? '上传中...' : '上传到云盘')
        .width('100%')
        .height(42)
        .enabled(!this.uploading)
        .backgroundColor(AppTheme.BLUE_DARK)
        .fontColor(AppTheme.WHITE)
        .onClick(() => this.uploadSelectedFiles())
      Text(this.uploadMessage)
        .fontSize(12)
        .fontColor(AppTheme.TEXT_MUTED)
      Progress({ value: this.uploadPercent, total: 100, type: ProgressType.Linear })
        .width('100%')
        .height(8)
        .color(AppTheme.BLUE)
        .backgroundColor(AppTheme.BLUE_LIGHT)
      Text(this.loginMessage)
        .fontSize(12)
        .fontColor(AppTheme.TEXT_MUTED)
        .maxLines(2)
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 12 })
  }

  @Builder
  private CloudPage() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Button('刷新')
          .height(40)
          .layoutWeight(1)
          .backgroundColor(AppTheme.BLUE)
          .fontColor(AppTheme.WHITE)
          .onClick(() => this.loadCloud(ROOT_DIR_ID, '全部文件', true))
        Button('上一级')
          .height(40)
          .layoutWeight(1)
          .backgroundColor(AppTheme.BLUE_LIGHT)
          .fontColor(AppTheme.BLUE_DARK)
          .onClick(() => this.goCloudParent())
      }
      Text(`当前：${this.currentCloudDirName}`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(AppTheme.TEXT_MAIN)
      Text(this.cloudStatus)
        .fontSize(12)
        .fontColor(AppTheme.TEXT_MUTED)
      Scroll() {
        Column({ space: 8 }) {
          if (this.cloudItems.length === 0) {
            this.EmptyRow('当前目录暂无文件')
          } else {
            ForEach(this.cloudItems, (item: CloudItem, index: number) => {
              this.CloudRow(item, index)
            }, (item: CloudItem, index: number) => `${TextUtil.cloudName(item)}_${index}`)
          }
        }
        .width('100%')
      }
      .layoutWeight(1)
      Text(this.cloudProgressMessage)
        .fontSize(12)
        .fontColor(AppTheme.TEXT_MUTED)
        .maxLines(2)
      Progress({ value: this.cloudProgress, total: 100, type: ProgressType.Linear })
        .width('100%')
        .height(8)
        .color(AppTheme.BLUE)
        .backgroundColor(AppTheme.BLUE_LIGHT)
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 12 })
  }

  @Builder
  private NotesPage() {
    if (this.selectedNote) {
      this.NoteDetailPage(this.selectedNote)
    } else {
      Column({ space: 10 }) {
        Row() {
          Button('☰')
            .width(46)
            .height(42)
            .fontSize(24)
            .backgroundColor(AppTheme.BG)
            .fontColor(AppTheme.TEXT_MAIN)
            .onClick(() => this.noteDirPanelVisible = true)
          Text(this.selectedNoteDirName)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(AppTheme.TEXT_MAIN)
          Button(this.noteRefreshing ? '刷新中' : '刷新')
            .width(68)
            .height(38)
            .fontSize(13)
            .backgroundColor(AppTheme.BLUE_LIGHT)
            .fontColor(AppTheme.BLUE_DARK)
            .onClick(() => this.refreshCurrentFolderNotes())
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)

        if (this.noteDirPanelVisible) {
          this.NoteDirPanel()
        }

        Text(this.noteStatus)
          .fontSize(12)
          .fontColor(AppTheme.TEXT_MUTED)
          .width('100%')

        Scroll() {
          Column({ space: 10 }) {
            if (this.visibleNotes().length === 0) {
              this.EmptyRow('当前文件夹暂无笔记')
            } else {
              ForEach(this.visibleNotes(), (note: NoteItem) => {
                this.NoteCard(note)
              }, (note: NoteItem) => note.noteId)
            }
          }
          .width('100%')
        }
        .layoutWeight(1)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ top: 12 })
    }
  }

  @Builder
  private NoteDirPanel() {
    Column({ space: 8 }) {
      Row() {
        Text('笔记文件夹')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.TEXT_MAIN)
          .layoutWeight(1)
        Button('关闭')
          .height(34)
          .fontSize(12)
          .backgroundColor(AppTheme.WHITE)
          .fontColor(AppTheme.BLUE_DARK)
          .onClick(() => this.noteDirPanelVisible = false)
      }
      Scroll() {
        Column({ space: 6 }) {
          this.NoteDirRootTreeRow()
          ForEach(this.visibleNoteDirs, (row: NoteDirDisplay) => {
            this.NoteDirTreeRow(row)
          }, (row: NoteDirDisplay) => row.dirId)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .align(Alignment.Start)
      .height(360)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(14)
    .backgroundColor(AppTheme.WHITE)
    .border({ width: 1, color: AppTheme.BORDER })
    .borderRadius(8)
  }

  @Builder
  private NoteDirArrow(expanded: boolean, visible: boolean, dir: NoteDir) {
    Stack() {
      if (visible) {
        Image(expanded ? $r('app.media.ic_tree_arrow_down') : $r('app.media.ic_tree_arrow_right'))
          .width(22)
          .height(22)
      }
    }
    .width(28)
    .height(32)
    .onClick(() => {
      if (visible) {
        this.toggleNoteDir(dir);
      }
    })
  }

  @Builder
  private NoteDirFolderIcon() {
    Image($r('app.media.ic_tree_folder'))
      .width(28)
      .height(28)
  }

  @Builder
  private NoteDirRootTreeRow() {
    Column({ space: 4 }) {
      Row({ space: 6 }) {
        this.NoteDirArrow(true, false, this.noteRootDir())
        this.NoteDirFolderIcon()
        Button('全部笔记')
          .height(36)
          .padding({ left: 10, right: 10 })
          .fontSize(14)
          .backgroundColor(this.selectedNoteDirId === ROOT_DIR_ID ? AppTheme.BLUE_LIGHT : AppTheme.WHITE)
          .fontColor(this.selectedNoteDirId === ROOT_DIR_ID ? AppTheme.BLUE_DARK : AppTheme.TEXT_MAIN)
          .onClick(() => this.selectNoteDir(this.noteRootDir()))
      }
      .alignItems(VerticalAlign.Center)
      .width(this.noteDirRootRowWidth())
    }
    .alignItems(HorizontalAlign.Start)
    .width(this.noteDirRootRowWidth())
  }

  @Builder
  private NoteDirTreeRow(row: NoteDirDisplay) {
    Column({ space: 4 }) {
      Row({ space: 6 }) {
        Blank()
          .width(row.level * 18)
        this.NoteDirArrow(row.expanded, row.hasChildren, this.noteDirFromDisplay(row))
        this.NoteDirFolderIcon()
        Button(row.dirName)
          .width(this.noteDirNameWidth(row.dirName))
          .height(34)
          .padding({ left: 10, right: 10 })
          .fontSize(14)
          .backgroundColor(row.selected ? AppTheme.BLUE_LIGHT : AppTheme.WHITE)
          .fontColor(row.selected ? AppTheme.BLUE_DARK : AppTheme.TEXT_MAIN)
          .onClick(() => this.selectOrToggleNoteDir(row))
      }
      .alignItems(VerticalAlign.Center)
      .width(this.noteDirRowWidth(row))
    }
    .alignItems(HorizontalAlign.Start)
    .width(this.noteDirRowWidth(row))
  }

  @Builder
  private NoteDirRootRow() {
    Column({ space: 4 }) {
      Row({ space: 6 }) {
        Button(this.noteDirExpanded(this.noteRootDir()) ? '⌄' : '›')
          .width(28)
          .height(32)
          .fontSize(16)
          .backgroundColor(AppTheme.WHITE)
          .fontColor(AppTheme.TEXT_MUTED)
          .onClick(() => this.toggleNoteDir(this.noteRootDir()))
        Button('全部笔记')
          .layoutWeight(1)
          .height(36)
          .fontSize(14)
          .backgroundColor(this.selectedNoteDirId === ROOT_DIR_ID ? AppTheme.BLUE_LIGHT : AppTheme.WHITE)
          .fontColor(this.selectedNoteDirId === ROOT_DIR_ID ? AppTheme.BLUE_DARK : AppTheme.TEXT_MAIN)
          .onClick(() => this.selectNoteDir(this.noteRootDir()))
      }
      .width('100%')
    }
    .width('100%')
  }

  @Builder
  private NoteDirRow(row: NoteDirDisplay) {
    Column({ space: 4 }) {
      Row({ space: 6 }) {
        Blank()
          .width(row.level * 18)
        Button(row.hasChildren ? (row.expanded ? '⌄' : '›') : '')
          .width(28)
          .height(32)
          .fontSize(16)
          .backgroundColor(AppTheme.WHITE)
          .fontColor(AppTheme.TEXT_MUTED)
          .onClick(() => this.toggleNoteDir(this.noteDirFromDisplay(row)))
        Button(row.dirName)
          .layoutWeight(1)
          .height(34)
          .fontSize(14)
          .backgroundColor(row.selected ? AppTheme.BLUE_LIGHT : AppTheme.WHITE)
          .fontColor(row.selected ? AppTheme.BLUE_DARK : AppTheme.TEXT_MAIN)
          .onClick(() => this.selectOrToggleNoteDir(row))
      }
      .width('100%')
    }
    .width('100%')
  }

  @Builder
  private NoteCard(note: NoteItem) {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Text(this.noteTypeLabel(note).substring(0, 1))
          .width(34)
          .height(34)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.WHITE)
          .backgroundColor(note.type === '1' ? AppTheme.ORANGE : AppTheme.CYAN)
          .borderRadius(4)
        Text(note.noteName)
          .layoutWeight(1)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.TEXT_MAIN)
          .maxLines(2)
      }
      Text(this.noteSummary(note))
        .width('100%')
        .fontSize(15)
        .fontColor(AppTheme.TEXT_MAIN)
        .maxLines(3)
      Text(`${this.noteTypeLabel(note)} · ${note.dirName.length > 0 ? note.dirName : '未分类'} · ${TextUtil.formatNoteTime(note.updateTime > 0 ? note.updateTime : note.createTime)}`)
        .fontSize(13)
        .fontColor(AppTheme.TEXT_MUTED)
        .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(AppTheme.WHITE)
    .borderRadius(8)
    .onClick(() => this.openNote(note))
  }

  @Builder
  private NoteDetailPage(note: NoteItem) {
    Column({ space: 10 }) {
      Row() {
        Button('返回')
          .width(64)
          .height(38)
          .fontSize(13)
          .backgroundColor(AppTheme.BLUE_LIGHT)
          .fontColor(AppTheme.BLUE_DARK)
          .onClick(() => this.closeNote())
        Text(note.noteName)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.TEXT_MAIN)
          .maxLines(1)
        Blank()
          .width(64)
      }
      Text(this.noteStatus)
        .fontSize(12)
        .fontColor(AppTheme.TEXT_MUTED)
        .width('100%')
      Scroll() {
        Column({ space: 12 }) {
          Text(note.noteName)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(AppTheme.TEXT_MAIN)
            .width('100%')
          if (note.html.length > 0) {
            RichText(note.html)
              .width('100%')
          } else {
            Text(TextUtil.stripHtml(TextUtil.firstNonEmpty(note.contentText, note.summary)))
              .fontSize(16)
              .fontColor(AppTheme.TEXT_MAIN)
              .lineHeight(26)
              .width('100%')
          }
          ForEach(this.noteImages, (image: NoteImage) => {
            Image(image.url)
              .width('100%')
              .objectFit(ImageFit.Contain)
              .borderRadius(8)
          }, (image: NoteImage) => image.objectName)
        }
        .width('100%')
        .padding(16)
        .backgroundColor(AppTheme.WHITE)
        .borderRadius(8)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 12 })
  }

  @Builder
  private ExitConfirmPanel() {
    Column() {
      Blank()
        .layoutWeight(1)
      Column({ space: 14 }) {
        Text('退出应用')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.TEXT_MAIN)
        Text('确认退出当前应用吗？')
          .fontSize(15)
          .fontColor(AppTheme.TEXT_MUTED)
        Row({ space: 10 }) {
          Button('取消')
            .height(40)
            .layoutWeight(1)
            .backgroundColor(AppTheme.WHITE)
            .fontColor(AppTheme.BLUE_DARK)
            .onClick(() => this.exitConfirmVisible = false)
          Button('确认退出')
            .height(40)
            .layoutWeight(1)
            .backgroundColor(AppTheme.DANGER)
            .fontColor(AppTheme.WHITE)
            .onClick(() => {
              this.exitConfirmVisible = false;
              const context = getContext(this) as common.UIAbilityContext;
              context.terminateSelf();
            })
        }
        .width('100%')
      }
      .width('100%')
      .padding(18)
      .backgroundColor(AppTheme.WHITE)
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .backgroundColor('#66000000')
  }

  @Builder
  private SelectedFileRow(file: SelectedFile, index: number) {
    Row() {
      Text(`${index + 1}`)
        .width(36)
        .height(36)
        .textAlign(TextAlign.Center)
        .fontColor(AppTheme.WHITE)
        .backgroundColor(AppTheme.BLUE)
        .borderRadius(8)
      Column() {
        Text(file.name)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.TEXT_MAIN)
          .maxLines(2)
        Text(TextUtil.formatBytes(file.size))
          .fontSize(12)
          .fontColor(AppTheme.TEXT_MUTED)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10 })
    }
    .width('100%')
    .padding(10)
    .backgroundColor(AppTheme.WHITE)
    .border({ width: 1, color: AppTheme.BORDER })
    .borderRadius(8)
  }

  @Builder
  private CloudRow(item: CloudItem, index: number) {
    Row() {
      Text(this.cloudLabel(item))
        .width(54)
        .height(38)
        .textAlign(TextAlign.Center)
        .fontSize(12)
        .fontColor(this.cloudLabelColor(item))
        .backgroundColor(this.cloudLabelBackground(item))
        .borderRadius(8)
      Column() {
        Text(TextUtil.cloudName(item))
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppTheme.TEXT_MAIN)
          .maxLines(2)
        Text(this.cloudMeta(item))
          .fontSize(12)
          .fontColor(AppTheme.TEXT_MUTED)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 8 })
      if (this.isCloudDir(item)) {
        Button('打开')
          .height(38)
          .width(70)
          .backgroundColor(AppTheme.BLUE_LIGHT)
          .fontColor(AppTheme.BLUE_DARK)
          .onClick(() => this.openCloudDir(item))
      } else {
        Column({ space: 6 }) {
          Button('下载')
            .height(32)
            .width(64)
            .fontSize(12)
            .backgroundColor(AppTheme.BLUE)
            .fontColor(AppTheme.WHITE)
            .onClick(() => this.confirmDownload(item))
          Button('删除')
            .height(32)
            .width(64)
            .fontSize(12)
            .backgroundColor(AppTheme.DANGER)
            .fontColor(AppTheme.WHITE)
            .onClick(() => this.confirmDelete(item))
        }
      }
    }
    .width('100%')
    .padding(10)
    .backgroundColor(AppTheme.WHITE)
    .border({ width: 1, color: AppTheme.BORDER })
    .borderRadius(8)
  }

  @Builder
  private EmptyRow(text: string) {
    Text(text)
      .width('100%')
      .padding(22)
      .textAlign(TextAlign.Center)
      .fontSize(14)
      .fontColor(AppTheme.TEXT_MUTED)
      .backgroundColor(AppTheme.WHITE)
      .border({ width: 1, color: AppTheme.BORDER })
      .borderRadius(8)
  }

  @Builder
  private NavButton(title: string, page: number) {
    Button(title)
      .height(40)
      .layoutWeight(1)
      .backgroundColor(this.currentPage === page ? AppTheme.BLUE : AppTheme.WHITE)
      .fontColor(this.currentPage === page ? AppTheme.WHITE : AppTheme.BLUE_DARK)
      .border({ width: 1, color: AppTheme.BORDER })
      .onClick(() => this.switchPage(page))
  }
}
