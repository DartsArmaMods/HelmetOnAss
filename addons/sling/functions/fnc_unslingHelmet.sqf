#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Unslings a unit's helmet.
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
 * player call hoa_sling_fnc_unslingHelmet;
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_mode", 0, [0]],
    ["_items", [], [[]]]
];
TRACE_3("fnc_unslingHelmet",_unit,_mode,_items);

if !(_unit call FUNC(canUnslingHelmet)) exitWith {};

(_unit call FUNC(getSlungItems)) params ["_helmet", "_nvg", "_facewear"];

_unit addHeadgear _helmet;
_unit linkItem _nvg;
_unit linkItem _facewear;
deleteVehicle (_unit getVariable [QGVAR(slungHolders), []]);

_unit setVariable [QGVAR(slungItems), nil, true];
_unit setVariable [QGVAR(slungHolders), nil, true];
[QGVAR(helmetUnslung), [_unit], _unit] call CBA_fnc_targetEvent;
