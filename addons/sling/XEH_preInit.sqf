#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"

GVAR(uniformCache) = createHashMap; // Hashmap of uniforms and their sling position / angle
GVAR(slingCache) = createHashMap; // Hashamp of helmets, nvgs, and facewear and whether they should sling with the helmet and hidden when slung

// These are mainly here for modders (probably you) to quickly test setups
GVAR(defaultPos) = [-0.15, 0.35, -0.2];
GVAR(defaultPitchBankYaw) = [20, 0, 150];

["CBA_loadoutSet", {
    params ["_unit", "", "_extendedInfo"];
    private _slungItems = _extendedInfo getOrDefault [QGVAR(slungHelmetItems), []];
    if (_slungItems isEqualTo []) then {
        deleteVehicle (_unit getVariable [QGVAR(slungHelmetItems), []]);
        _unit setVariable [QGVAR(slungHelmetItems), nil, true];
    } else {
        [_unit, 0, _slungItems, false] call FUNC(slingHelmet);
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "", "_extendedInfo"];
    _extendedInfo set [QGVAR(slungHelmetItems), _unit call FUNC(getSlungItems)];
}] call CBA_fnc_addEventHandler;