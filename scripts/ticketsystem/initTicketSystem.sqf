params ["_westtick","_easttick",_"indtick"];
//Params are # of tickets for west, east, independent.
//Used in init.sqf
// TICKET SYSTEM
if (isServer) then {
		[west, _westtick] call BIS_fnc_respawnTickets;
		[east, _easttick] call BIS_fnc_respawnTickets;
		[independent, _indtick] call BIS_fnc_respawnTickets;
};

//checks if player kills civilian
if (isServer || (!hasInterface && !isServer)) then {
addMissionEventHandler [
  "EntityKilled",
    {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

      if (
        local _unit &&
        _unit isKindOf "CAManBase" &&
        side group _unit == civilian
      ) then 
      {
        private _playerSide = side group _instigator;
        [_playerSide, -1] remoteExec ["BIS_fnc_respawnTickets", 2];
        _remainingtickets = [_playerSide] call BIS_fnc_respawnTickets;

        //subtracts tickets if civilian killed
        if(_remainingtickets==0) then 
        {
          _remainingtickets = 0;
        } 
        else 
        {
          _remainingtickets = _remainingtickets-1;
        };
        //displays message in system chat
        [format ["%1 has killed a civilian! A respawn ticket was lost! %2 tickets remain", name _instigator,_remainingtickets]] remoteExec ["systemChat", _playerSide];
      };		
    }
  ];
};
