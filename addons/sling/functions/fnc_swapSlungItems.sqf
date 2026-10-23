#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Swaps a unit's slung helmet and their normal helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_swapSlungItems;
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("fnc_swapSlungItems",_unit);

private _slungItems = GET_SLUNG_ITEMS(_unit);
_unit setVariable [VAR_SLUNG_ITEMS, nil];
deleteVehicle GET_SLUNG_HOLDERS(_unit);

_unit call FUNC(slingItems);

// Add currently slung items to inventory
[_unit, _slungItems] call FUNC(addItems);
