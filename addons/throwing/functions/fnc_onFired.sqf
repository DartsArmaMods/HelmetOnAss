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

if (!alive _unit || _magazine != QGVAR(helmetGrenade)) exitWith {};

private _holder = "GroundWeaponHolder" createVehicle [0, 0, 0];
_holder setPosASL (getPosASL _projectile); // Needed to attach properly
_holder addItemCargoGlobal [headgear _unit, 1];
_holder attachTo [_projectile];

_projectile addEventHandler ["HitPart", {
    params ["_projectile", "_hitEntity", "", "_pos", "_velocity", "", "_components", "" ,"", "_instigator"];

    systemChat str [_hitEntity, _components];
    if (isNull _hitEntity || _components isEqualTo []) exitWith {};

    if (missionNamespace getVariable ["ace_medical_enabled", false]) then {
        // TODO: networking, needs to be local to _hitEntity
        [_hitEntity, 0.1, _components select 2, "punch", _instigator] call ace_medical_fnc_addDamageToUnit;
    };

    _hitEntity setPosASL (getPosASL _hitEntity vectorAdd [0, 0, 0.01]);
    _hitEntity addForce [[500, 500, 500], _pos, true];

    _projectile removeEventHandler [_thisEvent, _thisEventHandler]; // Prevents the HitPart running multiple times
}];
