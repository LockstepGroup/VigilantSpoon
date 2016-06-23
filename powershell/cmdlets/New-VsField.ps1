function New-VsField {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True,Position=1)]
        [string]$Name,
        
        [Parameter(Mandatory=$False)]
        [string]$Label,
        
        [Parameter(Mandatory=$False)]
        [switch]$Inline,
        
        # text
        [Parameter(Mandatory=$True,Position=0,ParameterSetName="text")]
        [switch]$Text,
        
        [Parameter(Mandatory=$False,Position=2,ParameterSetName="text")]
        [string]$Placeholder,
        
        [Parameter(Mandatory=$False,ParameterSetName="text")]
        [array]$Validators = @(),

        [Parameter(Mandatory=$False,ParameterSetName="text")]
        [string]$Example,
        
        # select
        [Parameter(Mandatory=$True,Position=0,ParameterSetName="select")]
        [switch]$Select,
        
        [Parameter(Mandatory=$False,Position=2,ParameterSetName="select")]
        [array]$Options,
        
        # checkbox
        [Parameter(Mandatory=$True,Position=0,ParameterSetName="checkbox")]
        [switch]$Checkbox
    )

    if ($Text)     { $Type = "text" }
    if ($Select)   { $Type = "select"}
    if ($Checkbox) { $Type = "checkbox"}

    $NewObject             = "" | Select Name,Type,Placeholder,Validators,Label,Options,Inline,Example
    $NewObject.Name        = $Name
    $NewObject.Type        = $Type
    $NewObject.Label       = $Label
    $NewObject.Placeholder = $Placeholder
    $NewObject.Options     = $Options
    $NewObject.Example     = $Example
    
    if ($Inline) {
        $NewObject.Inline = "true"
    } else {
        $NewObject.Inline = "false"
    }

    return $NewObject
}
