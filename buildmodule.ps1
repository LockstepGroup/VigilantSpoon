$PowershellFiles = ls .\powershell\cmdlets\ -exclude '*.Tests.*'
$ModuleOutput = @()

foreach ($p in $PowershellFiles) {
    $ModuleOutput += Get-Content $p
}

$ModuleOutput | Out-File .\VigilantSpoon.psm1 -Force