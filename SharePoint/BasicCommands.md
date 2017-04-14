
### Remove Old Web Part
1.	Central Admin -> System Settings -> Manage Farm Solutions -> Choose Specific Solution to remove
2.	Retract Solution
3.	Remove Solution


### Upload new custom webpart
1.	Sharepoint Mgmt Shell : `Add-SPSolution {Path of WSP file of webpart 'CustomWebPart.wsp' `
    Example command: `Add-SPSolution C:\CustomWebPart.wsp`
2.	Central Admin -> System Settings -> Manage Farm Solutions -> Choose 'CustomWebPart.wsp' -> Deploy
3.	Site Settings -> Site Collection Admin -> Features -> Activate {Visual web part}


### Importing Lists
`Import-SPWeb -identity http://sharepointdev01/ -path C:\Roles.cmp`

### To force deployment of webpart when GUID clash
1.	Remove old solution
2.	`Add-SPSolution {Path of WSP file}`
3.	`stsadm -o deploysolution -name {WSP name} -url {url of sharepoint site} -local -allowGacDeployment –force`

Eg: `stsadm -o deploysolution -name CustomWebPart.wsp -url http://spdev-01:29900/sites/testsite/ -local -allowGacDeployment -force`

### To force retract solution when retracting from GUI is too slow/hang
Command: `Uninstall-SPSolution -Identity "{wspname.wsp}" –allwebapplications`

### To uninstall and retract solution when there is problems retracting through UI / Command line
`Uninstall-SPSolution –Identity MySharePointSolution.wsp –WebApplication http://myspwebapp`
`Remove-SPSolution–Identity MySharePointSolution.wsp`

### Generate LINQ to SP Classes
`SPMetal /web:http://spdev-01:29900/sites/testsite /code:MyClass.cs /serialization:unidirectional`



