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
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_handleGetInMan
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_handleGetInMan",_unit);

if (_unit isNotEqualTo ace_player) exitWith {};

deleteVehicle GET_SLUNG_HOLDERS(_unit);
