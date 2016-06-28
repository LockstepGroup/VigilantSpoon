function New-VsResultObject {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True,Position=0)]
        [ValidateSet("clioutput","parser")]
        [string]$AppType,
        
        [Parameter(Mandatory=$True,Position=1)]
        [array]$Results,

        [Parameter(Mandatory=$False,Position=2)]
        [array]$Troubleshooting
    )
    
    $NewObject                 = "" | Select AppType,Results,Troubleshooting
    $NewObject.AppType         = $AppType
    $NewObject.Results         = $Results
    $NewObject.Troubleshooting = $Troubleshooting 
    
    return $NewObject
}
