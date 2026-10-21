#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Handles a unit being hit.
 *
 * Please provide proper credits to those who participate in development.
 * This function was developed for Legion Studios: Core.
 * Do not place in any other mod without permission.
 *
 * Arguments:
 * See https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#HitPart
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_projectile", "_hitEntity", "", "_position", "_velocity", "", "_components", "" ,"", "_instigator"];
TRACE_6("fnc_onHit",_projectile,_hitEntity,_position,_velocity,_components,_instigator);

/*
// Prevents the HitPart running multiple times
#define EXIT_CODE \
    _projectile removeEventHandler [_thisEvent, _thisEventHandler]; \
    deleteVehicle _projectile

params ["_projectile", "_hitEntity", "", "_position", "_velocity", "", "_components", "" ,"", "_instigator"];

(_projectile getVariable [QGVAR(helmetHitParams), []]) params [["_items", []], "_instigatorPositionASL", "_groundholder"];

if (isNull _hitEntity || _items isEqualTo [] || _components isEqualTo [] || { !(_hitEntity isKindOf "CAManBase") }) exitWith { EXIT_CODE };

// Incorporate velocity and helmet mass into damage, with a little randomization to not always get the same results
private _helmet = _items select 0;
private _mass = GVAR(helmetMassCache) getOrDefaultCall [_helmet, {
    getNumber (configFile >> "CfgWeapons" >> _helmet >> "ItemInfo" >> "mass")
}, true];
private _damage = ((vectorMagnitude _velocity * _mass) / 1500) * random [0.8, 0.9, 1];

private _strength = [0, 0, 0];
if (GVAR(ragdollStrength) > 0) then {
    private _oppVector = vectorNormalized (_instigatorPositionASL vectorDiff _position);
    _strength = _oppVector vectorMultiply -(GVAR(ragdollStrength) * 100);
};

[QGVAR(applyDamage), [_hitEntity, _instigator, _damage, _components select 2, _strength, _position], _hitEntity] call CBA_fnc_targetEvent;

EXIT_CODE;
*/
