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

[{
    private _slungItems = _this getVariable [QGVAR(slungHelmetItems), []];
    GVAR(slungHelmetPosition) params ["_bone", "_attachPos", "_vectorDirAndUp"];

    {
        _x attachTo [_this, _attachPos, _bone, true];
        _x setVectorDirAndUp _vectorDirAndUp;
    } forEach _slungItems;
    [QGVAR(hideObjects), [_slungItems, _this getVariable [QGVAR(slungHelmetHidden), false]]] call CBA_fnc_serverEvent;
}, _unit, 0.5] call CBA_fnc_waitAndExecute;
