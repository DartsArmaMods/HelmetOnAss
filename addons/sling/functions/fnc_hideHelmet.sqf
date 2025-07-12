#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Hides a unit's slung helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to hide, false to unhide (optional, default: true) <BOOL>
 * 2: Items to hide (optional, default: slung items) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_hideHelmet
 *
 * Public: No
 */

params ["_unit", ["_set", true], ["_items", []]];
TRACE_3("fnc_hideHelmet",_unit,_set,_items);

if (_items isEqualTo []) then {
    _items = _unit getVariable [QGVAR(slungHelmetItems), []];
};
[QGVAR(hideObjects), [_items, _set]] call CBA_fnc_serverEvent;
_unit setVariable [QGVAR(slungHelmetHidden), _set];
