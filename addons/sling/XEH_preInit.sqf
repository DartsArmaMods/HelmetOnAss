#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"

// Mainly here for quick testing
GVAR(defaultPos) = [-0.15, 0.35, -0.2];
GVAR(defaultPitchBankYaw) = [20, 0, 150];

["CBA_loadoutSet", {
    if (is3DEN) exitWith {};
    params ["_unit", "_loadout", "_extendedInfo"];
    private _slungItems = _extendedInfo getOrDefault [QGVAR(slungHelmetItems), []];
    if (_slungItems isEqualTo []) then {
        deleteVehicle (_unit getVariable [QGVAR(slungHelmetItems), []]);
        _unit setVariable [QGVAR(slungHelmetItems), nil, true];
    } else {
        [_unit, 0, _slungItems] call FUNC(slingHelmet);
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    if (is3DEN) exitWith {};
    params ["_unit", "_loadout", "_extendedInfo"];
    private _items = (_unit getVariable [QGVAR(slungHelmetItems), []]) apply { getItemCargo _x select 0 select 0};
    _extendedInfo set [QGVAR(slungHelmetItems), _items];
}] call CBA_fnc_addEventHandler;