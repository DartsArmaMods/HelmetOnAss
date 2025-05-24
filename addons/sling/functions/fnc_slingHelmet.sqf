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
 *
 * Return Value:
 * None
 *
 * Example:
 * player call slh_sling_fnc_slingHelmet;
 *
 * Public: No
 */

params ["_unit", ["_mode", 0]];
TRACE_2("fnc_slingHelmet",_unit,_mode);

private _helmet = headgear _unit;
private _groundholders = _unit getVariable [QGVAR(slungHelmetItems), []];
if (_helmet == "" || _groundholders isNotEqualTo []) exitWith {};

private _items = switch (_mode) do {
    case 1: { [] };
    case 2: { [hmd _unit] };
    case 3: { [goggles _unit] };
    default { [hmd _unit, goggles _unit] select { getNumber (_x call CBA_fnc_getItemConfig >> QGVAR(slingWithHelmet)) == 1} };
};

_items = _items select { _x != "" };
_items pushBack _helmet;

private _uniformConfig = configFile >> "CfgWeapons" >> uniform _unit;
private _attachPos = getArray (_uniformConfig >> QGVAR(slungPelmetPos));
if (_attachPos isEqualTo []) then {
    _attachPos = [-0.41, 0.3, 0]; // [-0.41, 0.3, 0]
};

private _vectorDirAndUp = getArray (_uniformConfig >> QGVAR(slungPelmetDirAndUp));
if (_vectorDirAndUp isEqualTo []) then {
    _vectorDirAndUp = [[1, -0.8, 0], [0, 0, 1]]; // [[1, -0.8, 0], [0, 0, 1]]
};

{
    private _groundholder = createVehicle ["slh_groundholder", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _groundholder attachTo [_unit, _attachPos, "pelvis", true];
    _groundholder setVectorDirAndUp _vectorDirAndUp;
    _groundholder addItemCargoGlobal [_x, 1];
    _groundholders pushBack _groundholder;
} forEach _items;

removeHeadgear _unit;
{ _unit unlinkItem _x } forEach _items;
_unit setVariable [QGVAR(slungHelmetItems), _groundholders, true];