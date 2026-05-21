# iflyink-uploader APK reverse workspace


## Outputs

- Editable/repackable apktool project: `D:\codex\iflyink-uploader-work\apktool`
- Decompiled Java for reading: `D:\codex\iflyink-uploader-work\jadx-src\sources`
- Final rebuilt signed APK: `D:\codex\iflyink-uploader-work\dist\signed\iflyink-uploader-rebuilt-aligned-debugSigned.apk`
- Local tools: `D:\codex\iflyink-uploader-work\tools`

## App summary

- Package: `com.codex.iflyinkuploader`
- Entry activity: `com.codex.iflyinkuploader.MainActivity`
- Main decompiled source: `D:\codex\iflyink-uploader-work\jadx-src\sources\com\codex\iflyinkuploader\MainActivity.java`
- Main editable bytecode: `D:\codex\iflyink-uploader-work\apktool\smali\com\codex\iflyinkuploader\MainActivity.smali`

The APK is small and concentrated in one Activity. It implements login, SMS code login, note listing, cloud file listing, document selection, upload URL retrieval, PUT upload, and document creation through `http://api.iflyink.com/xbew-api`.

## Rebuild

First prepare local tools:

```powershell
powershell -ExecutionPolicy Bypass -File D:\codex\iflyink-uploader-work\setup-tools.ps1
```

After editing the apktool project, run:

```powershell
powershell -ExecutionPolicy Bypass -File D:\codex\iflyink-uploader-work\build-repack.ps1
```

The output APK will be signed with a debug certificate and verified by the signer.

## Modification notes

Use the JADX Java output to understand logic, but apply APK-level changes in the apktool project, especially the `.smali` files and `res` resources. Java files from JADX are for reference and are not directly rebuilt by this workflow.

Common edit targets:

- UI text and programmatic layout: `MainActivity.smali`
- App name/resources: `apktool\res\values\strings.xml`
- Manifest permissions/package/activity settings: `apktool\AndroidManifest.xml`
- Icons: `apktool\res\mipmap-*`
