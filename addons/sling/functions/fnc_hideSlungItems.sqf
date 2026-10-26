#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Hides or unhides a unit's slung helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to hide, false to unhide (optional, default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_hideSlungItems
 *
 * Public: No
 */

params ["_unit", ["_set", true]];
TRACE_2("fnc_hideSlungItems",_unit,_set);

private _slungItems = GET_SLUNG_HOLDERS(_unit);

if (_slungItems isNotEqualTo []) then {
    [QGVAR(hideObjects), [_slungItems, _set]] call CBA_fnc_serverEvent;
};

_unit setVariable [VAR_HIDE_SLUNG_HOLDERS, _set];
