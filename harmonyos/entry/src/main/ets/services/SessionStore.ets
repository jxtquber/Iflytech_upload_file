import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import { EMPTY_SESSION, SessionData } from '../model/Types';

const PREF_NAME = 'iflyink_upload';

export class SessionStore {
  private prefs?: preferences.Preferences;

  constructor(private context: common.UIAbilityContext) {
  }

  private async getPrefs(): Promise<preferences.Preferences> {
    if (!this.prefs) {
      this.prefs = await preferences.getPreferences(this.context, PREF_NAME);
    }
    return this.prefs;
  }

  async load(): Promise<SessionData> {
    const prefs = await this.getPrefs();
    return {
      phone: `${prefs.getSync('phone', EMPTY_SESSION.phone)}`,
      userId: `${prefs.getSync('userId', EMPTY_SESSION.userId)}`,
      auth: `${prefs.getSync('auth', EMPTY_SESSION.auth)}`,
      userToken: `${prefs.getSync('userToken', EMPTY_SESSION.userToken)}`,
      refreshToken: `${prefs.getSync('refreshToken', EMPTY_SESSION.refreshToken)}`,
      sn: `${prefs.getSync('sn', EMPTY_SESSION.sn)}`
    };
  }

  async save(session: SessionData): Promise<void> {
    const prefs = await this.getPrefs();
    prefs.putSync('phone', session.phone);
    prefs.putSync('userId', session.userId);
    prefs.putSync('auth', session.auth);
    prefs.putSync('userToken', session.userToken);
    prefs.putSync('refreshToken', session.refreshToken);
    prefs.putSync('sn', session.sn);
    await prefs.flush();
  }

  async clear(): Promise<void> {
    await this.save(EMPTY_SESSION);
  }
}
