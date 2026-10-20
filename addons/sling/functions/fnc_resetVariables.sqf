#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Resets related variables for a unit and deletes slung ground holders.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Sync (optional, default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_resetVariables
 *
 * Public: No
 */

params ["_unit", ["_sync", true]];
TRACE_2("fnc_resetVariables",_unit,_sync);

deleteVehicle GET_SLUNG_HOLDERS(_unit);
_unit setVariable [VAR_SLUNG_ITEMS, nil, _sync];
_unit setVariable [VAR_SLUNG_HOLDERS, nil, _sync];
_unit setVariable [VAR_HIDE_SLUNG_HOLDERS, nil]; // Only needs to be local
