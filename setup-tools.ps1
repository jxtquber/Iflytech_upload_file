$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Tools = Join-Path $Root 'tools'
$JadxDir = Join-Path $Tools 'jadx'
$JreDir = Join-Path $Tools 'jre21'

New-Item -ItemType Directory -Force -Path $Tools | Out-Null

$ApktoolUrl = 'https://github.com/iBotPeaches/Apktool/releases/download/v3.0.2/apktool_3.0.2.jar'
$JadxUrl = 'https://github.com/skylot/jadx/releases/download/v1.5.5/jadx-1.5.5.zip'
$SignerUrl = 'https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar'
$JreUrl = 'https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.11%2B10/OpenJDK21U-jre_x64_windows_hotspot_21.0.11_10.zip'

function Download-IfMissing($Url, $OutFile) {
    if (!(Test-Path -LiteralPath $OutFile)) {
        Invoke-WebRequest -Uri $Url -OutFile $OutFile -Headers @{ 'User-Agent' = 'Codex' }
    }
}

Download-IfMissing $ApktoolUrl (Join-Path $Tools 'apktool.jar')
Download-IfMissing $JadxUrl (Join-Path $Tools 'jadx.zip')
Download-IfMissing $SignerUrl (Join-Path $Tools 'uber-apk-signer.jar')
Download-IfMissing $JreUrl (Join-Path $Tools 'temurin-jre21.zip')

if (!(Test-Path -LiteralPath (Join-Path $JadxDir 'bin\jadx.bat'))) {
    New-Item -ItemType Directory -Force -Path $JadxDir | Out-Null
    Expand-Archive -LiteralPath (Join-Path $Tools 'jadx.zip') -DestinationPath $JadxDir -Force
}

if (!(Test-Path -LiteralPath (Join-Path $JreDir 'jdk-21.0.11+10-jre\bin\java.exe'))) {
    New-Item -ItemType Directory -Force -Path $JreDir | Out-Null
    Expand-Archive -LiteralPath (Join-Path $Tools 'temurin-jre21.zip') -DestinationPath $JreDir -Force
}

Write-Host "Tools are ready in $Tools"
