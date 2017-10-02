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


