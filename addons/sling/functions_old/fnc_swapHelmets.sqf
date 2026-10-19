#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Swaps a unit's slung helmet and their normal helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Mode (optional, default: 0) (unused, for future proofing) <NUMBER>
 * 2: Items (optional, default: []) (unused, for future proofing) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_swapHelmets;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_mode", 0, [0]],
    ["_items", [], [[]]]
];
TRACE_3("fnc_swapHelmets",_unit,_mode,_items);

if (isNull _unit) exitWith {};

_items = [hmd _unit, goggles _unit];
_items = _items select { _x call FUNC(getSlingParams) select 0 };
{ _unit unlinkItem _x } forEach _items;
_items insert [0, [headgear _unit]];
removeHeadgear _unit;

_unit call FUNC(unslingHelmet);
[_unit, 0, _items, false] call FUNC(slingHelmet);
