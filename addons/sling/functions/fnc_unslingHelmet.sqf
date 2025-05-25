#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Unslings a unit's helmet.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_unslingHelmet;
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_unslingHelmet",_unit);

if (headgear _unit != "") exitWith {};

private _groundholders = _unit getVariable [QGVAR(slungHelmetItems), []];
private _helmetGH = (_groundholders deleteAt [-1]) select 0;

_unit addHeadgear (getItemCargo _helmetGH select 0 select 0);
deleteVehicle _helmetGH;

{
    _unit linkItem (getItemCargo _x select 0 select 0);
} forEach _groundholders;

deleteVehicle _groundholders;
_unit setVariable [QGVAR(slungHelmetItems), nil, true];
[QGVAR(helmetUnslung), [_unit], _unit] call CBA_fnc_targetEvent;