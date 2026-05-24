# Iflytech Upload File HarmonyOS Port

This directory contains a HarmonyOS ArkTS migration of the Android APK workspace.

Current migration scope:

- SMS code login.
- Session persistence.
- File picking without document type restrictions.
- Upload selected files to the cloud root directory.
- Cloud file listing, folder navigation, and download URL retrieval.
- The note page is intentionally not migrated.

Packaging is intentionally deferred until DevEco Studio and the HarmonyOS SDK are installed.

## Open in DevEco Studio

Open this directory:

`D:\CodeX\Iflytech_upload_file\harmonyos`

Before opening DevEco Studio, you can run a lightweight project check:

```powershell
powershell -ExecutionPolicy Bypass -File D:\CodeX\Iflytech_upload_file\harmonyos\check-project.ps1
```

After DevEco finishes syncing project files, check or adjust the `compileSdkVersion`,
`compatibleSdkVersion`, and `runtimeOS` values in `build-profile.json5` if your installed SDK differs.

## Known Environment Note

Password login uses a pure ArkTS implementation of the Android app's `DES/ECB/PKCS5Padding`
password encryption.

If command-line packaging reports `SDK component missing`, install the full HarmonyOS SDK build
components from DevEco Studio's SDK Manager, then rerun the build.

## Security Notes

- The upstream service currently uses `http://api.iflyink.com/xbew-api`, so the port keeps cleartext HTTP for compatibility.
- API signing values are kept in `ApiClient.ets` because the original client requires local request signing. Treat this app as a trusted personal utility, not a public distributable binary.
- Error messages shown in the app are compacted and mask token-like values before display.
