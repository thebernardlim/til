###
Purpose: Deploy to remote server from Visual Studio

##Visual Studio

1. Settings

Publish Method: Web Deploy
Server : {IP Address}
Site Name : Name in IIS instance
Username/Pw : Credentials to login to site
Destination URL : {Destination URL of site}

2. Validate Connection

###Destination Server

https://docs.microsoft.com/en-us/iis/install/installing-publishing-technologies/installing-and-configuring-web-deploy-on-iis-80-or-later

- Download WebDeploy directly from website instead of through Web Platform Installer.
- Enable all features manually
  - IIS Deployment Handler and child items
- Open IIS Manager, choose Management Service -> Check 'Enable remote connections' if getting 403 Forbidden error
- Open up Services, and ensure that both 'Web Deployment Agent Service' and 'Web Management Service' is running.

3. Try Publish





