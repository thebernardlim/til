###

1. If taking too long to install packages:
- Check if MongoDB instance is running
- Try to start MongoDB instance.
- If MongoDB instance still fails to run, check MongoDB logs for error causing inability to start.
- A common error MongoDB gets when unable to startup could be either not enough disk space or db required to be repaired (Error message "connect failed Unclean shutdown detected." seen).
- To fix this error, run 'mongod --repair'

