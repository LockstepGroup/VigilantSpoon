function New-VsFieldset {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True,Position=0)]
        [string]$Header,
        
        [Parameter(Mandatory=$True,Position=1)]
        [array]$Inputs
    )
    
    $NewObject                = "" | Select Header,Inputs
    $NewObject.Header         = $Header
    $NewObject.Inputs         = @($Inputs)
    
    return $NewObject
}
