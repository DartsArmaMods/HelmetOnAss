#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a unit entering a vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Role (unused) <STRING>
 * 2: Vehicle (unused) <OBJECT>
 * 3: Turret (unused) <ARRAY>
 * 4: Is eject (unused) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_handleGetOutMan
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_handleGetOutMan",_unit);

if !(local _unit && GET_SLUNG_ITEMS(_unit) isNotEqualTo []) exitWith {};

[LINKFUNC(createSlungHolders), _unit, 0.1] call CBA_fnc_waitAndExecute;
