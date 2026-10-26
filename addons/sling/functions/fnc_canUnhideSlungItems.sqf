#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Determines if a unit can unhide their helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if helmet can be unhidden, otherwise false
 *
 * Example:
 * player call hoa_sling_fnc_canUnhideSlungItems
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canUnhideSlungItems",_unit);

(GET_SLUNG_ITEMS(_unit) isNotEqualTo []) && (_unit getVariable [VAR_HIDE_SLUNG_HOLDERS, false]);
