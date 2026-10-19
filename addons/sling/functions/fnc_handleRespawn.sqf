#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a unit respawning.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_handleRespawn
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_handleRespawn",_unit);

if (!local _unit) exitWith {};

_unit setVariable [VAR_SLUNG_ITEMS, nil, true];
_unit setVariable [VAR_SLUNG_HOLDERS, nil, true];
_unit setVariable [VAR_HIDE_SLUNG_ITEMS, nil, true];
