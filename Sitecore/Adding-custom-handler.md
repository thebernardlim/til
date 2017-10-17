###
1. Add record under \<customHandlers> in specific file under App_Config:


	\<customHandlers>
				
	\<handler trigger="/~/tenantportal/formhandler" handler="FormHandler.ashx" />
		
	\</customHandlers>

2. Web.config:
Add record under \<handlers>:

	\<handlers>
	
	\<add verb="*" path="FormHandler.ashx" type="SwireTenantPortal.xsl.tenantportal.FormHandler" name="FormHandler"/>  

	\</handlers>



