/**
	disable_group.sqf (C) 2022 BR1Arma

	Disables simulation and hides all the units in a given group. This should ONLY be called on the server

	Useful for making groups of enemies only appear with queued waypoints once a condition is met

	Example: `[my_homies] execVM "scripts/disable_group.sqf";`
*/

params ["_unit"];
_unit enableSimulationGlobal false; 
_unit hideObjectGlobal true;