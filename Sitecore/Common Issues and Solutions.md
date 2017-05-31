###

1. If taking too long to install packages:
- Check if MongoDB instance is running
- Try to start MongoDB instance.
- If MongoDB instance still fails to run, check MongoDB logs for error causing inability to start.
- A common error MongoDB gets when unable to startup could be either not enough disk space or db required to be repaired (Error message "connect failed Unclean shutdown detected." seen).
- To fix this error, run 'mongod --repair'


2. Unable to compile or publish site, after setting up new VS project for Sitecore solution due to Razor not recognizing Sitecore related classes.
- Check Sitecore Version and .NET compatibility.
https://kb.sitecore.net/articles/087164
- From experience, Sitecore 8.2 had issue with .NET framework 4.5.2 even though it should be compatible. However after upgrading to .NET 4.6, solution could be published successfully.

3. "The template is used by at least one item" error when deleting template. If there are a lot of templates/ dependencies, what to do?
- Serialize folder, remove through file explorer, then revert tree.






