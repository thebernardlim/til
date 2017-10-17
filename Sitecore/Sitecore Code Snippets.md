To generate field:
@Html.Sitecore().Field("MetaDescription", new { DisableWebEdit = true })

To generate translation of a 'key' text:
@Sitecore.Globalization.Translate.Text({Key string here}) 

To render a view rendering statically within a layout:
@Html.Sitecore.Rendering("Controller rendering definition item path}")

To get current rendering context [Code-behind]
RenderingContext.Current.Rendering.Item

To create editable fields [Code-behind]
FieldRenderer.Render({item in context}, "{field name}")

To retrieve component parameter [Code-behind]
RenderingContext.Current.Rendering.Parameters["CssClass"]