$userList = Get-User -Filter * |
    Where-Object {$_.Domain -eq "sitecore" -and -not $_.IsAdministrator}
    
$userCount = 0
foreach ($user in $userList){
    Write-Host $user.Name
}
