$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsResultObject" {
    $NewObject = New-VsResultObject 'clioutput' @('result1','result2') @('ts1','ts2')
    It "AppType set correctly" {
        $NewObject.AppType | Should BeExactly 'clioutput'
    }
    It "Results array is correct count" {
        $NewObject.Results.Count | Should BeExactly 2
    }
    It "Troubleshooting array is correct count" {
        $NewObject.Troubleshooting.Count | Should BeExactly 2
    }
}
