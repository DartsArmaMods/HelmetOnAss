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

    // Add grenade if the muzzle isn't loaded, because keepInInventory = 0 is set the first grenade is
    // loaded into the muzzle and not kept in the inventory directly
    if (_assigned && { _unit weaponState QGVAR(helemetGrenade_muzzle) select 4 == 0 }) then {
        systemChat "added mag";
        _unit addMagazine QGVAR(helmetGrenade);
    } else {
        if (!_assigned && _unit getVariable [QEGVAR(sling,slungHelmetItems), []] isEqualTo []) then {
            systemChat "removed mag";
            _unit removeMagazine QGVAR(helmetGrenade);
        };
    };
}] call CBA_fnc_addClassEventHandler;
