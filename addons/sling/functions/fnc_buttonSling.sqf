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

// Mission is running, can just swap items
if (!is3DEN) exitWith {
    _unit call FUNC(swapSlungItems);
};

// This is the actual unit in Eden, ACE uses a dummy unit for loadout editing
private _edenEntity = (uiNamespace getVariable ["BIS_fnc_3DENEntityMenu_data", []]) param [1, objNull];

private _items = [headgear _unit, hmd _unit, goggles _unit] select { (_x call FUNC(getSlingParams)) select 0 };

private _params = parseSimpleArray ((_edenEntity get3DENAttribute QGVAR(params)) select 0);
private _slungItems = (_params param [0, []]);

deleteVehicle (_edenEntity getVariable [VAR_SLUNG_HOLDERS_3DEN, []]);
_edenEntity setVariable [VAR_SLUNG_HOLDERS_3DEN, nil];

_edenEntity setVariable [VAR_SLUNG_ITEMS, _items];
_edenEntity set3DENAttribute [QGVAR(params), str [_items, GVAR(slungItemsPosition)]];

// Workaround to prevent them being deleted when ACE deletes their dummy unit for Eden ACE Arsenal
if (_items isNotEqualTo []) then {
    _edenEntity call FUNC(createSlungHolders);
    private _groundholders = GET_SLUNG_HOLDERS(_edenEntity);
    _edenEntity setVariable [VAR_SLUNG_HOLDERS, nil];
    _edenEntity setVariable [VAR_SLUNG_HOLDERS_3DEN, _groundholders];

    { _unit unlinkItem _x } forEach _items;
};

// ACE handles setting the Eden entity loadout, we just need to edit the dummy
[_unit, _slungItems] call FUNC(addItems);

GVAR(slungItemsPosition) params ["_bone", "_attachPos", "_vectorDirAndUp"];
{
    _x attachTo [_edenEntity, _attachPos, _bone, true];
    _x setVectorDirAndUp _vectorDirAndUp;
} forEach GET_SLUNG_HOLDERS_3DEN(_edenEntity);

// Event handlers
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
    } forEach GET_SLUNG_HOLDERS_3DEN(_edenEntity);
}];
_edenEntity addEventHandler ["UnregisteredFromWorld3DEN", {
    params ["_edenEntity"];
    deleteVehicle GET_SLUNG_HOLDERS_3DEN(_edenEntity);
}];
