$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsFieldset" {
    $NewObject = New-VsFieldset "myheader" @('field1','field2')
    It "Header set correctly" {
        $NewObject.Header | Should BeExactly 'myheader'
    }
    It "Inputs count is correct" {
        $NewObject.Inputs.Count | Should BeExactly 2
    }
}
