<configuration xmlns:patch="http://www.sitecore.net/xmlconfig/">
  <sitecore>
    <sites>
      <site patch:before=”*[@name='website']” name=”mysite” ... />
    </sites>
  </sitecore>
</configuration>

You can use the following elements in the x: for the attribute:
-patch:before: Insert the element before the specified element.
-patch:after: Insert the element after the specified element.
-patch:instead: Replace the specified element.
-patch:delete: Remove the specified element.
-patch:attribute: Define or replace the specified attribute.

Source: https://community.sitecore.net/technical_blogs/b/sitecorejohn_blog/posts/all-about-web-config-include-files-with-the-sitecore-asp-net-cms
