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

After DevEco finishes syncing project files, check or adjust the `compileSdkVersion`,
`compatibleSdkVersion`, and `runtimeOS` values in `build-profile.json5` if your installed SDK differs.

## Known Environment Note

Password login uses a pure ArkTS implementation of the Android app's `DES/ECB/PKCS5Padding`
password encryption.

If command-line packaging reports `SDK component missing`, install the full HarmonyOS SDK build
components from DevEco Studio's SDK Manager, then rerun the build.
