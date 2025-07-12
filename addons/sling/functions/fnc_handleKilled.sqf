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

// TODO: Requires https://github.com/CBATeam/CBA_A3/pull/1764 to not fling corpses
// Add item to inventory, or drop on ground if there's no space
// { [_unit, _x, true, false] call CBA_fnc_addItem } forEach (_unit call FUNC(getSlungItems));
// deleteVehicle (_unit getVariable [QGVAR(slungHelmetItems), []]);
