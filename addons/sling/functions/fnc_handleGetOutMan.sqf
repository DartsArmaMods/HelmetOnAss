#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a unit entering a vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Role (unused) <STRING>
 * 2: Vehicle (unused) <OBJECT>
 * 3: Turret (unused) <ARRAY>
 * 4: Is eject (unused) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_handleGetOutMan
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_handleGetOutMan",_unit);

private _slungItems = _unit getVariable [QGVAR(slungHelmetItems), []];
private _uniformConfig = configFile >> "CfgWeapons" >> uniform _unit;
private _attachPos = getArray (_uniformConfig >> QGVAR(slungHelmetPos));
if (_attachPos isEqualTo []) then {
    _attachPos = GVAR(defaultPos);
};

private _pitchBank = getArray (_uniformConfig >> QGVAR(slungHelmetPitchBankYaw));
if (_pitchBank isEqualTo []) then {
    _pitchBank = GVAR(defaultPitchBankYaw);
};
_pitchBank params ["_pitch", "_bank", "_yaw"];

{
    _x attachTo [_unit, _attachPos, "pelvis", true];
    [_x, _pitch, _bank, _yaw] call ace_common_fnc_setPitchBankYaw;
} forEach _slungItems;