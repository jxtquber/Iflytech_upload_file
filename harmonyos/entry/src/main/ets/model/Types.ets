export interface SessionData {
  phone: string;
  userId: string;
  auth: string;
  userToken: string;
  refreshToken: string;
  sn: string;
}

export function copySession(session: SessionData): SessionData {
  return {
    phone: session.phone,
    userId: session.userId,
    auth: session.auth,
    userToken: session.userToken,
    refreshToken: session.refreshToken,
    sn: session.sn
  };
}

export interface ApiResponse {
  code: number;
  raw: string;
}

export class SelectedFile {
  uri: string = '';
  name: string = '';
  size: number = 0;

  constructor(uri: string = '', name: string = '', size: number = 0) {
    this.uri = uri;
    this.name = name;
    this.size = size;
  }
}

export interface DigestResult {
  md5: string;
  size: number;
}

export class CloudItem {
  fileName: string = '';
  docName: string = '';
  dirName: string = '';
  name: string = '';
  docType: string = '';
  fileType: string = '';
  type: string = '';
  fileExt: string = '';
  docExt: string = '';
  dirId: string = '';
  fileId: string = '';
  id: string = '';
  url: string = '';
  objectName: string = '';
  filePath: string = '';
  fileSize: number = 0;
  docSize: number = 0;
  size: number = 0;
}

export interface UploadProgress {
  percent: number;
  message: string;
}

export const EMPTY_SESSION: SessionData = {
  phone: '',
  userId: '',
  auth: '',
  userToken: '',
  refreshToken: '',
  sn: ''
};
