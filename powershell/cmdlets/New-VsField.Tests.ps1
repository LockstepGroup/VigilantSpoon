$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "New-VsField" {
    Context "return a valid text field" {
        $NewField = New-VsField -Text -Name "My Field"
        It "Type set to text" {
            $NewField.Type | Should BeExactly "text"
        }
        It "Name set correctly" {
            $NewField.Name | Should BeExactly "My Field"
        }
        It "Validators are empty" {
            $NewField.Validators | Should BeNullOrEmpty
        }
    }
    Context "return a valid checkbox" {
        $NewField = New-VsField -Checkbox "My Checkbox"
        It "Type set to checkbox" {
            $NewField.Type | Should BeExactly "checkbox"
        }
    }
    Context "return a valid select" {
        $NewField = New-VsField -Select "My Checkbox" @("option1","option2")
        It "Type set to select" {
            $NewField.Type | Should BeExactly "select"
        }
        It "Options is correct length" {
            $NewField.Options.Count | Should Be 2
        }
    }
    Context "check optional parameters set" {
        $NewField = New-VsField -Text -Name "My Field" -Label "My Label" -Inline -Example "Example Text"
        It "Label set correctly" {
            $NewField.Label | Should Be "My Label"
        }
        It "Inline is set to 'true'" {
            $NewField.Inline | Should Be "true"
        }
        It "Example set correctly" {
            $NewField.Example | Should Be "Example Text"
        }
    }
    Context "check optional parameters set" {
        $NewField = New-VsField -Text -Name "My Field"
        It "Label is empty" {
            $NewField.Label | Should BeNullOrEmpty
        }
        It "Inline is set to 'false'" {
            $NewField.Inline | Should Be "false"
        }
        It "Example is null" {
            $NewField.Example | Should BeNullOrEmpty
        }
    }
}
