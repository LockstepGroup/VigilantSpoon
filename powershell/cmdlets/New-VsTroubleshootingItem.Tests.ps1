$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsTroubleshootingItem" {
    $NewObject = New-VsTroubleshootingItem "header" "info"
    It "Header set correctly" {
        $NewObject.Header | Should BeExactly "header"
    }
    It "Content set correctly" {
        $NewObject.Content | Should BeExactly "info"
    }
}
