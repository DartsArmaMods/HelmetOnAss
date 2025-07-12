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
 * _logic call hoa_zeus_fnc_moduleUnslingHelmet
 *
 * Public: No
 */

params ["_logic"];
TRACE_1("fnc_moduleUnslingHelmet",_logic);

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
    case (_unit call EFUNC(sling,canUnslingHelmet)): {
        [_logic, LSTRING(unslingHelmet_noSlungHelmet)] call FUNC(errorAndClose);
    };
    default { _exit = false };
};

if (_exit) exitWith {};

_unit call EFUNC(sling,unslingHelmet);

deleteVehicle _logic;
