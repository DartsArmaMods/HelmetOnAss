#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Slings or unslings a unit's helmet.
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * _logic call hoa_sling_fnc_moduleSlingHelmet
 *
 * Public: No
 */

params ["_logic"];
TRACE_1("fnc_moduleSlingHelmet",_logic);

if (!local _logic) exitWith {};

private _unit = attachedTo _logic;

private _exit = true;
switch (false) do {
    case (!isNull _unit): {
        [_logic, "$STR_ace_zeus_nothingSelected"] call FUNC(errorAndClose);
    };
    case (alive _unit): {
        [_logic, "$STR_ace_zeus_onlyAlive"] call FUNC(errorAndClose);
    };
    default { _exit = false };
};

if (_exit) exitWith {};

switch (true) do {
    case (_unit call FUNC(canSwapHelmets)): {
        _unit call FUNC(swapHelmets);
    };
    case (_unit call FUNC(canSlingHelmet)): {
        _unit call FUNC(slingHelmet);
    };
    case (_unit call FUNC(canUnslingHelmet)): {
        _unit call FUNC(unslingHelmet);
    };
};

deleteVehicle _logic;