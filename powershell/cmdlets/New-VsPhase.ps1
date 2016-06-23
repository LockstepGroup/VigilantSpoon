function New-VsPhase {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True,Position=0)]
        [ValidateSet("clioutput","parser")]
        [string]$AppType,
        
        [Parameter(Mandatory=$False,Position=1)]
        [string]$NextPhase,
        
        [Parameter(Mandatory=$False)]
        [array]$Fieldsets = @(),
        
        [Parameter(Mandatory=$False)]
        [array]$ErrorMessages = @()
    )

    $NewObject               = "" | Select AppType,NextPhase,Fieldsets,ErrorMessages
    $NewObject.AppType       = $AppType
    $NewObject.Fieldsets     = $Fieldsets
    $NewObject.ErrorMessages = $ErrorMessages
 
    return $NewObject
}
