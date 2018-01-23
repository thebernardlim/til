#Purpose: Search all items in $searchPath that are based on the given template ID $templateId

$templateId = [Sitecore.Data.ID]::Parse("{CEDE4C21-0CA1-4926-874C-EB2A81AA9366}")
$searchPath = "master:/sitecore/content/home"

$allthethings = @(Get-Item -Path $searchPath) + @(Get-ChildItem -Path $searchPath -Recurse)
foreach($onething in $allthethings) {
    $doesItInherit = [Sitecore.Data.Managers.]::GetTemplate($onething.TemplateID, $onething.Database).InheritsFrom($templateId)
    if($doesItInherit) {
        Write-Host $onething.DisplayName
    }
}