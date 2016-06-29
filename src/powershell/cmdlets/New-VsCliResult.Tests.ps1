$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsCliResult" {
    It "returns a valid CliResult object" {
        $NewCliResult = New-VsCliResult "My Header" "My Content"
        $NewCliResult.Header  | Should be "My Header"
        $NewCliResult.Content | Should be "My Content"
    }
}
