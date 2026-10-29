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

    add3DENEventHandler ["OnPaste", {
        (get3DENSelected "object") call FUNC(3DEN_createSlungHolders);
    }];
    add3DENEventHandler ["OnMissionLoad", {
        (all3DENEntities select 0) call FUNC(3DEN_createSlungHolders);
    }];

    // This is still needed with the Dragged3DEN event, this covers undo's and redo's
    add3DENEventHandler ["OnEntityAttributeChanged", {
        params ["_entity"];
        if !(_entity isEqualType objNull) exitWith {};
        _entity call FUNC(repositionSlungHolders);
    }];

    // This has to be scheduled with a delay to have access to Eden entities
    add3DENEventHandler ["OnMissionPreviewEnd", {
        [] spawn {
            sleep 0.5;
            [all3DENEntities select 0] call FUNC(3DEN_createSlungHolders);
        };
    }];
};
