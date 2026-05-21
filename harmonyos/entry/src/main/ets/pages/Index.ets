import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';
import { AppTheme } from '../common/AppTheme';
import { CloudItem, copySession, EMPTY_SESSION, SelectedFile, SessionData } from '../model/Types';
import { ApiClient } from '../services/ApiClient';
import { FileService } from '../services/FileService';
import { SessionStore } from '../services/SessionStore';
import { TextUtil } from '../utils/TextUtil';

const ROOT_DIR_ID = '0';

@Entry
@Component
struct Index {
  private api: ApiClient = new ApiClient();
  private store?: SessionStore;
  private fileService?: FileService;

  @State session: SessionData = EMPTY_SESSION;
  @State phone: string = '';
  @State code: string = '';
  @State password: string = '';
  @State passwordLoginMode: boolean = false;
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

  aboutToAppear(): void {
    const context = getContext(this) as common.UIAbilityContext;
    this.store = new SessionStore(context);
    this.fileService = new FileService(context, this.api);
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
    if (page === 1 && this.session.userId.length > 0 && !this.cloudLoaded) {
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
        this.UploadPage()
      } else {
        this.CloudPage()
      }
      Row({ space: 8 }) {
        this.NavButton('上传', 0)
        this.NavButton('云文档', 1)
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
    .height('100%')
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
    .height('100%')
    .padding({ top: 12 })
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
        Button('下载')
          .height(38)
          .width(70)
          .backgroundColor(AppTheme.BLUE)
          .fontColor(AppTheme.WHITE)
          .onClick(() => this.confirmDownload(item))
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
