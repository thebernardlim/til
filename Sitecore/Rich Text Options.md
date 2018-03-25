Sitecore Rich Text options can be edited. Some options are hidden by default, for example, font size & color.

To enable full options for Sitecore Rich Text Editor for a specific rich-text field:
- In your template, access the 'Builder' tab. For the Rich-Text field, put either of the below values under the 'Source' field.

To enable full options for Sitecore Rich Text Editor for the whole Sitecore instance:
- Open web.config
- Find '<setting name="HtmlEditor.DefaultProfile" value="/sitecore/system/Settings/Html Editor Profiles/Rich Text Default" />'. Replace the 'value' to either of the values below.

Sitecore Rich Text options:
/sitecore/system/Settings/Html Editor Profiles/Rich Text Default
/sitecore/system/Settings/Html Editor Profiles/Rich Text Full
/sitecore/system/Settings/Html Editor Profiles/Rich Text IDE
/sitecore/system/Settings/Html Editor Profiles/Rich Text Medium