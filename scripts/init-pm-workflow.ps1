param(
  [string]$ProjectsRoot,
  [switch]$Force,
  [switch]$NoCreateRoot
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
$exampleConfigPath = Join-Path $repoRoot 'pm-workflow.config.example.json'
$configPath = Join-Path $repoRoot 'pm-workflow.config.json'

if (-not (Test-Path -LiteralPath $exampleConfigPath)) {
  throw "Example config not found: $exampleConfigPath"
}

$config = Get-Content -LiteralPath $exampleConfigPath -Raw | ConvertFrom-Json

if (-not $ProjectsRoot) {
  $defaultRoot = if ($config.projectsRoot -and $config.projectsRoot -notmatch '^<.*>$') { $config.projectsRoot } else { Join-Path $repoRoot 'pm-workflow-projects' }
  $inputValue = Read-Host "Choose projectsRoot for PM workflow assets [`Enter` to use $defaultRoot]"
  if ([string]::IsNullOrWhiteSpace($inputValue)) {
    $ProjectsRoot = $defaultRoot
  } else {
    $ProjectsRoot = $inputValue.Trim()
  }
}

$config.projectsRoot = $ProjectsRoot

if ((Test-Path -LiteralPath $configPath) -and -not $Force) {
  Write-Host "Config already exists: $configPath" -ForegroundColor Yellow
  $overwrite = Read-Host 'Overwrite existing pm-workflow.config.json? [y/N]'
  if ($overwrite -notmatch '^(y|Y|yes|YES)$') {
    Write-Host 'Init cancelled. Existing config kept.' -ForegroundColor Yellow
    exit 0
  }
}

$config | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $configPath -Encoding UTF8

if (-not $NoCreateRoot) {
  if (-not (Test-Path -LiteralPath $ProjectsRoot)) {
    New-Item -ItemType Directory -Path $ProjectsRoot -Force | Out-Null
    $rootAction = 'created'
  } else {
    $rootAction = 'verified'
  }
} else {
  $rootAction = 'skipped'
}

Write-Host ''
Write-Host 'PM Workflow init complete.' -ForegroundColor Green
Write-Host "Config:        $configPath"
Write-Host "projectsRoot:  $ProjectsRoot"
Write-Host "Root status:   $rootAction"
Write-Host "Stages:        $($config.stages -join ', ')"
Write-Host "Artifact dirs: $((($config.artifactDirs.PSObject.Properties | ForEach-Object { $_.Name + '=' + $_.Value }) -join '; '))"
Write-Host "Naming:        $((($config.naming.PSObject.Properties | ForEach-Object { $_.Name + '=' + $_.Value }) -join '; '))"
Write-Host ''
Write-Host 'Next step: create your first PM workflow project under projectsRoot.' -ForegroundColor Cyan
