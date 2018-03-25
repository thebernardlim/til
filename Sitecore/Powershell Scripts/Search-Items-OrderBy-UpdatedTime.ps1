#Purpose: Search all items that have been recently updated in the past day
#-1 : 1 day, -24 : 24 days etc

cd "\sitecore\Content\Home"
$items = get-childitem -recurse | `
            Sort $_."__Updated" | `  
           Where-Object   {  $_."__Updated" -gt (Get-Date).AddDays(-20) } 
           
$items | ForEach-Object { Write-Host ("Name:{0} `t Full Path: {1}" -f $_.Name,$_.Paths.FullPath) }