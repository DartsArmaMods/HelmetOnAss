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

if (!isServer) exitWith {};

private _slungItems = _unit getVariable [QGVAR(slungItemsTempDoNotUseThis), []];
if (_slungItems isEqualTo []) exitWith {};

[{
    params ["_unit", "_slungItems"];

    [_unit, 0, _slungItems, false] call FUNC(slingHelmet);
    private _groundholders = _unit getVariable [QGVAR(slungHelmetItems), []];

    if (_unit getVariable [QGVAR(slungHelmetHidden), false]) then {
        [QGVAR(hideObjects), [_groundholders, true]] call CBA_fnc_serverEvent;
    };
}, [_unit, _slungItems], 0.1] call CBA_fnc_waitAndExecute;
