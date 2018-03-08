#Use: Measure-Command

#Example use:
Measure-Command {
    $homeItem = Get-Item -Path "/sitecore/Content/Home/MyHome" -Language "en"
    $items = $homeItem.Axes.GetDescendants() | Where-Object {$_.Fields['__Updated by'].Value -contains "sitecore\User"} 
    $items | Remove-ItemVersion
} | Select-Object -Expand TotalSeconds

