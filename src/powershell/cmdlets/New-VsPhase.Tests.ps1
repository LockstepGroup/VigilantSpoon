$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsPhase" {
    Context "no parameter is provided" {
        It "Should fail if no parameters specified" {
            { New-VsPhase $null } | Should Throw
        }
    }
    Context "only AppType specified" {
        It "Should return an object with the AppType defined, all other properties empty." {
            $AppType = "clioutput"
            $VsPhase = New-VsPhase $AppType
            $VsPhase.AppType | Should Be $AppType
            $VsPhase.NextPhase | Should BeNullOrEmpty
            $VsPhase.Fieldsets | Should BeNullOrEmpty
            $VsPhase.ErrorMessages | Should BeNullOrEmpty
        }
    }
    <#  Get this to work
    Context "invalid AppType" {
        It "Should fail due to unsupported AppType" {
            New-VsPhase "notavalidapptype" -ErrorAction Stop | Should Throw 
        }
    }
    #>
}
