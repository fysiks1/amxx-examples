#include <amxmodx>

public plugin_init()
{
	register_plugin("Limit Command Use Example", "0.0", "Author")
	
	register_concmd("myTimeLimitedCommand", "cmdLimitByTime")
	register_concmd("myUseLimitCommandPerMap", "cmdUseLimitPerMapCommand")
}


/*
*   Limit use by the time elapsed since last use
*/

new lastTimestamp[MAX_PLAYERS+1]

public cmdLimitByTime(id)
{
	new nowTimestamp = get_systime()

	if( nowTimestamp - lastTimestamp[id] > 60 )
	{
		// 60 seconds has elapsed since last use
		
		/*
		*   Run Command Code Here
		*/

		// Update the saved timestamp in lastTimestamp
		lastTimestamp[id] = nowTimestamp
	}
	else
	{
		// 60 seconds has NOT yet elapsed since last use

		/*
		*   Notify user that they cannot use command until 60 seconds has elapsed since last use
		*/
	}
}


/*
*   Limit use by number of times command has been used on this map
*/

new useCount[MAX_PLAYERS+1]

public cmdUseLimitPerMapCommand(id)
{
	if( useCount[id] < 3 )
	{
		// Command has been used fewer than 3 times this map
		
		/*
		*   Run Command Code Here
		*/
		
		// Increment the stored use count for this command
		useCount[id]++
	}
	else
	{
		// Command has already been used 3 times
		
		/*
		*   Notify user that they can no longer use this command on this map
		*/
	}
}

