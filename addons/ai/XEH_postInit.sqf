#include "script_component.hpp"

if (GVAR(unslingInCombat_enabled)) then {
    {
        _x addEventHandler ["CombatModeChanged", { call FUNC(combatModeChanged) }];
    } forEach allGroups;

    addMissionEventHandler ["GroupCreated", {
        params ["_group"];
        _group addEventHandler ["CombatModeChanged", { call FUNC(combatModeChanged) }];
    }];
};
