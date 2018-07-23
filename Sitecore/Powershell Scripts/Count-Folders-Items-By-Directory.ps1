$mediaLibriary = Get-Item "/sitecore/media library/Files/path"
$mediafoldersTemplates = "Media folder", "Node"

$root = $mediaLibriary.Children
$table = @()

foreach($rItem in $root){
    if($mediafoldersTemplates -contains $rItem.TemplateName){
        $table += ProcessChildren -item $rItem
    }
}

$table  | Format-Table -AutoSize

function ProcessChildren($item)
{
    $contOfFolders = 0
    $contOfImages = 0

    $children = $item.Children

    $result = @()
    $tempTable = @()
    foreach($chItem in $children){
        if($mediafoldersTemplates -contains $chItem.TemplateName)
        {
            $contOfFolders++
            $tempTable += ProcessChildren -item $chItem
        }else{
            $contOfImages++
        }
    }


    $objAverage = New-Object System.Object
    $objAverage | Add-Member -type NoteProperty -Name Name -Value $item.Name
    $objAverage | Add-Member -type NoteProperty -Name FolderCount -Value $contOfFolders
    $objAverage | Add-Member -type NoteProperty -Name ItemCount -Value $contOfImages

    $result += $objAverage
    $result += $tempTable

    return $result
}