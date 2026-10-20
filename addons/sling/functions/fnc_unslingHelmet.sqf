#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Unslings a unit's helmet. If an item can't be equipped (e.g. because something else is there), the item is instead placed into the unit's inventory or on the ground if it can't fit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_unslingHelmet
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]]
];
TRACE_1("fnc_unslingHelmet",_unit);

if !(local _unit && { (_unit call FUNC(canUnslingHelmet)) }) exitWith {};

// TODO: Handle not overwriting items, should be added to inventory

{ _unit linkItem _x } forEach GET_SLUNG_ITEMS(_unit);
_unit call FUNC(resetVariables);
