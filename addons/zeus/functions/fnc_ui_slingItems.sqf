#include "..\script_component.hpp"
/*
 * Author: alganthe, mharis001, DartRuffian
 * Initializes the helmet sling Zeus module display.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/zeus/functions/fnc_ui_garrison.sqf
 *
 * Arguments:
 * 0: Garrison controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _ctrl call hoa_zeus_fnc_ui_slingItems
 *
 * Public: No
*/

params ["_ctrl"];
TRACE_1("fnc_ui_slingItems",_ctrl);

_ctrl ctrlRemoveAllEventHandlers "SetFocus";

private _display = ctrlParent _ctrl;
private _logic = GET_CURRENT_TARGET;
private _unit = attachedTo _logic;

private _exit = true;
switch (false) do {
    case (!isNull _unit): {
        ["$STR_ace_zeus_nothingSelected", _logic, _display] call FUNC(errorAndClose);
    };
    case (alive _unit): {
        ["$STR_ace_zeus_onlyAlive", _logic, _display] call FUNC(errorAndClose);
    };
    default {
        _exit = false;
    };
};


private _listBox = _display displayCtrl IDC_VALUE;
{
    private _name = _x;
    if (isLocalized _name) then { _name = localize _name };
    _listBox lbAdd _name;
} forEach EGVAR(sling,positionNames);
_listBox lbSetCurSel 0;

private _fnc_onUnload = {
    deleteVehicle GET_CURRENT_TARGET;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    private _logic = GET_CURRENT_TARGET;
    private _unit = attachedTo _logic;

    if (isNull _logic || isNull _display || !alive _unit) exitWith {};

    private _slingMode = lbCurSel ((_display displayCtrl IDC_SLING_POSITION) controlsGroupCtrl IDC_VALUE);
    private _slingParams = EGVAR(sling,positions) select _slingMode;

    _logic setVariable [QGVAR(slingParams), _slingParams, true];
    [QGVAR(moduleSlingItems), [_logic, [_unit], true], _unit] call CBA_fnc_targetEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrl ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
