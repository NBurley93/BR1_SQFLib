/**
	broadcast_sound3d.sqf (C) 2022 BR1Arma

	Plays a sound defined in CfgSounds from a unit

	This differs from play_3d_sound.sqf in that you don't need a path to a file,
	and can use whatever is defined in CfgSounds instead. It also applies audio filters
	such as reverb indoors.

	Note that we can only have a unit "say" one sound sound at a time.

	Killing the unit "saying" the sound, will stop the sound

	Example: `[baseRadio, mixtapeAudio1, 5, 1, 60] execVM "scripts/broadcast_sound3d.sqf";`
*/

params ["_unit", "_sound", "_pitch", "_distance"];
_unit say3D [_sound, _distance, _pitch, false, 0];