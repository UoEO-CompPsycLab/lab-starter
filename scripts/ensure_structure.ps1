$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$required = @(
  "data/raw/squirrels",
  "data/generated/bandit",
  "data/generated/trident",
  "data/processed/squirrels",
  "data/processed/trident",
  "reports/bandit",
  "reports/squirrels",
  "reports/trident",
  "results/figures",
  "results/tables",
  "src"
)

$createdDirs = @()
$createdKeeps = @()

foreach ($rel in $required) {
  $path = Join-Path $root $rel
  if (-not (Test-Path -LiteralPath $path)) {
    New-Item -ItemType Directory -Path $path -Force | Out-Null
    $createdDirs += $rel
  }
}

foreach ($rel in $required) {
  $path = Join-Path $root $rel
  if (-not (Test-Path -LiteralPath $path)) { continue }

  $items = Get-ChildItem -Force -LiteralPath $path
  $nonKeep = $items | Where-Object { $_.Name -ne ".gitkeep" }
  if (-not $nonKeep -or $nonKeep.Count -eq 0) {
    $keep = Join-Path $path ".gitkeep"
    if (-not (Test-Path -LiteralPath $keep)) {
      New-Item -ItemType File -Path $keep | Out-Null
      $createdKeeps += (Join-Path $rel ".gitkeep")
    }
  }
}

Write-Host "Created directories: $($createdDirs.Count)"
if ($createdDirs.Count -gt 0) {
  $createdDirs | ForEach-Object { Write-Host "  - $_" }
}
Write-Host "Created .gitkeep files: $($createdKeeps.Count)"
if ($createdKeeps.Count -gt 0) {
  $createdKeeps | ForEach-Object { Write-Host "  - $_" }
}
