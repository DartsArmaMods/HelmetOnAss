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
 * player call slh_sling_fnc_slingHelmet;
 *
 * Public: No
 */

params ["_unit", ["_mode", 0], ["_items", []], ["_removeCurrentItems", true]];
TRACE_2("fnc_slingHelmet",_unit,_mode);

if (_items isEqualTo []) then {
    _items = [headgear _unit, hmd _unit, goggles _unit];
} else {
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

private _groundholders = _unit getVariable [QGVAR(slungHelmetItems), []];
if (_helmet == "" || _groundholders isNotEqualTo []) exitWith {};

_items = switch (_mode) do {
    case 1: { [] };
    case 2: { [_nvg] };
    case 3: { [_facewear] };
    default { [_nvg, _facewear] select { getNumber (_x call CBA_fnc_getItemConfig >> QGVAR(slingWithHelmet)) == 1} };
};

_items = _items select { _x != "" };
_items pushBack _helmet;

private _uniformConfig = configFile >> "CfgWeapons" >> uniform _unit;
private _attachPos = getArray (_uniformConfig >> QGVAR(slungHelmetPos));
if (_attachPos isEqualTo []) then {
    _attachPos = GVAR(defaultPos);
};

private _pitchBank = getArray (_uniformConfig >> QGVAR(slungHelmetPitchBankYaw));
if (_pitchBank isEqualTo []) then {
    _pitchBank = GVAR(defaultPitchBankYaw);
};
_pitchBank params ["_pitch", "_bank", "_yaw"];

{
    private _groundholder = createVehicle ["slh_groundholder", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _groundholder attachTo [_unit, _attachPos, "pelvis", true];
    [_groundholder, _pitch, _bank, _yaw] call ace_common_fnc_setPitchBankYaw;
    _groundholder addItemCargoGlobal [_x, 1];
    _groundholders pushBack _groundholder;
} forEach _items;

if (_removeCurrentItems) then {
    removeHeadgear _unit;
    { _unit unlinkItem _x } forEach _items;
};
_unit setVariable [QGVAR(slungHelmetItems), _groundholders, true];