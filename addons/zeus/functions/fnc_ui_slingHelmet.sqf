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
 * _control call hoa_zeus_fnc_ui_slingHelmet
 *
 * Public: No
*/

params ["_control"];
TRACE_1("fnc_ui_slingHelmet",_control);

// Generic init
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1;
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("Logic Object",_logic);

_control ctrlRemoveAllEventHandlers "SetFocus";

private _unit = attachedTo _logic;

private _exit = true;
switch (false) do {
    case (!isNull _unit): {
        [_logic, "$STR_ace_zeus_nothingSelected"] call FUNC(errorAndClose);
    };
    case (alive _unit): {
        [_logic, "$STR_ace_zeus_onlyAlive"] call FUNC(errorAndClose);
    };

    // Not using canSlingHelmet because we don't want to exit if they already have a helmet slung
    // If a helmet is slung, the module instead moves the helmet to the selected position
    case (headgear _unit != "" || {_unit getVariable [QEGVAR(sling,slungHelmetItems), []] isNotEqualTo []}): {
        [_logic, LSTRING(slingHelmet_noHelmet)] call FUNC(errorAndClose);
    };
    default { _exit = false };
};

if (_exit) exitWith { _display closeDisplay 0 };

private _listBox = _display displayCtrl IDC_SLING_HELMET_POSITION;
{
    private _name = _x;
    if (isLocalized _name) then {
        _name = localize _name;
    };
    _listBox lbAdd _name;
} forEach EGVAR(sling,positionNames);

// Specific onLoad stuff
private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    private _slingMode = lbCurSel (_display displayCtrl IDC_SLING_HELMET_POSITION);
    [attachedTo _logic, _slingMode] call FUNC(moduleSlingHelmet);
    nil;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];