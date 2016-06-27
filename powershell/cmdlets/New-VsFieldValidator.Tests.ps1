$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
. "$here\New-VsHtmlAttribute.ps1"

Describe "New-VsFieldValidator" {
    
    #New-VsHtmlAttribute ("data-fv-$Type").ToLower() "true"
    Context "Validator: different" {
        $Type                  = "different"
        $Params                = @{}
        $Params.$Type          = $true
        $Params.ErrorMessage   = "myerror"
        $Params.CompareToField = "myfield"
        $NewValidator          = New-VsFieldValidator @Params
        It "data-fv-$Type = `'true`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type" }).Value | Should BeExactly 'true'
        }
    }
}