function New-VsTroubleshootingItem {
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$True,Position=0)]
        [string]$Header,
        
        [Parameter(Mandatory=$True,Position=1)]
        [string]$Content
    )
    
    $NewObject         = "" | Select Header,Content
    $NewObject.Header  = $Header
    $NewObject.Content = $Content
    
    return $NewObject
}
