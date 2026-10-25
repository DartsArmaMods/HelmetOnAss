#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Unslings a unit's helmet.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _logic call hoa_zeus_fnc_moduleUnslingItems
 *
 * Public: No
 */

if (canSuspend) exitWith {
    [FUNC(moduleUnslingItems), _this] call CBA_fnc_directCall;
};

params ["_logic", "", "_activated"];
TRACE_2("fnc_moduleUnslingItems",_logic,_activated);

private _unit = attachedTo _logic;
if !(local _unit && _activated) exitWith {};

private _exit = true;
switch (false) do {
    case (!isNull _unit): {
        ["$STR_ace_zeus_nothingSelected", _logic] call FUNC(errorAndClose);
    };
    case (_unit isKindOf "CAManBase"): {
        ["$STR_ace_zeus_onlyInfantry", _logic] call FUNC(errorAndClose);
    };
    case (alive _unit): {
        ["$STR_ace_zeus_onlyAlive", _logic] call FUNC(errorAndClose);
    };
    case (_unit call EFUNC(sling,canUnslingItems)): {
        [_logic, LSTRING(noSlungItems)] call FUNC(errorAndClose);
    };
    default { _exit = false };
};

if (_exit) exitWith {};

_unit call EFUNC(sling,unslingItems);

deleteVehicle _logic;
