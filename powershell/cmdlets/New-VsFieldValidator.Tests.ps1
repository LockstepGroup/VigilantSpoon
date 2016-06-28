$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
. "$here\New-VsHtmlAttribute.ps1"

Describe "New-VsFieldValidator" {
    $Params                = @{}
    $Params.ErrorMessage   = "myerror"
    Context "Validator: Different" {
        $Type                  = "Different"
        $Params.$Type          = $true
        $Params.CompareToField = "myfield"
        $NewValidator          = New-VsFieldValidator @Params
        It "data-fv-$Type = `'true`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type" }).Value | Should BeExactly 'true'
        }
        It "data-fv-$Type-message = `'$($Params.ErrorMessage)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-message" }).Value | Should BeExactly $Params.ErrorMessage
        }
        It "data-fv-$Type-field = `'$($Params.CompareToField)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-field" }).Value | Should BeExactly $Params.CompareToField
        }
        $Params.Remove($Type)
        $Params.Remove("CompareToField")
    }
    Context "Validator: Ip" {
        $Type         = "Ip"
        $Params.$Type = $true
        $NewValidator = New-VsFieldValidator @Params
        It "data-fv-$Type = `'true`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type" }).Value | Should BeExactly 'true'
        }
        It "data-fv-$Type-message = `'$($Params.ErrorMessage)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-message" }).Value | Should BeExactly $Params.ErrorMessage
        }
        It "No IP version settings set when excluded" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-ipv4" }).Value | Should BeNullOrEmpty
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-ipv6" }).Value | Should BeNullOrEmpty
        }
        $Params.IPv4Only = $true
        $NewValidator = New-VsFieldValidator @Params
        It "data-fv-$Type-ipv6 is `'false`' with -IPv4Only" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-ipv6" }).Value | Should BeExactly 'false'
        }
        $Params.Remove('IPv4Only')
        $Params.IPv6Only = $true
        $NewValidator = New-VsFieldValidator @Params
        It "data-fv-$Type-ipv4 is `'false`' with -IPv6Only" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-ipv4" }).Value | Should BeExactly 'false'
        }
        $Params.Remove('IPv6Only')
        $Params.Remove($Type)
    }
    Context "Validator: NotEmpty" {
        $Type         = "NotEmpty"
        $Params.$Type = $true
        $NewValidator = New-VsFieldValidator @Params
        It "data-fv-$Type = `'true`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type" }).Value | Should BeExactly 'true'
        }
        It "data-fv-$Type-message = `'$($Params.ErrorMessage)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-message" }).Value | Should BeExactly $Params.ErrorMessage
        }
        $Params.Remove($Type)
    }
    Context "Validator: RegularExpression" {
        $Type           = "RegularExpression"
        $Params.$Type   = $true
        $Params.Pattern = "mypattern"
        $NewValidator   = New-VsFieldValidator @Params
        It "data-fv-regexp = `'true`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-regexp" }).Value | Should BeExactly 'true'
        }
        It "data-fv-regexp-message = `'$($Params.ErrorMessage)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-regexp-message" }).Value | Should BeExactly $Params.ErrorMessage
        }
        It "data-fv-regexp-regexp = `'$($Params.Pattern)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-regexp-regexp" }).Value | Should BeExactly $Params.Pattern
        }
        $Params.Remove($Type)
        $Params.Remove("Pattern")
    }
    Context "Validator: Between" {
        $Type         = "Between"
        $Params.$Type = $true
        $Params.Min   = 0
        $Params.Max   = 30
        $NewValidator = New-VsFieldValidator @Params
        It "data-fv-$Type = `'true`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type" }).Value | Should BeExactly 'true'
        }
        It "data-fv-$Type-message = `'$($Params.ErrorMessage)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-message" }).Value | Should BeExactly $Params.ErrorMessage
        }
        It "data-fv-$Type-min = `'$($Params.Min)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-min" }).Value | Should BeExactly $Params.Min
        }
        It "data-fv-$Type-max = `'$($Params.Max)`'" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-max" }).Value | Should BeExactly $Params.Max
        }
        It "data-fv-$Type-inclusive = `'false`' without -Inclusive" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-inclusive" }).Value | Should BeNullOrEmpty
        }
        $Params.Inclusive = $true
        $NewValidator = New-VsFieldValidator @Params
        It "data-fv-$Type-inclusive = `'true`' with -Inclusive" {
            ($NewValidator | ? { $_.Attribute -eq "data-fv-$Type-inclusive" }).Value | Should BeExactly 'true'
        }
        $Params.Remove("Min")
        $Params.Remove("Max")
        $Params.Remove("Inclusive")
    }
}