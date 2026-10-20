#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Assigns the given itesms or returns it to the inventory / ground if there's no space.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Items <ARRAY>
 * 2: Display message if some items couldn't fit <BOOL>
 *
 * Return Value:
 * Array of bools for if an item was added or not <ARRAY>
 *   - True: Item was either equipped or placed in inventory
 *   - False: Item was placed on the ground
 *
 * Example:
 * [player, ["H_HelmetHBK_headset_F"]] call hoa_sling_fnc_addItems
 *
 * Public: No
 */

params ["_unit", "_items", ["_showMessage", true]];
TRACE_3("fnc_addItems",_unit,_items,_showMessage);

private _return = [];

{
    private _type = _x call ace_common_fnc_getItemType select 1;
    private _slotIsEmpty = switch(_type) do {
        case "headgear": { headgear _unit == "" };
        case "hmd": { hmd _unit == "" };
        case "glasses": { goggles _unit == "" };
        default { false }; // Not supported, so just add to inventory
    };

    if (_slotIsEmpty) then {
        _unit linkItem _x;
        _return pushBack true;
    } else {
        // True if was placed into the inventory, or false if on ground / in vehicle
        private _canFit = [_unit, _x, true, true] call CBA_fnc_addItem;
        _return pushBack _canFit;
    };
} forEach _items;

// Display a message if any item failed to add
if (_showMessage && { (_return findIf { !_x }) > -1 }) then {
    [LSTRING(couldntFit), 2.5] call ace_common_fnc_displayTextStructured;
};

_return;
