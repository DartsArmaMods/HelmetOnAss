#include "script_component.hpp"

#include "initContextActions.inc.sqf"

if (hasInterface) then {
    [[6, 7, 8], QGVAR(slingItems), QUOTE(MOD_NAME), [
        ["text", "Text", {true}, LLSTRING(slingItems_name)],
        ["statement", "Statement", {true}, ""],
        ["button", "Switch", {true}, "", {}, {
            ace_arsenal_center call FUNC(swapSlungItems);
            true call ace_arsenal_fnc_refresh;
        }]
    ]] call ace_arsenal_fnc_addAction;
};
