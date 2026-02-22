#include "script_component.hpp"

if (isServer) then {
    [QGVAR(hideObjects), {
        params ["_objects", "_set"];
        { _x hideObjectGlobal _set } forEach _objects;
    }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    [[6, 7, 8], QGVAR(slingHelmet), QUOTE(MOD_NAME), [
        ["text", "Text", {true}, LLSTRING(slingHelmet_name)],
        ["statement", "Statement", {true}, ""],
        ["button", "Switch", {true}, "", {}, {ace_arsenal_center call FUNC(swapHelmets); true call ace_arsenal_fnc_refresh}]
    ]] call ace_arsenal_fnc_addAction;
};
