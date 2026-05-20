$ErrorActionPreference = 'Stop'

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Java = Join-Path $Root 'tools\jre21\jdk-21.0.11+10-jre\bin\java.exe'
$Apktool = Join-Path $Root 'tools\apktool.jar'
$Signer = Join-Path $Root 'tools\uber-apk-signer.jar'
$Project = Join-Path $Root 'apktool'
$Dist = Join-Path $Root 'dist'
$Signed = Join-Path $Dist 'signed'
$UnsignedApk = Join-Path $Dist 'iflyink-uploader-rebuilt-unsigned.apk'

New-Item -ItemType Directory -Force -Path $Dist | Out-Null
Remove-Item -LiteralPath $UnsignedApk -Force -ErrorAction SilentlyContinue

& $Java -jar $Apktool b $Project -o $UnsignedApk
if ($LASTEXITCODE -ne 0) { throw "apktool build failed" }

Remove-Item -LiteralPath $Signed -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $Signed | Out-Null

& $Java -jar $Signer -a $UnsignedApk -o $Signed
if ($LASTEXITCODE -ne 0) { throw "APK signing failed" }

Get-ChildItem -LiteralPath $Signed -Filter '*.apk' | Select-Object FullName, Length, LastWriteTime
