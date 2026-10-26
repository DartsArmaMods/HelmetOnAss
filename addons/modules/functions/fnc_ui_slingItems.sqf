#include "..\script_component.hpp"
/*
 * Author: alganthe, mharis001, DartRuffian
 * Initializes the helmet sling Zeus module display.
 * Based on https://github.com/acemod/ACE3/blob/master/addons/zeus/functions/fnc_ui_garrison.sqf
 *
 * Arguments:
 * 0: Zeus module button <CONTROL>
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
        [_logic, "$STR_ace_zeus_nothingSelected", _display] call FUNC(errorAndClose);
    };
    case (_unit isKindOf "CAManBase"): {
        [_logic, "$STR_ace_zeus_onlyInfantry", _display] call FUNC(errorAndClose);
    };
    case (alive _unit): {
        [_logic, "$STR_ace_zeus_onlyAlive", _display] call FUNC(errorAndClose);
    };
    default {
        _exit = false;
    };
};

if (_exit) exitWith {};

private _slingParamsListBox = (_display displayCtrl IDC_SLING_POSITION) controlsGroupCtrl IDC_VALUE;
{
    private _name = _x;
    if (isLocalized _name) then { _name = localize _name };
    _slingParamsListBox lbAdd _name;
} forEach EGVAR(sling,positionNames);
_slingParamsListBox lbSetCurSel 0;

// Disable the control if the unit has slung items
private _slingModeToolbox = (_display displayCtrl IDC_SLING_MODE) controlsGroupCtrl IDC_VALUE;

if (GET_SLUNG_ITEMS(_unit) isNotEqualTo []) then {
    _slingModeToolbox ctrlEnable false;
    _slingModeToolbox ctrlSetTooltip LLSTRING(hasSlungItems);

    _slingModeToolbox ctrlSetFade 0.5;
    _slingModeToolbox ctrlCommit 0;

    // Ideally there's some way to deselect the items, but lbCurSel -1 doesn't work with toolboxes
    // TODO: Test ctrlSetProperty #{"colorSelectedBg": [0, 0, 0, 0]} in 2.24
};

/*
Wiki page for https://community.bistudio.com/wiki/lbSetCurSel describes a workaround to deselect items in a toolbox by clearing the toolbox, selecting -1, and then re-adding items
However this doesn't seem to work anymore, tried doing it and it instead selects some new item
*/

private _fnc_onUnload = {
    deleteVehicle GET_CURRENT_TARGET;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    private _logic = GET_CURRENT_TARGET;
    private _unit = attachedTo _logic;

    if (isNull _logic || isNull _display || !alive _unit) exitWith {};

    private _slingParamsIndex = lbCurSel ((_display displayCtrl IDC_SLING_POSITION) controlsGroupCtrl IDC_VALUE);
    private _slingParams = EGVAR(sling,positions) select _slingParamsIndex;
    _logic setVariable [QGVAR(slingParams), _slingParams, true];

    _logic setVariable [QGVAR(slingMode), lbCurSel ((_display displayCtrl IDC_SLING_MODE) controlsGroupCtrl IDC_VALUE), true];

    [QGVAR(moduleSlingItems), [_logic, [_unit], true], _unit] call CBA_fnc_targetEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrl ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
