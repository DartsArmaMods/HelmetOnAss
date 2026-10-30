#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the ACE Arsenal being closed.
 *
 * Arguments:
 * 0: Exit code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call hoa_sling_fnc_onArsenalClosed
 *
 * Public: No
 */

#define IDC_OK 1

params [["_exitCode", IDC_OK]];
TRACE_1("fnc_onArsenalClosed",_exitCode);

// https://github.com/acemod/ACE3/blob/master/addons/arsenal/functions/fnc_onArsenalClose.sqf#L34-L41
// Exit unless the user hit "Apply"
if (_exitCode != IDC_OK) exitWith {};

// For Eden, ACE Arsenal creates a dummy agent that has its loadout edited
// When the display is closed, the dummy's loadout is then applied to the selected units
private _edenEntities = get3DENSelected "object";
private _slungItems = GET_SLUNG_ITEMS(ace_arsenal_center);

{
    // Setting this runs the expression to create the groundholders
    _x set3DENAttribute [QGVAR(params), [+_slungItems, +GVAR(slungItemsPosition)]];
} forEach _edenEntities;
