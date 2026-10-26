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

// Prevent hemtt from warning that these are undefined, inherited from EH scope
#pragma hemtt ignore_variables ["_thisEvent", "_thisEventHandler"]

// Prevent the HitPart running multiple times
#define EXIT_CODE \
    _projectile removeEventHandler [_thisEvent, _thisEventHandler]; \
    deleteVehicle _projectile

// Arbitrary number, experimented with during testing to get results that felt good
#define DAMAGE_DIVISOR 1500

params ["_projectile", "_hitEntity", "", "_position", "_velocity", "", "_components", "" ,"", "_instigator"];
TRACE_6("fnc_onHit",_projectile,_hitEntity,_position,_velocity,_components,_instigator);

(_projectile getVariable [QGVAR(helmetHitParams), []]) params [["_items", []], "_instigatorPositionASL", "_groundholder"];

if (isNull _hitEntity || _items isEqualTo [] || _components isEqualTo [] || { !(_hitEntity isKindOf "CAManBase") }) exitWith { EXIT_CODE };

// Get total mass of all the items
private _mass = 0;
{
    _mass = GVAR(itemMassCache) getOrDefaultCall [_x, {
        private _config = configFile >> "CfgWeapons" >> _x;
        if (isClass _config) then {
            getNumber (_config >> "ItemInfo" >> "mass");
        } else {
            // Facewear
            getNumber (configFile >> "CfgGlasses" >> _x >> "mass");
        };
    }, true];
} forEach _items;

// Incorporate velocity and helmet mass into damage, with a little randomization to not always get the same results
private _damage = ((vectorMagnitude _velocity * _mass) / DAMAGE_DIVISOR) * random [0.9, 1, 1.1];

private _strength = [0, 0, 0];
if (GVAR(ragdollStrength) > 0) then {
    private _oppVector = vectorNormalized (_instigatorPositionASL vectorDiff _position);
    _strength = _oppVector vectorMultiply -(GVAR(ragdollStrength) * 100); // x100 is so the CBA setting has smaller numbers for UX
};

private _allBodyParts = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"];
private _componentIndex = _components findIf { (toLowerANSI _x) in _allBodyParts };

if (_componentIndex > -1) then {
    [QGVAR(applyDamage), [_hitEntity, _instigator, _damage, _components select _componentIndex, _strength, _position], _hitEntity] call CBA_fnc_targetEvent;
};

EXIT_CODE;
