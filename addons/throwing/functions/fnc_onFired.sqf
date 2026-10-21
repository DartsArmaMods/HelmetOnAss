#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Handles a unit firing a weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon (unused) <STRING>
 * 2: Muzzle (unused) <STRING>
 * 3: Mode (unused) <STRING>
 * 4: Ammo (unused) <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "", "", "", "hoa_throwing_helmetGrenade", _projectile] call hoa_throwing_fnc_onFired;
 *
 * Public: No
 */

params ["_unit", "", "", "", "", "_magazine", "_projectile"];
TRACE_3("fnc_onFired",_unit,_magazine,_projectile);

if !(GVAR(enabled) && local _unit && _magazine == GRENADE_CLASS) exitWith {};

#ifdef DEBUG_MODE_FULL
private _debugMarker = createSimpleObject ["Sign_Sphere25cm_F", getPosASL _projectile];
_debugMarker attachTo [_projectile, [0, 0, 0]];
#endif

// // TODO: Logic could definitely be improved here, without just copy/pasting
// private ["_items"];
// private _slungItems = _unit call EFUNC(sling,getSlungItems);
// private _wornItems = [headgear _unit, hmd _unit, goggles _unit] select {
//     (_x call EFUNC(sling,getSlingParams)) select 0
// };

// if (GVAR(helmetPriority) == USE_SLUNG_HELMET) then {
//     if (_slungItems isNotEqualTo []) then {
//         _items = _slungItems;
//         deleteVehicle (_unit getVariable [QEGVAR(sling,slungHelmetItems), []]);
//         _unit setVariable [QEGVAR(sling,slungHelmetItems), nil, true];
//     } else {
//         _items = _wornItems;
//         removeHeadgear _unit;
//         { _unit unlinkItem _x } forEach _items;
//     };
// } else {
//     if (_wornItems isNotEqualTo []) then {
//         _items = _wornItems;
//         removeHeadgear _unit;
//         { _unit unlinkItem _x } forEach _items;
//     } else {
//         _items = _slungItems;
//         deleteVehicle (_unit getVariable [QEGVAR(sling,slungHelmetItems), []]);
//         _unit setVariable [QEGVAR(sling,slungHelmetItems), nil, true];
//     };
// };

// if (_items isEqualTo []) exitWith {
//     deleteVehicle _projectile;
// };

// if (headgear _unit != "" || _unit getVariable [QEGVAR(sling,slungHelmetItems), []] isNotEqualTo []) then {
//     _unit addMagazine QGVAR(helmetGrenade);
// };

// private _groundholder = "hoa_groundholder_physx" createVehicle [0, 0, 0];
// _groundholder setPosASL (getPosASL _projectile); // Needed to attach properly
// {
//     _groundHolder addItemCargoGlobal [_x, 1];
// } forEach _items;
// _groundholder attachTo [_projectile, [0.36, -0.7, 0.52]];
// _groundholder setVectorDirAndUp [[0, 1, 0], [1, 0, 1]];
// _projectile setVariable [QGVAR(helmetHitParams), [_items, getPosASL _unit, _groundholder]];

_projectile addEventHandler ["HitPart", LINKFUNC(onHit)];
