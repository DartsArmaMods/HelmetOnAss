#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a unit being deleted.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_handleDeleted
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_handleDeleted",_unit);

if (!local _unit) exitWith {};

// No need to sync variables since the object is being deleted
[_unit, false] call FUNC(resetVariables);
