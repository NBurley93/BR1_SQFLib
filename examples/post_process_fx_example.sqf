/**
	post_process_fx_example.sqf  (C) 2022 BR1Arma

	This script demonstrates using ppEffectCreate, ppEffectAdjust, ppEffectCommit, and ppEffectDestroy

	Fyi. There is a useful workshop scenario that greatly assists with building ppEffects with visual feedback,
	then exporting the code directly to your clipboard

	https://steamcommunity.com/sharedfiles/filedetails/?id=350606620
*/

// Create a dynamic blur ppEffect (aka fullscreen blur)
ppDynamicBlur = ppEffectCreate ["DynamicBlur", 400];
ppDynamicBlur ppEffectAdjust [50]; // Set "blurriness" of the effect
ppDynamicBlur ppEffectCommit 2; // Take two seconds to apply effect (effect fades in)
waitUntil { ppEffectCommitted ppDynamicBlur } // Wait until the effect is committed

sleep 5; // maintain effect for 5 seconds

// Optional effect to fade back to normal before deleting the effect
ppDynamicBlur ppEffectAdjust [0]; // Revert to no blurriness
ppDynamicBlur ppEffectCommit 2; // Two second commit time
waitUntil { ppEffectCommitted ppDynamicBlur } // Wait until the effect is committed
ppEffectDestroy ppDynamicBlur; // Destroy the effect, not mandatory if it's the end of the script,
							   // but can free up the variable/handle for use elsewhere in the script