/**
init.sqf (C) 2022 BR1Arma

This file executes when the missionfile is loaded onto the server.

It is the last initialization script to run on mission startup. Occuring after initServer.sqf on the server,
and initPlayerLocal/initPlayerServer
**/

if (!isDedicated && !hasInterface && isMultiplayer) then { //anything in here gets executed on the headless clients
    [] execVM "diagnostics.sqf";
    diag_log text "--------------------[Executed show_fps on HC]--------------------"; //this will only show in  the HCs logs
};

[true,30,false,false,30,3,true,[]] execVM "WerthlesHeadless.sqf";

// Here's where we start defining ACRE radios, we start by first setting the 152 and 117 radios to their default settings.
["ACRE_PRC152", "default", "main"] call acre_api_fnc_copyPreset;
["ACRE_PRC117F", "default", "main"] call acre_api_fnc_copyPreset;

// Now we can start defining our channel presets, here we set our channel presets for the 152
["ACRE_PRC152", "main", 1, "description", "CMMDNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "main", 2, "description", "PLTNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "main", 3, "description", "Squad 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "main", 4, "description", "Squad 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "main", 5, "description", "Medical"] call acre_api_fnc_setPresetChannelField;


// And channel presets for the 117
["ACRE_PRC117F", "main", 1, "name", "CMMDNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "main", 2, "name", "PLTNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "main", 3, "name", "Squad 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "main", 4, "name", "Squad 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "main", 5, "name", "MEDIC"] call acre_api_fnc_setPresetChannelField;

// Next we forward the changes we've made to the presets to the radios, the previous lines will not take effect
// until these lines are run
["ACRE_PRC152", "main"] call acre_api_fnc_setPreset;
["ACRE_PRC117F", "main"] call acre_api_fnc_setPreset;


// TICKET SYSTEM
// Note that this sets the respawn tickets to 10
if (isServer) then {
		[west, 10] call BIS_fnc_respawnTickets;
};


if (isServer || (!hasInterface && !isServer)) then { // Only called on dedicated multiplayer
    
	// This will add an event call, specifically for whenever a unit is killed. This section is to check if a civilian has been Killed
	// and subtract a ticket accordingly
    addMissionEventHandler [
        "EntityKilled",
        {
            params ["_unit", "_killer", "_instigator", "_useEffects"];

            if (
                local _unit &&
                _unit isKindOf "CAManBase" &&
                side group _unit == civilian
            ) then {
                private _playerSide = side group _instigator;
				[_playerSide, -1] remoteExec ["BIS_fnc_respawnTickets", 2];
				_remainingtickets = [_playerSide] call BIS_fnc_respawnTickets;
				if(_remainingtickets==0) then {
					_remainingtickets = 0;
				} else {
					_remainingtickets = _remainingtickets-1;
				};
				
                [format ["%1 has killed a civilian! A respawn ticket was lost! %2 tickets remain", name _instigator,_remainingtickets]] remoteExec ["systemChat", _playerSide];
            };		
        }
    ];
};
// TICKET SYSTEM