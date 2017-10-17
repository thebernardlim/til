Difference in publishing

Setting up VS Solution
1. Select ASP.NET Web App. Empty Template. Select MVC for folder and core references.
2. Replace the following from Sitecore Website.
    - Web.config (Root)
    - Web.config (Under 'Views')
    - Global.asax
3. Delete Global.asax.cs
4. Add 'App_Config' folder
5. Copy the following dlls from Sitecore Website
    - Sitecore.Kernel.dll
    - Sitecore.MVC.Analytics.dll
    - Sitecore.MVC.dll

For each view created, add '@using Sitecore.Mvc' on top

Configuration for MultiSite
- Add file in App_Config
- Key fields: 
    - name
    - rootPath
    - startItem
    - hostName
    - contentStartItem

Template Inheritance to reduce field redundancy
Builder -> Options -> Base Templates

Languages
- Add language.

Dictionaries 
    - Dictionary Entries (System/Dictionary) - Key & Phrase
    - Help text
    - @Sitecore.Globalization.Translate.Text({Key string here}) - To render translation in view

Steps to create components (Controller Rendering)
    - Create Model
    - Create Controller - Add method to rendering View with populated model passed as parameter
    - Create View (with above Model being referenced)
    - Create controller rendering definition item in Sitecore CMS - 
    - Bind component statically : @Html.Sitecore.Rendering("Controller rendering definition item path}") 

Placeholder settings - To add multiple controls. Controls what content authors can add
Data Source Templates - Controls what Data Source item content authors can choose for a component. If Data Source selected is not of the selected template, it cannot be added. This can be edited through 'Experience Editor -> More -> Edit Experience Editor Options'

Component Parameters - 'Experience Editor -> More ->Edit Component Properties'

Rendering Parameter Template 
- To reduce invalid parameter entries for content authors 
- Create under 'Templates'
- Base Template : Standard Rendering Parameter
- In component, point to this parameter template in the field 'Parameters Template'
- Can also change parameter values to be a droplink. Point field 'Source' to ID of parent item of options

Compatible Renderings
- Components that are interchangeable
- Perform similar functions, but slightly different designs
- Accept same data source. Not a requirement.
- Accept same rendering parameters. Not a requirement either.
- Edited through 'Compatible Renderings' field under the respective rendering definition item. Add each other under 'Allowed Controls'
- Through Experience Editor, click on the 'Replace with another component' command/button and select compatible rendering

Component Properties
- Data Source
- Data Source Templates
- Parameters