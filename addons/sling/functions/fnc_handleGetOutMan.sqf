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

if (_unit isNotEqualTo ace_player) exitWith {};

private _slungItems = GET_SLUNG_ITEMS(_unit);
if (_slungItems isEqualTo []) exitWith {};

[LINKFUNC(slingHelmet), [_unit, 0, _slungItems, false], 0.1] call CBA_fnc_waitAndExecute;
