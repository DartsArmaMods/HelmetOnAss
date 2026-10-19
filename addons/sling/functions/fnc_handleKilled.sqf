#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a unit being killed.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_handleKilled
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_handleKilled",_unit);

// Add item to inventory, or drop on ground if there's no space
{ [_unit, _x, true, true] call CBA_fnc_addItem } forEach GET_SLUNG_ITEMS(_unit);
deleteVehicle GET_SLUNG_HOLDERS(_unit);
_unit setVariable [VAR_SLUNG_ITEMS, nil, true];
_unit setVariable [VAR_SLUNG_HOLDERS, nil, true];
_unit setVariable [VAR_HIDE_SLUNG_ITEMS, nil, true];
