#include "script_component.hpp"

if (GVAR(unslingInCombat_enabled)) then {
    {
        _x addEventHandler ["CombatModeChanged", { call FUNC(combatModeChanged) }];
    } forEach (allGroups select { local _x });

    addMissionEventHandler ["GroupCreated", {
        params ["_group"];
        if (!local _group) exitWith {};

        _group addEventHandler ["CombatModeChanged", { call FUNC(combatModeChanged) }];
    }];
};
