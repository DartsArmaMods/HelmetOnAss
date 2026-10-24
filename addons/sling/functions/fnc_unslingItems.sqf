#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Unslings a unit's helmet. If an item can't be equipped (e.g. because something else is there), the item is instead placed into the unit's inventory or on the ground if it can't fit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_unslingItems
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]]
];
TRACE_1("fnc_unslingItems",_unit);

if !(local _unit && { (_unit call FUNC(canUnslingItems)) }) exitWith {};

[_unit, GET_SLUNG_ITEMS(_unit)] call FUNC(addItems);
deleteVehicle (GET_SLUNG_HOLDERS(_unit));
_unit setVariable [VAR_SLUNG_HOLDERS, nil, true];
_unit setVariable [VAR_SLUNG_ITEMS, nil, true];
