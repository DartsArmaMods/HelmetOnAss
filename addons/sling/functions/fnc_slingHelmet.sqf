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
 * player call hoa_sling_fnc_slingHelmet
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
TRACE_5("fnc_slingHelmet",_unit,_mode,_items,_removeCurrentItems,_slingParams);

if !(local _unit && (_items isNotEqualTo []) && { ([_unit, _mode] call FUNC(canSlingHelmet)) }) exitWith {};
