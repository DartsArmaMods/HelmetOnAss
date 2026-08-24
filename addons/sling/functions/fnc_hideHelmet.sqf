#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Hides a unit's slung helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: True to hide, false to unhide (optional, default: true) <BOOL>
 * 2: Items (optional, default: []) (unused, for future proofing) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_hideHelmet
 *
 * Public: No
 */

params ["_unit", ["_hide", true], ["_items", []]];
TRACE_3("fnc_hideHelmet",_unit,_hide,_items);

// Check correct condition function based on if the items should be hidden or not
private _conditionCheck = if (_hide) then {
    _unit call FUNC(canHideHelmet);
} else {
    _unit call FUNC(canUnhideHelmet);
};

if (!_conditionCheck) exitWith {};

_items = _unit call FUNC(getSlungItems);
private _groundholders = _unit getVariable [QGVAR(slungHolders), []];

// Groundholders were deleted, so we need to re-create them
if (!_hide && _groundholders isEqualTo []) then {
    [_unit, 0, _items, false] call FUNC(slingHelmet);
};

[QGVAR(hideObjects), [_groundholders, _hide]] call CBA_fnc_serverEvent;
_unit setVariable [QGVAR(slungHelmetHidden), _hide];
