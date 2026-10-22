#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Adds the thrown helmet grenade to a unit, but only if they don't already have one.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_throwing_fnc_addGrenade
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_addGrenade",_unit);

if (!local _unit) exitWith {
    [QGVAR(addGrenade), _this, _unit] call CBA_fnc_targetEvent;
};

// Get all helmet grenades, including empty
private _throwables = (throwables [_unit, true]) select {
    (_x select 0) == GRENADE_CLASS;
};

// Unit doesn't have any helmet grenades at all, so we can just add one and exit
if (_throwables isEqualTo []) exitWith {
    _unit addMagazine GRENADE_CLASS;
};

// Sometimes the magazine can get "stuck" in the throwables with no ammo (not sure of exact cause, only seems to happen when ace throwing)
private _hasEmptyMuzzle = (_throwables findIf { (_x select 3) == 0}) > -1;
if (_hasEmptyMuzzle) then {
    [{ _this setAmmo [QGVAR(helmetGrenade_muzzle), 1]; }, _unit] call CBA_fnc_execNextFrame;
};
