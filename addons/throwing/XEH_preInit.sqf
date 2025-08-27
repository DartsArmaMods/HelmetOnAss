#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"

GVAR(helmetMassCache) = createHashMap;

[QGVAR(helmetHit), {
    params ["_hitEntity", "_instigator", "_damage", "_bodyPart", "_strength", "_position"];
    if (missionNamespace getVariable ["ace_medical_enabled", false]) then {
        [_hitEntity, _damage, _bodyPart, "punch", _instigator] call ace_medical_fnc_addDamageToUnit;
    };

    if (_strength isNotEqualTo [0, 0, 0]) then {
        _hitEntity addForce [_strength, _position, false];
    };
}] call CBA_fnc_addEventHandler;
