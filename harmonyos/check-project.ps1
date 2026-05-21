$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$required = @(
  "oh-package.json5",
  "build-profile.json5",
  "hvigorfile.ts",
  "AppScope\app.json5",
  "entry\oh-package.json5",
  "entry\build-profile.json5",
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

Get-ChildItem $root -Recurse -Include *.json,*.json5 | ForEach-Object {
  try {
    $null = Get-Content $_.FullName -Raw | ConvertFrom-Json
  } catch {
    throw "Invalid JSON/JSON5 syntax in $($_.FullName): $($_.Exception.Message)"
  }
}

Write-Host "HarmonyOS project skeleton looks complete."
Write-Host "Open this folder in DevEco Studio: $root"
