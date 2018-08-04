###
1. Add record under \<customHandlers> in specific file under App_Config:


	\<customHandlers>
				
	\<handler trigger="/~/mysubsite/formhandler" handler="FormHandler.ashx" />
		
	\</customHandlers>

2. Web.config:
Add record under \<handlers>:

	\<handlers>
	
	\<add verb="*" path="FormHandler.ashx" type="MySite.xsl.mysubsite.FormHandler" name="FormHandler"/>  

	\</handlers>



