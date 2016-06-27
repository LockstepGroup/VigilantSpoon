$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsFieldValidator" {
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