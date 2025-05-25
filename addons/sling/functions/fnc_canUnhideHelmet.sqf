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
 * player call slh_sling_fnc_canUnhideHelmet
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canUnhideHelmet",_unit);

_unit getVariable [QGVAR(slungHelmetItems), []] isNotEqualTo [] && _unit getVariable [QGVAR(slungHelmetHidden), false];