/**
	snippets.sqf (C) 2022 BR1Arma

	This is a collection of code snippets that can be useful to paste in, 
	especially if you don't have the wiki on-hand
*/

// Execute a script, will NOT synch over all clients, use this for code we expect to only run server-side
["foo", "bar"] execVM "scripts/foobar.sqf";

// If you want to wait for the script to finish executing, you can use the returned handle.
// Note that this doesn't work with remoteExec since remoteExec does not return a script handle
_scriptHandle = ["foo", "bar"] execVM "scripts/foobar.sqf";
waitUntil { scriptDone _scriptHandle };

// Execute a script file on a multiplayer client
// Reference https://community.bistudio.com/wiki/remoteExec
// See https://community.bistudio.com/wiki/Arma_3:_Remote_Execution for information
// about remote execution in general
["scripts/foobar.sqf", "foo", "bar"] remoteExec [execVM, 0, false];

// Adds a camera shake effect, used in vanilla for the earthquakes and explosion fx
// Args are [power, duration, frequency]
// Power is any value between 0 and 20
// Duration is the number of seconds we shake, divided by 2 (so 10 would give us 5 seconds)
// Frequency is obviously the frequency of the shake, should be between 0 and 100
addCamShake [5, 10, 25];

// Adds an action-menu action to a unit, I usually just run this for a flagpole
// out in the middle of nowhere for cues I want to trigger manually such as music
this addAction ["Do stuff", {["scripts\foobar.sqf", "foo", "bar"] remoteExec ["execVM", 0, false]} ];

// Same as above, but for something that only runs on the server instance
this addAction ["Do serverside stuff", {["foo", "bar"] execVM "scripts\foobar.sqf"} ];

// And a more generic example
this addAction ["Do generic stuff", { /** Put SQF code here, right now this does nothing*/ }];

// Shows a notification onscreen in the same way that objective statuses are shown.
// Reference: https://community.bistudio.com/wiki/BIS_fnc_showNotification
// Has local locality
["RespawnAdded", ["RESPAWN", "Captured Supply Depot available for respawn", ""]] call BIS_fnc_showNotification;