#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Determines if a unit can sling their helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if helmet can be slung, otherwise false
 *
 * Example:
 * player call hoa_sling_fnc_canSlingItems
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canSlingItems",_unit);

GVAR(enabled) && alive _unit && { GET_SLUNG_ITEMS(_unit) isEqualTo [] };
