$PowershellFiles = ls .\powershell\cmdlets\ -exclude '*.Tests.*'
$ModuleOutput = @()

foreach ($p in $PowershellFiles) {
    $ModuleOutput += Get-Content $p
}

Remove-Item *.psm1
ls
$ModuleOutput = "#Build: " + $env:APPVEYOR_BUILD_NUMBER + "`r`n" + $ModuleOutput
$ModuleOutput | Out-File .\VigilantSpoon.psm1 -Force