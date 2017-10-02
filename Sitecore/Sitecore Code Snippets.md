To generate field:
@Html.Sitecore().Field("MetaDescription", new { DisableWebEdit = true })

To generate translation of a 'key' text:
@Sitecore.Globalization.Translate.Text({Key string here}) 
