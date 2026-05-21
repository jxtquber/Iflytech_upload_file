$ErrorActionPreference = 'Stop'

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$JavaHome = 'C:\Program Files\Android\Android Studio\jbr'
$AndroidHome = 'C:\Users\jxtqu\AppData\Local\Android\Sdk'
$BuildTools = Join-Path $AndroidHome 'build-tools\37.0.0'

$Java = Join-Path $JavaHome 'bin\java.exe'
$Keytool = Join-Path $JavaHome 'bin\keytool.exe'
$Apktool = Join-Path $Root 'tools\apktool.jar'
$Zipalign = Join-Path $BuildTools 'zipalign.exe'
$ApkSigner = Join-Path $BuildTools 'apksigner.bat'
$Project = Join-Path $Root 'apktool'
$Dist = Join-Path $Root 'dist'
$Signed = Join-Path $Dist 'signed'
$UnsignedApk = Join-Path $Dist 'iflyink-uploader-rebuilt-unsigned.apk'
$AlignedApk = Join-Path $Dist 'iflyink-uploader-rebuilt-aligned.apk'
$SignedApk = Join-Path $Signed 'iflyink-uploader-rebuilt-debugSigned.apk'
$KeyStore = Join-Path $Root 'tools\debug.keystore'

foreach ($Tool in @($Java, $Keytool, $Apktool, $Zipalign, $ApkSigner)) {
    if (-not (Test-Path -LiteralPath $Tool)) {
        throw "Required tool not found: $Tool"
    }
}

$env:JAVA_HOME = $JavaHome
$env:PATH = "$JavaHome\bin;$AndroidHome\platform-tools;$env:PATH"

New-Item -ItemType Directory -Force -Path $Dist | Out-Null
New-Item -ItemType Directory -Force -Path $Signed | Out-Null
Remove-Item -LiteralPath $UnsignedApk, $AlignedApk, $SignedApk -Force -ErrorAction SilentlyContinue

& $Java -jar $Apktool b $Project -o $UnsignedApk
if ($LASTEXITCODE -ne 0) { throw "apktool build failed" }

& $Zipalign -f -p 4 $UnsignedApk $AlignedApk
if ($LASTEXITCODE -ne 0) { throw "zipalign failed" }

if (-not (Test-Path -LiteralPath $KeyStore)) {
    & $Keytool -genkeypair `
        -keystore $KeyStore `
        -storepass android `
        -keypass android `
        -alias androiddebugkey `
        -keyalg RSA `
        -keysize 2048 `
        -validity 10000 `
        -dname 'CN=Android Debug,O=Android,C=US'
    if ($LASTEXITCODE -ne 0) { throw "debug keystore creation failed" }
}

& $ApkSigner sign `
    --ks $KeyStore `
    --ks-pass pass:android `
    --key-pass pass:android `
    --ks-key-alias androiddebugkey `
    --out $SignedApk `
    $AlignedApk
if ($LASTEXITCODE -ne 0) { throw "APK signing failed" }

& $ApkSigner verify --verbose $SignedApk
if ($LASTEXITCODE -ne 0) { throw "APK signature verification failed" }

Get-Item -LiteralPath $SignedApk | Select-Object FullName, Length, LastWriteTime
