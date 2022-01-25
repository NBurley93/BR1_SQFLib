/**
	play_3d_sound.sqf (C) 2022 BR1Arma

	Plays a sound from a path to an OGG file on a unit's location with customizable volume, pitch, and distance

	volume: Default is 1, don't try to use anything higher than 5 as it gets capped

	pitch:
		1.0 → normal
		0.5 → Darth Vader
		2.0 → Chipmunks

	distance: Audible distance for the sound in meters, using 0 means it can be heard globally

	Good for audiologs or ambient radios

	Example: `[whirlyBird, "snd\fortunate_son.ogg", 5, 1, 60] execVM "scripts/play_3d_sound.sqf";`
*/

params ["_unit", "_sound", "_volume", "_pitch", "_distance"];
playSound3D [getMissionPath _sound, _unit, false, getPosASL _unit, _volume, _pitch, _distance];