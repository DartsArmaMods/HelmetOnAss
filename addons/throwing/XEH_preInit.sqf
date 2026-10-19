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

["CAManBase", "SlotItemChanged", {
    params ["_unit", "", "_slot", "_assigned"];
    if (!GVAR(enabled) || !local _unit || _slot != TYPE_HEADGEAR) exitWith {};

    // Only ever give player one grenade
    if (_assigned && { !(QGVAR(helmetGrenade) in (throwables _unit apply { _x select 0 })) }) then {
        _unit addMagazine QGVAR(helmetGrenade);
    } else {
        if (!_assigned && _unit getVariable [QEGVAR(sling,slungHelmetItems), []] isEqualTo []) then {
            _unit removeMagazine QGVAR(helmetGrenade);
        };
    };
}] call CBA_fnc_addClassEventHandler;
