# Move to the project folder
$ProjectRoot = $ENV:APPVEYOR_BUILD_FOLDER
Set-Location $ProjectRoot

# Get all the paths
$RepoName       = $ENV:APPVEYOR_REPO_NAME
$ModuleName     = ($RepoName.Split('/'))[1]

$SourcePath     = $ProjectRoot + '\src'

$CSharpPath     = $SourcePath + '\csharp'
$JavascriptPath = $SourcePath + '\javascript'

$PowerShellPath = $SourcePath + '\powershell'
$CmdletPath     = $PowerShellPath + '\cmdlets'
$HelperPath     = $PowerShellPath + '\helpers'


###############################################################################
# Create varios pieces used in the files

$CmdletHeader = @'
###############################################################################
## Start Powershell Cmdlets
###############################################################################


'@

$HelperFunctionHeader = @'
###############################################################################
## Start Helper Functions
###############################################################################


'@

$Footer = @'
###############################################################################
## Export Cmdlets
###############################################################################
Export-ModuleMember *-*
'@

$FunctionHeader = @'
###############################################################################
# 
'@


###############################################################################
# Create module file

# Cmdlet header
$ModuleOutput  = @()
$ModuleOutput += "#Build: " + $env:APPVEYOR_BUILD_NUMBER
$ModuleOutput += $CmdletHeader

# Add Cmdlets
$CmdletFiles = ls $CmdletPath -Exclude '*.Tests.*'
foreach ($Cmdlet in $CmdletFiles) {
    $ModuleOutput += $FunctionHeader + $Cmdlet.BaseName
    $ModuleOutput += Get-Content $Cmdlet
}

$ModuleOutput | Out-File .\VigilantSpoon.psm1 -Force

<#
$CmdletFiles = ls ($ProjectRoot + '\src\powershell\cmdlets\') -Exclude '*.Tests.*'


$PowershellFiles = ls .\powershell\cmdlets\ -exclude 

$ModuleOutput  = @()
$ModuleOutput += "#Build: " + $env:APPVEYOR_BUILD_NUMBER

foreach ($p in $PowershellFiles) {
    $ModuleOutput += Get-Content $p
}

Remove-Item *.psm1
ls
$ModuleOutput | Out-File .\VigilantSpoon.psm1 -Force
#>