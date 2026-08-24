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
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_slingHelmet;
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_mode", 0, [0]],
    ["_items", [], [[]]],
    ["_removeCurrentItems", true, [true]],
    ["_slingParams", [], [[]]]
];
TRACE_4("fnc_slingHelmet",_unit,_mode,_items,_removeCurrentItems);

if !([_unit, _mode] call FUNC(canSlingHelmet)) exitWith {};

if (_items isEqualTo []) then {
    _items = [headgear _unit, hmd _unit, goggles _unit];
} else {
    // If a specific list of items is passed, order it as [helmet, nvg, facewear]
    private _itemTypes = _items apply { (_x call ace_common_fnc_getItemType) select 1 };
    private _itemsTemp = _items;
    _items = +_items;
    {
        if (_x == -1) then {
            _items set [_forEachIndex, ""];
        } else {
            _items set [_forEachIndex, _itemsTemp select _x];
        };
    } forEach [_itemTypes find "headgear", _itemTypes find "hmd", _itemTypes find "glasses"];
    _items resize 3;
};
_items params ["_helmet", "_nvg", "_facewear"];

private _groundholders = _unit getVariable [QGVAR(slungHolders), []];
if (_helmet == "" || _groundholders isNotEqualTo []) exitWith {};

// Filter out items that shouldn't slung, 1/2 force nvg / facewear to sling
_items = switch (_mode) do {
    case 1: { [] };
    case 2: { [_nvg] };
    case 3: { [_facewear] };
    default { [_nvg, _facewear] select { _x call FUNC(getSlingParams) select 0 } };
};

_items = _items select { _x != "" };
_items pushBack _helmet; // Helmet should always sling

if (_slingParams isEqualTo []) then {
    _slingParams = GVAR(slungHelmetPosition);
};
_slingParams params ["_bone", "_attachPos", "_vectorDirAndUp"];

{
    // Facewear models are rotated 180 degrees when dropped on the ground
    // Facewear ground holder just has the proxy rotated
    private _groundholderClass = ["hoa_groundholder", "hoa_groundholder_facewear"] select ((_x call ace_common_fnc_getItemType) select 1 == "glasses");
    private _groundholder = createVehicle [_groundholderClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];

    _groundholder attachTo [_unit, _attachPos, _bone, true];
    _groundholder setVectorDirAndUp _vectorDirAndUp;

    _groundholder addItemCargoGlobal [_x, 1];
    _groundholders pushBack _groundholder;

    // Have object claim itself to remove ace interactions
    [_groundholder, _groundholder] call ace_common_fnc_claimSafeServer;
} forEach _items;

if (_removeCurrentItems) then {
    removeHeadgear _unit;
    { _unit unlinkItem _x } forEach _items;
};

private _holdersToHide = _groundholders select {
    (getItemCargo _x select 0 select 0) call FUNC(getSlingParams) select 1
};
[_unit, true, _holdersToHide] call FUNC(hideHelmet);
_unit setVariable [QGVAR(slungHelmetHidden), count _holdersToHide == count _groundholders]; // Only mark helmet as hidden if everything is hidden

_unit setVariable [QGVAR(slungItems), _items, true];
_unit setVariable [QGVAR(slungHolders), _groundholders, true];
[QGVAR(helmetSlung), [_unit, _groundholders], _unit] call CBA_fnc_targetEvent;
