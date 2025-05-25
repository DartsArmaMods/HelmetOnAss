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
 * player call slh_sling_fnc_canSlingHelmet
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_canSlingHelmet",_unit);

headgear _unit != "" && { _unit getVariable [QGVAR(slungHelmetItems), []] isEqualTo [] };