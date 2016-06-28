$PowershellFiles = ls .\powershell\cmdlets\ -exclude '*.Tests.*'
$ModuleOutput = $PowershellFiles -join "`r`n"

$ModuleOutput | Out-File .\VigilantSpoon.psm1