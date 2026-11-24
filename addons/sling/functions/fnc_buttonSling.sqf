#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the ACE Arsenal button to swap slung items.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ace_arsenal_center call hoa_sling_fnc_buttonSling
 *
 * Public: Yes
 */

params ["_unit"];
TRACE_1("fnc_buttonSling",_unit);

_unit call FUNC(swapSlungItems);
