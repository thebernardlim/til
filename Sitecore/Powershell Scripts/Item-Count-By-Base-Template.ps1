$items = Get-ChildItem -Path "master:/sitecore/templates/" -Recurse

$templateCount = 0

foreach ($i in $items){
     $hasTemplate = [Sitecore.Data.Managers.TemplateManager]::GetTemplate($i).InheritsFrom("{12545-6030-46C5-B394-E8F99E8B87DB}");
     #Write-Host $hasTemplate
     
     if ($hasTemplate){
        Write-Host $i.Paths.FullPath
        $templateCount++ 
     }
}

Write-Host $templateCount


