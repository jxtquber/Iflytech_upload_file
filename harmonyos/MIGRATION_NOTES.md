# Android to HarmonyOS Migration Notes

## Source App

The original workspace is a reverse-engineered Android APK. The readable reference source is:

`D:\CodeX\Iflytech_upload_file\jadx-src\sources\com\codex\iflyinkuploader\MainActivity.java`

The current editable Android APK bytecode is:

`D:\CodeX\Iflytech_upload_file\apktool\smali\com\codex\iflyinkuploader\MainActivity.smali`

## HarmonyOS Scope

Migrated into ArkTS Stage model under:

`D:\CodeX\Iflytech_upload_file\harmonyos`

Implemented:

- App entry and Stage model configuration.
- SMS verification code login.
- Session persistence.
- File selection without extension or MIME restrictions.
- Upload URL retrieval.
- PUT file upload.
- Cloud document registration.
- Cloud file listing.
- Folder navigation.
- Download URL retrieval and sandbox file save.

Not migrated:

- Note page. It was intentionally removed from the Android navigation and is not part of the HarmonyOS port.
Password login has been implemented with a pure ArkTS `DES/ECB/PKCS5Padding` helper so it does not depend on HarmonyOS cryptoFramework legacy DES support.

## API Mapping

Base API:

`http://api.iflyink.com/xbew-api`

Endpoints retained from Android:

- `POST /common/sms/pushLogin`
- `POST /user/codeLogin`
- `POST /auth/oauth/token`
- `POST /user/refreshToken`
- `POST /common/common/getUploadUrl`
- `PUT <uploadUrl>`
- `POST /note/doc/addDoc`
- `POST /note/doc/getCloudFileList`
- `POST /common/common/getDownloadUrl`

Every API request keeps the Android signing fields:

- `istv=s`
- `timestamp`
- `appKey=dxk-pc`
- `nonce=MD5(timestamp + randomDigits)`
- `sign=SHA256(sorted non-empty params + secret).toUpperCase()`

## Important DevEco Checks

After DevEco Studio is installed:

1. Open `D:\CodeX\Iflytech_upload_file\harmonyos`.
2. Let DevEco install or sync the HarmonyOS SDK and Hvigor toolchain.
3. If your SDK is not API 18, update `build-profile.json5` to match the installed SDK.
4. Run preview/build once and fix any SDK import naming differences if DevEco reports them.
5. Test both SMS login and password login after the first successful install.

## Files Added

- `entry/src/main/ets/pages/Index.ets`: main ArkUI page.
- `entry/src/main/ets/services/ApiClient.ets`: signed API client and token refresh logic.
- `entry/src/main/ets/services/FileService.ets`: file picker, file read, upload, and save helpers.
- `entry/src/main/ets/services/SessionStore.ets`: persisted login session.
- `entry/src/main/ets/utils/HashUtil.ets`: pure ArkTS MD5 and SHA-256.
- `entry/src/main/ets/utils/DesUtil.ets`: pure ArkTS DES/ECB/PKCS5Padding for password login.
- `entry/src/main/ets/utils/TextUtil.ets`: filename, cloud item, and display helpers.
