/**
	TicketSystemInit.sqf (C) 2022 BR1Arma

	Hooks into init.sqf in the missionfolder, sets up the Ticket system and ensures that civilian casualties caused by
    the player's side cause ticket loss.

    Accepts a single parameter in the number of tickets the players have to start.

    ex. `[ 10 ] execVM "scripts/TicketSystem/TicketSystemInit.sqf";` initializes the system with 10 starting tickets
 */


params ["_ticketCount"];

if (isServer) then {
    [west, _ticketCount] call BIS_fnc_respawnTickets;
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