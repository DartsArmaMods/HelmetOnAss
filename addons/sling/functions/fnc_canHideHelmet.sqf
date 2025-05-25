#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Determines if a unit can hide their helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if helmet can be hidden, otherwise false
 *
 * Example:
 * player call slh_sling_fnc_canHideHelmet
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canHideHelmet",_unit);

_unit getVariable [QGVAR(slungHelmetItems), []] isNotEqualTo [] && !(_unit getVariable [QGVAR(slungHelmetHidden), false]);