Problem: Updating .cshtml files requires manual IIS restart for changes to take effect

Symptoms : 
- Errors always pointing to the same line, even though you remove all the code from the affected .cshtml page.
- Simple changes (Adding / Updating new text) on page that can load, are not reflected.
- The above scenarios only change after a full IIS restart

Diagnosis:
- Try replicating similar tasks on other instances within same server / IIS.
- If same behavior happens, something to do with FCN (i.e. File Change Notifications)

Cause: FCN is not working properly, hence file changes are not detected which should prompt AppDomain restart each time a change is detected.

Solution:
- Site-specific change: 
Explicitly setting the HttpRuntimeSection.FcnMode property under 'Web.config' for site-specific setting.

Example: \<httpRuntime fcnMode="Disabled"/>

- System wide change: Change the DWORD registry setting for HKLM\SOFTWARE\Wow6432Node\Microsoft\ASP.NET\FCNMode to the value 0, which will enable all file change notifications.
 
