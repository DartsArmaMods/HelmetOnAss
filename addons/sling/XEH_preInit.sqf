#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

GVAR(slingCache) = createHashMap; // Hashamp of helmets, nvgs, and facewear and whether they should sling with the helmet and hidden when slung

// Needs to be two separate arrays because these are used by reference for CBA settings
GVAR(positionNames) = [
    "Custom (placeholder)", //localize "STR_difficulty_custom",
    LSTRING(position_belt),
    LSTRING(position_beltGrad),
    LSTRING(position_gendarmerie),
    LSTRING(position_disguise)
];
GVAR(positions) = [
    ["pelvis", [-0.15, 0.35, -0.2], [[0.469846, -0.813798, 0.34202], [-0.17101, 0.296198, 0.939693]]],
    ["pelvis", [-0.15, 0.35, -0.2], [[0.469846, -0.813798, 0.34202], [-0.17101, 0.296198, 0.939693]]],
    ["pelvis", [-0.41, 0.3, 0], [[1, -0.8, 0], [0, 0, 1]]],
    ["spine3", [0.234796, -0.446444, 0.168573], [[-0.515384, 0.834099, -0.19601], [-0.304547, 0.0354715, 0.951711]]],
    ["head", [-0.1, 0.2, -0.3], [[0.0868241, -0.492404, 0.866025], [-0.482639, -0.964487, 0.383022]]]
];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"

if (isServer) then {
    [QGVAR(hideObjects), {
        params ["_objects", ["_set", true]];
        { _x hideObjectGlobal _set } forEach _objects;
    }] call CBA_fnc_addEventHandler;
};

["CBA_loadoutGet", LINKFUNC(loadoutGet)] call CBA_fnc_addEventHandler;
["CBA_loadoutSet", LINKFUNC(loadoutSet)] call CBA_fnc_addEventHandler;

if (is3DEN) then {
    ["ace_arsenal_displayClosed", LINKFUNC(onArsenalClosed)] call CBA_fnc_addEventHandler;

    // Only OnMissionPreviewEnd requires a delay to access 3DEN entities, but spawning both makes it simpler
    {
        add3DENEventHandler [_x, {
            [] spawn {
                sleep 0.5;
                {
                    private _params = parseSimpleArray ((_x get3DENAttribute QGVAR(params)) select 0);
                    _params params ["_slungItems", "_slingParams"];

                    if (_slungItems isEqualTo []) then { continue };

                    _x setVariable [VAR_SLUNG_ITEMS, _slungItems];
                    [_x, _slingParams] call FUNC(createSlungHolders);
                } forEach (all3DENEntities select 0);
            };
        }];
    } forEach ["OnMissionLoad", "OnMissionPreviewEnd"];
};
