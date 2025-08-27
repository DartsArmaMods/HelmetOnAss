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

// Uses normal GroundWeaponHolder (not HOA) because it should be interactable
private _groundholder = "hoa_groundholder_physx" createVehicle [0, 0, 0];
_groundholder setPosASL (getPosASL _projectile); // Needed to attach properly
_groundholder addItemCargoGlobal [headgear _unit, 1];
_groundholder attachTo [_projectile, [0.36, -0.7, 0.52]];
_groundholder setVectorDirAndUp [[0, 1, 0], [1, 0, 1]];
_projectile setVariable [QGVAR(helmetHitParams), [headgear _unit, getPosASL _unit, _groundholder]];

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

    (_projectile getVariable [QGVAR(helmetHitParams), []]) params [["_helmet", ""], "_instigatorPositionASL", "_groundholder"];

    if (isNull _hitEntity || _helmet == "" || _components isEqualTo [] || { !(_hitEntity isKindOf "CAManBase") }) exitWith { EXIT_CODE };

    // Incorporate velocity and helmet mass into damage, with a little randomization to not always get the same results
    private _mass = GVAR(helmetMassCache) getOrDefaultCall [_helmet, {
        getNumber ((_helmet call CBA_fnc_getItemConfig) >> "ItemInfo" >> "mass")
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
