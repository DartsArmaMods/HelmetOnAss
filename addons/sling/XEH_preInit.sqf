#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// Needs to be two separate arrays because these are used by reference for CBA settings
GVAR(positionNames) = [
    LSTRING(position_belt),
    LSTRING(position_beltGrad),
    LSTRING(position_gendarmerie)
];
GVAR(positions) = [
    ["pelvis", [-0.15, 0.35, -0.2], [[0.469846, -0.813798, 0.34202], [-0.17101, 0.296198, 0.939693]]],
    ["pelvis", [-0.41, 0.3, 0], [[1, -0.8, 0], [0, 0, 1]]],
    ["spine3", [0.234796, -0.446444, 0.168573], [[-0.515384, 0.834099, -0.19601], [-0.304547, 0.0354715, 0.951711]]]
];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"

GVAR(slingCache) = createHashMap; // Hashamp of helmets, nvgs, and facewear and whether they should sling with the helmet and hidden when slung

["CBA_loadoutSet", {
    params ["_unit", "", "_extendedInfo"];
    private _slungItems = _extendedInfo getOrDefault [QGVAR(slungHelmetItems), []];

    private _arsenal = missionNamespace getVariable ["ace_arsenal_currentBox", objNull];
    if (!isNull _arsenal) then {
        private _virtualItems = keys (_arsenal call ace_arsenal_fnc_getVirtualItems);
        if (hasInterface) then {
            private _unavailableItems = (_slungItems - _virtualItems) apply { getText ((_x call CBA_fnc_getItemConfig) >> "displayName") };
            [{
                [findDisplay 1127001, format [LLSTRING(unavailableItems), _this joinString ", "]] call ace_arsenal_fnc_message;
            }, _unavailableItems] call CBA_fnc_execNextFrame;
        };
        _slungItems = _slungItems arrayIntersect _virtualItems;
    };

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
