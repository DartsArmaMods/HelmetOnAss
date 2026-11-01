#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Creates slung holders based on Eden attributes.
 *
 * Arguments:
 * 0: Unit(s) <OBJECT|ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * (get3DENSelected "object") call hoa_sling_fnc_3DEN_createSlungHolders
 *
 * Public: No
 */

params ["_entities"];
TRACE_1("fnc_3DEN_createSlungHolders",_entities);

if (_entities isEqualType objNull) then {
    _entities = [_entities];
};

{
    private _params = (_x get3DENAttribute QGVAR(params)) select 0;
    _params params ["_slungItems", "_slingParams"];

    if (_slungItems isEqualTo []) then { continue };

    _x setVariable [VAR_SLUNG_ITEMS, _slungItems];
    [_x, _slingParams] call FUNC(createSlungHolders);
} forEach _entities;
