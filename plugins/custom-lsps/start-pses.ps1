$module = Get-Module -ListAvailable PowerShellEditorServices | Sort-Object Version -Descending | Select-Object -First 1
if (-not $module) { throw 'PowerShellEditorServices not installed' }
Import-Module $module.Path
Start-EditorServices -HostName 'Claude Code' -HostProfileId 'ClaudeCode' -HostVersion '1.0.0' -Stdio -BundledModulesPath (Split-Path $module.Path) -LogLevel 'None'
