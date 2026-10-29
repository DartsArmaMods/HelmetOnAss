#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Adds 3DEN specific event handlers after slinging a unit's helmet.
 *
 * Arguments:
 * 0: Eden entity <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * _entity call hoa_sling_fnc_3DEN_addEventHandlers
 *
 * Public: No
 */

params ["_entity"];
TRACE_1("fnc_3DEN_addEventHandlers",_entity);
if (_entity getVariable [QGVAR(eden_hasEventHandlers), false]) exitWith {};
_entity setVariable [QGVAR(eden_hasEventHandlers), true];

// Move groundholders when Eden entity is moved
_entity addEventHandler ["Dragged3DEN", {
    params ["_entity"];
    private _params = parseSimpleArray ((_entity get3DENAttribute QGVAR(params)) select 0);
    private _slingParams = (_params param [1, GVAR(slungItemsPosition)]);
    _slingParams params ["_bone", "_attachPos", "_vectorDirAndUp"];
    {
        _x attachTo [_entity, _attachPos, _bone, true];
        _x setVectorDirAndUp _vectorDirAndUp;
    } forEach GET_SLUNG_HOLDERS(_entity);
}];

// Cleanup
_entity addEventHandler ["UnregisteredFromWorld3DEN", {
    params ["_entity"];
    deleteVehicle GET_SLUNG_HOLDERS(_entity);
}];
