#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Swaps a unit's slung helmet and their normal helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call slh_sling_fnc_swapHelmets;
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_swapHelmets",_unit);

private _items = [headgear _unit, hmd _unit, goggles _unit];
removeHeadgear _unit;
{ _unit unlinkItem _x } forEach _items;

_unit call FUNC(unslingHelmet);
[_unit, 0, _items, false] call FUNC(slingHelmet);