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
 * 2: Remove current items (optional, default: true) <BOOL>
 * 3: Sling params (optioanl, default: CBA Setting) <ARRAY>
 *    - See fnc_addSlingOption
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_slingItems
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_mode", SLING_MODE_DEFAULT, [SLING_MODE_DEFAULT]],
    ["_removeCurrentItems", true, [true]],
    ["_slingParams", [], [[]]]
];
TRACE_4("fnc_slingItems",_unit,_mode,_removeCurrentItems,_slingParams);

if !(local _unit && { _unit call FUNC(canSlingItems) }) exitWith {};

private _items = switch (_mode) do {
    case SLING_MODE_HELMET: { [headgear _unit] };
    case SLING_MODE_HELMET_NVG: { [headgear _unit, hmd _unit] };
    case SLING_MODE_HELMET_FACEWEAR: { [headgear _unit, goggles _unit] };
    case SLING_MODE_ALL: { [headgear _unit, hmd _unit, goggles _unit] };
    default {
        [headgear _unit, hmd _unit, goggles _unit] select { (_x call FUNC(getSlingParams)) select 0 };
    };
};

if (_items isEqualTo []) exitWith {};

if (_removeCurrentItems) then {
    { _unit unlinkItem _x } forEach _items;
};

_unit setVariable [VAR_SLUNG_ITEMS, _items, true];
[_unit, _slingParams] call FUNC(createSlungHolders);

[QGVAR(slungItems), [_unit, _items, _slingParams]] call CBA_fnc_localEvent;
