Sitecore.Processing.config

<agent type="Sitecore.Tasks.DatabaseAgent" method="Run" interval="00:10:00" name="Master_Database_Agent">
	<param desc="database">master</param>
	<param desc="schedule root">/sitecore/system/tasks/schedules</param>
	<LogActivity>true</LogActivity>
</agent>

Key agent used for 'Scheduled Tasks', i.e. tasks specified through CMS (System--> Tasks): Sitecore.Tasks.DatabaseAgent

For above example, means check for any tasks specified within Master database that is already due, every 10 mins.

To determine if a task is due, it will be dependent on the 'Schedule' field on the Task.
Eg: 20170208|99990101|127|00:00:40
The above task schedule will be read as run from 28th Feb 2017 to 1st Jan 9999, everyday, if current time and last time run is more than 40 seconds.

The above task will not run if the 'Sitecore.Tasks.DatabaseAgent' has not run. Sitecore.Tasks.DatabaseAgent will determine if tasks are ready to be run or not.

More info: https://sitecorebasics.wordpress.com/2011/04/23/description-of-sitecore-jobs/

