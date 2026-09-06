#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a unit exiting a vehicle.
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

private _slungItems = _unit getVariable [QGVAR(slungItems), []];
if (_slungItems isEqualTo []) exitWith {};

[_unit, 0, _slungItems, false] call FUNC(slingHelmet);

private _slungItems = _unit getVariable [QGVAR(slungHolders), []];

if (_unit getVariable [QGVAR(slungHelmetHidden), false]) then {
    [QGVAR(hideObjects), [_slungItems, true]] call CBA_fnc_serverEvent;
};
