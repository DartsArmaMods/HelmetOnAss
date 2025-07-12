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
 * player call hoa_sling_fnc_canSlingHelmet
 *
 * Public: No
 */

params ["_unit", ["_mode", 0]];
TRACE_2("fnc_canSlingHelmet",_unit,_mode);

GVAR(enabled) && (_mode == 0 || _mode in GVAR(allowedModes)) && headgear _unit != "" && { _unit getVariable [QGVAR(slungHelmetItems), []] isEqualTo [] };
