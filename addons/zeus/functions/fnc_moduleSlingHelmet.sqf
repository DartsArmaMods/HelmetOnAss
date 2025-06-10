#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Slings or unslings a unit's helmet.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Sling mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_zeus_fnc_moduleSlingHelmet
 *
 * Public: No
 */

params ["_unit", ["_slingMode", 0]];
TRACE_2("fnc_moduleSlingHelmet",_unit,_slingMode);

private _slingParams = EGVAR(sling,positions) select _slingMode;

// If a helmet is already slung, instead move the helmet to the selected position
private _slungItems = _unit getVariable [QEGVAR(sling,slungHelmetItems), []];
if (_slungItems isNotEqualTo []) then {
    _slingParams params ["_bone", "_attachPos", "_vectorDirAndUp"];
    {
        _x attachTo [_unit, _attachPos, _bone, true];
        _x setVectorDirAndUp _vectorDirAndUp;
    } forEach _slungItems;
} else {
    [_unit, nil, nil, nil, _slingParams] call EFUNC(sling,slingHelmet);
};