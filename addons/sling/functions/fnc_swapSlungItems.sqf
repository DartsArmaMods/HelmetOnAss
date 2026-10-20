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
 * player call hoa_sling_fnc_swapSlungItems;
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("fnc_swapSlungItems",_unit);

// TODO: Add an addItem function that does linkItem and falls back to adding to inventory
// { _unit linkItem _x } forEach _slungItems;
