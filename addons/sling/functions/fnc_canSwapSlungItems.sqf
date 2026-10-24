#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Determines if a unit can swap their helmets.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if helmets can be swapped, otherwise false <BOOL>
 *
 * Example:
 * player call hoa_sling_fnc_canSwapSlungItems
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canSwapSlungItems",_unit);

headgear _unit != "" && { GET_SLUNG_ITEMS(_unit) isNotEqualTo [] };
