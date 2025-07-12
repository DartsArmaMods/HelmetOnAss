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

GVAR(slungHelmetPosition) params ["_bone", "_attachPos", "_vectorDirAndUp"];
{
    _x attachTo [_unit, _attachPos, _bone, true];
    _x setVectorDirAndUp _vectorDirAndUp;
} forEach _slungItems;
[QGVAR(hideObjects), [_slungItems, false]] call CBA_fnc_serverEvent;
