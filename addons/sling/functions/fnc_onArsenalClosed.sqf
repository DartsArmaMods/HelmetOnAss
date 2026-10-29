#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles the ACE Arsenal being closed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call hoa_sling_fnc_onArsenalClosed
 *
 * Public: No
 */

#define IDC_OK 1

params ["_exitCode"];
_exitCode = IDC_OK; // Temp: https://github.com/acemod/ACE3/pull/11538
TRACE_1("fnc_onArsenalClosed",_exitCode);

// https://github.com/acemod/ACE3/blob/master/addons/arsenal/functions/fnc_onArsenalClose.sqf#L34-L41

if (_exitCode != IDC_OK) exitWith {};

// For Eden, ACE Arsenal creates a dummy agent that has its loadout edited
// When the display is closed, the dummy's loadout is then applied to the selected units
// private _extendedLoadout = ace_arsenal_center call CBA_fnc_getLoadout;
private _edenEntities = get3DENSelected "object";
private _slungItems = GET_SLUNG_ITEMS(ace_arsenal_center);

{
    private _edenEntity = _x;
    deleteVehicle GET_SLUNG_HOLDERS_3DEN(_edenEntity);

    _edenEntity setVariable [VAR_SLUNG_ITEMS, _slungItems];
    _edenEntity call FUNC(createSlungHolders);

    _edenEntity set3DENAttribute [QGVAR(params), str [_slungItems, GVAR(slungItemsPosition)]];

    // attachTo doesn't actually attach to Eden entities, but it keeps the placement the same
    // setVectorDirAndUp seems to need a delay here? I blame the czech, because it worked fine before
    _edenEntity spawn {
        sleep 0.00000001;
        GVAR(slungItemsPosition) params ["_bone", "_attachPos", "_vectorDirAndUp"];
        {
            _x attachTo [_this, _attachPos, _bone, true];
            _x setVectorDirAndUp _vectorDirAndUp;
        } forEach GET_SLUNG_HOLDERS(_this);
    };

    // Move groundholders when Eden entity is moved
    if (_edenEntity getVariable [QGVAR(eden_hasEventHandlers), false]) exitWith {};
    _edenEntity setVariable [QGVAR(eden_hasEventHandlers), true];
    _edenEntity addEventHandler ["Dragged3DEN", {
        params ["_edenEntity"];
        private _params = parseSimpleArray ((_edenEntity get3DENAttribute QGVAR(params)) select 0);
        private _slingParams = (_params param [1, GVAR(slungItemsPosition)]);
        _slingParams params ["_bone", "_attachPos", "_vectorDirAndUp"];
        {
            _x attachTo [_edenEntity, _attachPos, _bone, true];
            _x setVectorDirAndUp _vectorDirAndUp;
        } forEach GET_SLUNG_HOLDERS(_edenEntity);
    }];
    _edenEntity addEventHandler ["UnregisteredFromWorld3DEN", {
        params ["_edenEntity"];
        deleteVehicle GET_SLUNG_HOLDERS(_edenEntity);
    }];
} forEach _edenEntities;
