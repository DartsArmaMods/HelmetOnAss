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

if (!local _unit || !alive _unit || _magazine != QGVAR(helmetGrenade)) exitWith {};

// TODO: Logic could definitely be improved here, without just copy/pasting
private ["_items"];
private _slungItems = _unit call EFUNC(sling,getSlungItems);
private _wornItems = [headgear _unit, hmd _unit, goggles _unit] select {
    (_x call EFUNC(sling,getSlingParams)) select 0
};

if (GVAR(helmetPriority) == USE_SLUNG_HELMET) then {
    if (_slungItems isNotEqualTo []) then {
        _items = _slungItems;
        deleteVehicle (_unit getVariable [QEGVAR(sling,slungHelmetItems), []]);
        _unit setVariable [QEGVAR(sling,slungHelmetItems), nil, true];
    } else {
        _items = _wornItems;
        removeHeadgear _unit;
        { _unit unlinkItem _x } forEach _items;
    };
} else {
    if (_wornItems isNotEqualTo []) then {
        _items = _wornItems;
        removeHeadgear _unit;
        { _unit unlinkItem _x } forEach _items;
    } else {
        _items = _slungItems;
        deleteVehicle (_unit getVariable [QEGVAR(sling,slungHelmetItems), []]);
        _unit setVariable [QEGVAR(sling,slungHelmetItems), nil, true];
    };
};

if (_items isEqualTo []) exitWith {
    deleteVehicle _projectile;
};

private _groundholder = "hoa_groundholder_physx" createVehicle [0, 0, 0];
_groundholder setPosASL (getPosASL _projectile); // Needed to attach properly
{
    _groundHolder addItemCargoGlobal [_x, 1];
} forEach _items;
_groundholder attachTo [_projectile, [0.36, -0.7, 0.52]];
_groundholder setVectorDirAndUp [[0, 1, 0], [1, 0, 1]];
_projectile setVariable [QGVAR(helmetHitParams), [_items, getPosASL _unit, _groundholder]];

#ifdef DEBUG_MODE_FULL
private _debugMarker = createSimpleObject ["Sign_Sphere25cm_F", getPosASL _projectile];
_debugMarker attachTo [_projectile, [0, 0, 0]];
#endif

_projectile addEventHandler ["HitPart", {
    // Prevents the HitPart running multiple times
    #define EXIT_CODE \
        _projectile removeEventHandler [_thisEvent, _thisEventHandler]; \
        deleteVehicle _projectile

	params ["_projectile", "_hitEntity", "", "_position", "_velocity", "", "_components", "" ,"", "_instigator"];

    (_projectile getVariable [QGVAR(helmetHitParams), []]) params [["_items", []], "_instigatorPositionASL", "_groundholder"];

    if (isNull _hitEntity || _items isEqualTo [] || _components isEqualTo [] || { !(_hitEntity isKindOf "CAManBase") }) exitWith { EXIT_CODE };

    // Incorporate velocity and helmet mass into damage, with a little randomization to not always get the same results
    private _mass = GVAR(helmetMassCache) getOrDefaultCall [_helmet, {
        getNumber (configFile >> "CfgWeapons" >> _items select 0 >> "ItemInfo" >> "mass")
    }, true];
    private _damage = ((vectorMagnitude _velocity * _mass) / 1500) * random [0.8, 0.9, 1];

    private _strength = [0, 0, 0];
    if (GVAR(ragdollStrength) > 0) then {
        private _dirVector = _position vectorDiff _instigatorPositionASL;
        private _oppVector = vectorNormalized (_instigatorPositionASL vectorDiff _position);
        _strength = _oppVector vectorMultiply -(GVAR(ragdollStrength) * 100);
    };

    [QGVAR(helmetHit), [_hitEntity, _instigator, _damage, _components select 2, _strength, _position], _hitEntity] call CBA_fnc_targetEvent;

    EXIT_CODE;
}];
