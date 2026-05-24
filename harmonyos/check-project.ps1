$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$required = @(
  "oh-package.json5",
  "build-profile.json5",
  "hvigorfile.ts",
  "AppScope\app.json5",
  "entry\oh-package.json5",
  "entry\build-profile.json5",
  "entry\hvigorfile.ts",
  "entry\src\main\module.json5",
  "entry\src\main\ets\entryability\EntryAbility.ets",
  "entry\src\main\ets\pages\Index.ets",
  "entry\src\main\ets\services\ApiClient.ets",
  "entry\src\main\ets\services\FileService.ets",
  "entry\src\main\ets\services\SessionStore.ets",
  "entry\src\main\ets\utils\HashUtil.ets",
  "entry\src\main\resources\base\profile\main_pages.json"
)

foreach ($relative in $required) {
  $path = Join-Path $root $relative
  if (-not (Test-Path $path)) {
    throw "Missing required file: $relative"
  }
}

Get-ChildItem $root -Recurse -Filter *.json | ForEach-Object {
  try {
    $null = Get-Content $_.FullName -Raw | ConvertFrom-Json
  } catch {
    throw "Invalid JSON syntax in $($_.FullName): $($_.Exception.Message)"
  }
}

Get-ChildItem $root -Recurse -Filter *.json5 | ForEach-Object {
  $content = Get-Content $_.FullName -Raw
  if ([string]::IsNullOrWhiteSpace($content)) {
    throw "Empty JSON5 file: $($_.FullName)"
  }
  $trimmed = $content.TrimStart()
  if (-not ($trimmed.StartsWith("{") -or $trimmed.StartsWith("["))) {
    throw "Suspicious JSON5 file start in $($_.FullName)"
  }
}

if ((Get-Content (Join-Path $root "entry\src\main\module.json5") -Raw) -notmatch "ohos\.permission\.INTERNET") {
  throw "Missing network permission: ohos.permission.INTERNET"
}

if ((Get-Content (Join-Path $root "entry\src\main\ets\services\ApiClient.ets") -Raw) -match "APP_SECRET\s*=\s*''") {
  throw "APP_SECRET is empty; API signing will fail"
}

Write-Host "HarmonyOS project skeleton looks complete."
Write-Host "Open this folder in DevEco Studio: $root"
