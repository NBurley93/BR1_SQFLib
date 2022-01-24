/**
initServer.sqf (C) 2022 BR1Arma

This file is executed upon server startup, this occurs first in the initialization sequence for multiplayer, and is only run server-side
**/

[] execVM "diagnostics.sqf";
diag_log text "--------------------[Executed show_fps on Server]--------------------"; //will show in server logs