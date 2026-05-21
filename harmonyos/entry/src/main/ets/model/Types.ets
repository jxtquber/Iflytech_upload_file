export interface SessionData {
  phone: string;
  userId: string;
  auth: string;
  userToken: string;
  refreshToken: string;
  sn: string;
}

export interface ApiResponse {
  code: number;
  raw: string;
}

export interface SelectedFile {
  uri: string;
  name: string;
  size: number;
}

export interface DigestResult {
  md5: string;
  size: number;
}

export interface CloudItem {
  [key: string]: string | number | boolean | object | null | undefined;
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
