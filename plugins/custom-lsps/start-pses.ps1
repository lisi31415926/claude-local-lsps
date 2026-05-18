param(
    [string]$BundledModulesPath,
    [string]$LogPath,
    [string]$LogLevel = 'None',
    [switch]$Stdio
)

$moduleDir = $BundledModulesPath
if (-not $moduleDir) {
    $module = Get-Module -ListAvailable PowerShellEditorServices | Sort-Object Version -Descending | Select-Object -First 1
    if (-not $module) { throw 'PowerShellEditorServices not installed' }
    $moduleDir = Split-Path $module.Path
}

$scriptPath = Join-Path $moduleDir 'Start-EditorServices.ps1'
& $scriptPath -HostName 'Claude Code' -HostProfileId 'ClaudeCode' -HostVersion '1.0.0' -BundledModulesPath $moduleDir -LogPath $LogPath -LogLevel $LogLevel -SessionDetailsPath (Join-Path $env:TEMP "pses-${PID}") -Stdio -FeatureFlags @()
