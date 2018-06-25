
$items = Get-ChildItem -Path "master:/sitecore/content/Home/ProjectA/" `
    -Recurse |
    Where-Object {  
        (   ($_."TemplateID" -eq "{E3D19E40-4404-4230-B75A-9F70C48AE5AD}") -and 
            ($_."Description".Length -gt 0)
        )
    } 

foreach ($i in $items){
     Write-Host $i.Paths.FullPath
    $i.Editing.BeginEdit()
    $i.Fields["Description"].Value = "<p>This is my text</p>"
    $i.Editing.EndEdit()
}
