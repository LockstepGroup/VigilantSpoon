function New-VsFieldValidator {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True)]
        [string]$ErrorMessage,
        
        # different
        [Parameter(Mandatory=$True,ParameterSetName="different",Position=0)]
        [switch]$Different,
        
        [Parameter(Mandatory=$True,ParameterSetName="different",Position=1)]
        [string]$CompareToField,

        # ip
        [Parameter(Mandatory=$True,ParameterSetName="ip",Position=0)]
        [switch]$Ip,
        
        [Parameter(Mandatory=$False,ParameterSetName="ip")]
        [switch]$IPv4Only,
        
        [Parameter(Mandatory=$False,ParameterSetName="ip")]
        [switch]$IPv6Only,
        
        # notempty
        [Parameter(Mandatory=$True,ParameterSetName="notempty",Position=0)]
        [switch]$NotEmpty,
        
        # regexp
        [Parameter(Mandatory=$True,ParameterSetName="regexp",Position=0)]
        [switch]$RegularExpression,
        
        [Parameter(Mandatory=$True,ParameterSetName="regexp",Position=1)]
        [string]$Pattern,
        
        # between
        [Parameter(Mandatory=$True,ParameterSetName="between",Position=0)]
        [switch]$Between,
        
        [Parameter(Mandatory=$True,ParameterSetName="between",Position=1)]
        [double]$Min,
        
        [Parameter(Mandatory=$True,ParameterSetName="between",Position=2)]
        [double]$Max,
        
        [Parameter(Mandatory=$False,ParameterSetName="between")]
        [switch]$Inclusive
    )

    if ($Different)         { $Type = "different" }
    if ($Ip)                { $Type = "ip"        }
    if ($NotEmpty)          { $Type = "notempty"  }
    if ($RegularExpression) { $Type = "regexp"    }
    if ($Between)           { $Type = "between"   }
    
    $NewObject = @()
    $NewObject += New-VsHtmlAttribute ("data-fv-$Type").ToLower() "true"
    $NewObject += New-VsHtmlAttribute ("data-fv-$Type-message").ToLower() $ErrorMessage

    switch ($Type) {
        "different" {
            $NewObject += New-VsHtmlAttribute "data-fv-different-field" $CompareToField
            break
        }
        "ip" {
            if ($IPv4Only) { $NewObject += New-VsHtmlAttribute "data-fv-ip-ipv6" 'false' }
            if ($IPv6Only) { $NewObject += New-VsHtmlAttribute "data-fv-ip-ipv4" 'false' }
            break
        }
        "regexp" {
            $NewObject += New-VsHtmlAttribute "data-fv-regexp-regexp" $Pattern
        }
        "between" {
            $NewObject += New-VsHtmlAttribute "data-fv-between-min" $Min
            $NewObject += New-VsHtmlAttribute "data-fv-between-max" $Max
            if ($Inclusive) { $NewObject += New-VsHtmlAttribute "data-fv-between-inclusive" "true" }
        }
    }

    return $NewObject    
}
