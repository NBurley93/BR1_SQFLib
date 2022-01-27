/**
	TicketRespawnHook.sqf (C) 2022 BR1Arma

	Hooks into onPlayerRespawn.sqf in the missionfolder to handle when the player respawns,
	ensuring that we subtract a ticket
 */

_initSpawn = player getVariable "player_init_spawn";
if(_initSpawn == 1) then {
	player setVariable ["player_init_spawn",0];
} else {
	private _playerSide = side group player;
	[_playerSide, -1] remoteExec ["BIS_fnc_respawnTickets", 2];
	_remainingtickets = [_playerSide] call BIS_fnc_respawnTickets;
	
		if(_remainingtickets==0) then {
			_remainingtickets = 0;
		} else {
			_remainingtickets = _remainingtickets-1;
		};
		
	[format ["%1 was killed! Your team has %2 tickets remaining", name player,_remainingtickets]] remoteExec ["systemChat", _playerSide];
};