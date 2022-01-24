/**
initPlayerLocal.sqf (C) 2022 BR1Arma

This file executes when a player connects into the server on their machine.
Useful for making clientside attributes global across all players such as weapon sway or stamina
**/

[] execVM "scripts/QS_icons.sqf"; // Enables the soldier tracker that allows players to see other players of their own faction on the map in realtime

waitUntil {!isnull player}; // Wait until the player unit is defined (ie. created by the mission), this will prevent script failures due to players being present in the server when a missionfile switches

player enableStamina false; // Disables fatigue

player setCustomAimCoef 0; // Disables weapon sway

player addEventHandler ["Respawn", {player enableStamina false}]; // Adds an event handler ensuring that fatigue is disabled upon respawn.

player addEventHandler ["Respawn", {player setCustomAimCoef 0}]; // Same as above, but with weapon sway

showScoretable 0; // Force disable the scoreboard