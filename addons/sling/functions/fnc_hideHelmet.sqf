#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Hides a unit's slung helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to hide, false to unhide (optional, default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call slh_sling_fnc_hideHelmet
 *
 * Public: No
 */

params ["_unit", ["_set", true]];
TRACE_1("fnc_hideHelmet",_unit);

private _slungItems = _unit getVariable [QGVAR(slungHelmetItems), []];
[QGVAR(hideObjects), [_slungItems, _set]] call CBA_fnc_serverEvent;
_unit setVariable [QGVAR(slungHelmetHidden), _set];