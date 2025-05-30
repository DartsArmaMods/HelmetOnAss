#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Determines if a unit can unsling their helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if helmet can be unslung, otherwise false
 *
 * Example:
 * player call hoa_sling_fnc_canSlingHelmet
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canUnslingHelmet",_unit);

GVAR(enabled) && headgear _unit == "" && { _unit getVariable [QGVAR(slungHelmetItems), []] isNotEqualTo [] };