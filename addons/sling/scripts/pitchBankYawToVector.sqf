#include "..\script_component.hpp"
/*
 * Authors: DartRufffian
 * Converts an array of [pitch, bank, yaw] to a vector dir and up.
 * Not compiled to a function, for development purposes only.
 *
 * Arguments:
 * 0: [pitch, bank, yaw] <ARRAY>
 *
 * Return Value:
 * [vectorDir, vectorUp] <ARRAY>
 *
 * Example:
 * [20, 0, 150] call compileScript ["\z\hoa\addons\sling\scripts_pitchBankYawToVector"]
 *
 * Public: No
 */

params ["_pitch", "_bank", "_yaw"];
[
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _bank, -sin _pitch, cos _bank * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];
