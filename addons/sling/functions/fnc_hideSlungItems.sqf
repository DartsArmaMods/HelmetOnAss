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

private _slungHolders = GET_SLUNG_HOLDERS(_unit);

if (_slungHolders isNotEqualTo []) then {
    [QGVAR(hideObjects), [_slungHolders, _set]] call CBA_fnc_serverEvent;
};

_unit setVariable [VAR_HIDE_SLUNG_HOLDERS, _set];

if (_unit == ace_player && GVAR(trackHiddenItems)) then {
    private _headgear = GET_SLUNG_ITEMS(_unit) param [0, ""];

    // Only track positives to not save too much data
    private _trackedItems = profileNamespace getVariable [QGVAR(trackedHiddenItems), createHashMap];
    if (_set) then {
        _trackedItems set [_headgear, true];
    } else {
        _trackedItems deleteAt _headgear;
    };
    profileNamespace setVariable [QGVAR(trackedHiddenItems), _trackedItems];
};
