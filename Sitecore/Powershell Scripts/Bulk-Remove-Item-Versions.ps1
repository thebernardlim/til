#Using Get-ChildItem and recurse. Extremely slow performance
$items = Get-ChildItem -Path master:\content\home\MyHome -Language "en" -recurse | Where-Object {$_.'__Updated by' -contains "sitecore\User"} 
$items | Remove-ItemVersion

#Using Axes. Way faster performance. Recommended approach
$homeItem = Get-Item -Path "/sitecore/Content/Home/MyHome" -Language "en"
$items = $homeItem.Axes.GetDescendants() | Where-Object {$_.Fields['__Updated by'].Value -contains "sitecore\User"} 
$items | Remove-ItemVersion

#Do also note the syntax differences. Need to use 'Fields' for Axes, whereas if using Get-ChildItem, can directly use $_.'Field Name'


