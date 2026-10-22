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

private _slungItems = GET_SLUNG_ITEMS(_unit);
private _wornItems = [headgear _unit, hmd _unit, goggles _unit] select {
    (_x call EFUNC(sling,getSlingParams)) select 0
};

private "_items";
if (GVAR(helmetPriority) == USE_SLUNG_HELMET) then {
    if (_slungItems isNotEqualTo []) then {
        _items = _slungItems;
        deleteVehicle (GET_SLUNG_HOLDERS(_unit));
        _unit setVariable [VAR_SLUNG_ITEMS, nil, true];
    } else {
        _items = _wornItems;
        { _unit unlinkItem _x } forEach _items;
    };
} else {
    if (_wornItems isNotEqualTo []) then {
        _items = _wornItems;
        { _unit unlinkItem _x } forEach _items;
    } else {
        _items = _slungItems;
        deleteVehicle (GET_SLUNG_HOLDERS(_unit));
        _unit setVariable [VAR_SLUNG_ITEMS, nil, true];
    };
};

if (_items isEqualTo []) exitWith {
    deleteVehicle _projectile;
};

#ifdef DEBUG_MODE_FULL
private _debugMarker = createSimpleObject ["Sign_Sphere25cm_F", getPosASL _projectile];
_debugMarker attachTo [_projectile, [0, 0, 0]];
[{ deleteVehicle _this }, _debugMarker, 15] call CBA_fnc_waitAndExecute;
#endif

// Add another grenade if needed
// ! TODO: Issue where ace throwing seems to leave you with an empty mag, causing HAS_GRENADE to be false but still appearing in the menu
if (headgear _unit != "" || GET_SLUNG_ITEMS(_unit) isNotEqualTo [] && { !HAS_GRENADE(_unit) }) then {
    _unit addMagazine GRENADE_CLASS;
};

// Would be more correct to create separate groundholders per item, but it's not as needed here
// Harder to see while its being thrown, and it means less objects being moved
private _groundholder = "hoa_groundholder_physx" createVehicle [0, 0, 0];
_groundholder setPosASL (getPosASL _projectile); // Needed to attach properly
{ _groundHolder addItemCargoGlobal [_x, 1]; } forEach _items;

// Offset to make the actual helmet model look centered on the hitbox
_groundholder attachTo [_projectile, [0.36, -0.7, 0.52]];
_groundholder setVectorDirAndUp [[0, 1, 0], [1, 0, 1]];
_projectile setVariable [QGVAR(helmetHitParams), [_items, getPosASL _unit, _groundholder]];

_projectile addEventHandler ["HitPart", LINKFUNC(onHit)];
