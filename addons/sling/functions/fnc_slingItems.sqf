#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Slings a unit's helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Mode (optional, default: 0) <NUMBER>
 *    0: Slings helmet, nvg, and facewear based on config
 *    1: Helmet only
 *    2: Helmet and nvg
 *    3: Helmet and facewear
 * 2: Items to sling (optional, default: equipped gear) <ARRAY>
 * 3: Remove current items (optional, default: true) <BOOL>
 * 4: Sling params (optioanl, default: CBA Setting) <ARRAY>
 *    - See fnc_addSlingOption
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_slingItems
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_mode", SLING_MODE_DEFAULT, [SLING_MODE_DEFAULT]],
    ["_items", [], [[]]],
    ["_removeCurrentItems", true, [true]],
    ["_slingParams", [], [[]]]
];
TRACE_5("fnc_slingItems",_unit,_mode,_items,_removeCurrentItems,_slingParams);

if !(local _unit && { _unit call FUNC(canSlingItems) }) exitWith {};

if (_items isEqualTo []) then {
    _items = [headgear _unit, hmd _unit, goggles _unit];
};

// TODO: Redo `_mode` logic, probably just handle it in the keybinds?

_items = _items select {
    (_x call FUNC(getSlingParams)) select 0
};

if (_items isEqualTo []) exitWith {};

if (_removeCurrentItems) then {
    { _unit unlinkItem _x } forEach _items;
};

_unit setVariable [VAR_SLUNG_ITEMS, _items, true];
[_unit, _slingParams] call FUNC(createSlungHolders);
