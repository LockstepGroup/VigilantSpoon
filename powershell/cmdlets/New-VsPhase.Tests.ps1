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
            (New-VsPhase "clioutput").AppType | Should Be "clioutput" 
            (New-VsPhase "clioutput").NextPhase | Should BeNullOrEmpty
            (New-VsPhase "clioutput").Fieldsets | Should BeNullOrEmpty
            (New-VsPhase "clioutput").ErrorMessages | Should BeNullOrEmpty
        }
    }
}
