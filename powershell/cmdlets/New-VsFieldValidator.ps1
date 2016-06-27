function New-VsFieldValidator {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True)]
        [string]$ErrorMessage,
        
        # different
        [Parameter(Mandatory=$True,ParameterSetName="different",Position=0)]
        [switch]$Different,
        
        [Parameter(Mandatory=$True,ParameterSetName="different",Position=1)]
        [string]$CompareToField
    )

    if ($Different)         { $Type = "different" }
    
    $NewObject = @()
    $NewObject += New-VsHtmlAttribute ("data-fv-$Type").ToLower() "true"

    return $NewObject    
}
