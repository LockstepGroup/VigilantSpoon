function New-VsHtmlAttribute {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True,Position=0)]
        [string]$Attribute,
        
        [Parameter(Mandatory=$True,Position=1)]
        [string]$Value
    )
    
    $NewObject           = "" | Select Attribute,Value
    $NewObject.Attribute = $Attribute
    $NewObject.Value     = $Value
    
    return $NewObject
}
