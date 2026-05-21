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

## Known Compatibility Note

The Android app's password login encrypts the password with `DES/ECB/PKCS5Padding`.
HarmonyOS native crypto APIs may not expose that exact legacy DES mode in all SDKs.
The ArkTS port keeps SMS code login as the main login path and leaves password login disabled until
the encryption compatibility path is verified in DevEco.
