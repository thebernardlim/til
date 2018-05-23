<#
    .SYNOPSIS
        Lists all content items updated within the selected time range
    
    .NOTES
        Michael West
#>

$item = gi master:\sitecore\Content\Home\

$contentSettings = Read-Variable -Parameters `
    @{ Name = "item"; Title="Content branch to analyse"; Tooltip="Branch you want to analyse."; Root="/sitecore/content/home/"} `
    -Description "This report will analyse the content branch and will tell you which content items have been updated within your selected date range." `
    -Title "Root Content Item Selection" -Width 500 -Height 280 `
    -OkButtonName "Proceed" -CancelButtonName "Abort" 

$beforeSettings = @{
    Title = "Report Filter"
    Width = "350"
    Height = "250"
    OkButtonName = "Proceed"
    CancelButtonName = "Abort"
    Description = "Filter the results for items updated on or before the specified date"
    Parameters = @{ 
        Name = "before"
        Value = [System.DateTime]::Now
        Title = "Before Date"
        Tooltip = "Filter the results for items updated on or before the specified date"
        Editor = "date time"
    }
}

$afterSettings = @{
    Title = "Report Filter"
    Width = "350"
    Height = "250"
    OkButtonName = "Proceed"
    CancelButtonName = "Abort"
    Description = "Filter the results for items updated on or after the specified date"
    Parameters = @{ 
        Name = "after"
        Value = [System.DateTime]::Now
        Title = "After Date"
        Tooltip = "Filter the results for items updated on or after the specified date"
        Editor = "date time"
    }
}

if($contentSettings -ne "ok")
{
    Close-Window
    Exit
}

$beforeSettingsResult = Read-Variable @beforeSettings
if($beforeSettingsResult -ne "ok") {
    Exit
}

$afterSettings = Read-Variable @afterSettings
if($afterSettings -ne "ok") {
    Exit
}

function Get-MediaItem {
    param(
        [datetime]$After=([datetime]::Today)
    )
    
    $items = Get-ChildItem -Path $item.Paths.Path -Recurse | Where-Object { $_.TemplateID -ne [Sitecore.TemplateIDs]::MediaFolder }
    
    foreach($item in $items) {
        if(($item."__Updated" -ge $Before) -and ($item."__Updated" -le $After)) {
            $item
        }
    }
}


cd "$($item.Database.Name):\"

$items = Get-MediaItem -After $after

if($items.Count -eq 0) {
    Show-Alert "There are no items updated on or after the specified date"
} else {
    $props = @{
        InfoTitle = "Items last updated after date"
        InfoDescription = "Lists all items last updated later than the date selected."
        PageSize = 25
    }
    
    $items |
        Show-ListView @props -Property @{Label="Name"; Expression={$_.DisplayName} },
            @{Label="Updated"; Expression={$_.__Updated} },
            @{Label="Updated by"; Expression={$_."__Updated by"} },
            @{Label="Created"; Expression={$_.__Created} },
            @{Label="Created by"; Expression={$_."__Created by"} },
            @{Label="Path"; Expression={$_.ItemPath} }
}
Close-Window