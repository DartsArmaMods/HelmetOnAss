#include "..\script_component.hpp"
/*
 * Authors: DartRufffian
 * Converts pitch/bank/yaw to a vectorDir and vectorUp.
 *
 * Arguments:
 * 0: Pitch <NUMBER>
 * 1: Bank <NUMBER>
 * 2: Yaw <NUMBER>
 *
 * Return Value:
 * [vectorDir, vectorUp] <ARRAY>
 *
 * Example:
 * [20, 0, 150] call hoa_common_fnc_pitchBankYawToVector
 *
 * Public: No
 */

params ["_pitch", "_bank", "_yaw"];
TRACE_3("fnc_pitchBankYawToVector",_pitch,_bank,_yaw);

[
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[
        [sin _bank, -sin _pitch, cos _bank * cos _pitch], -_yaw
    ] call BIS_fnc_rotateVector2D
];
