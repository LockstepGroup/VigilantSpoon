$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsHtmlAttribute" {
    $NewObject = New-VsHtmlAttribute "myattribute" "myvalue"
    It "`'Attribute`' is set correctly" {
        $NewObject.Attribute | Should Be "myattribute"
    }
    It "`'Value`' is set correctly" {
        $NewObject.Value | Should Be "myvalue"
    }
}
