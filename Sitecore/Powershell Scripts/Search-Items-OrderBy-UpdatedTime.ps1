#Purpose: Search all items that have been recently updated in the past day
#-1 : 1 day, -24 : 24 days etc

cd "/sitecore/media library/Files/xxxx"
get-childitem -recurse . | `
            Sort $_."__Updated" | `  
           Where-Object   {  $_."__Updated" -gt (Get-Date).AddDays(-1) }
           
