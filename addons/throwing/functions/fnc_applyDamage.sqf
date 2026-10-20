#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Applies damage and knockback to a unit after they're hit with a helmet.
 *
 * Arguments:
 * 0: Hit Entity <OBJECT>
 * 1: Instigator <OBJECT>
 * 2: Damage <NUMBER>
 * 3: Body part <STRING>
 * 4: Strength <ARRAY>
 * 5: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, 1, "head", 3, [0, 0, 0.3]] call hoa_throwing_fnc_applyDamage
 *
 * Public: No
 */

params ["_hitEntity", "_instigator", "_damage", "_bodyPart", "_strength", "_position"];
TRACE_6("fnc_applyDamage",_hitEntity,_instigator,_damage,_bodyPart,_strength,_position);

if (missionNamespace getVariable ["ace_medical_enabled", false]) then {
    [_hitEntity, _damage, _bodyPart, "punch", _instigator] call ace_medical_fnc_addDamageToUnit;
};

if (_strength isNotEqualTo [0, 0, 0]) then {
    _hitEntity addForce [_strength, _position, false];
};
