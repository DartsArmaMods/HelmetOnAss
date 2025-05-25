#include "script_component.hpp"

["CBA_loadoutSet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    private _slungItems = _extendedInfo getOrDefault [QGVAR(slungHelmetItems), []];
    if (_slungItems isEqualTo []) then {
        deleteVehicle (_unit getVariable [QGVAR(slungHelmetItems), []]);
        _unit setVariable [QGVAR(slungHelmetItems), nil, true];
    } else {
        [_unit, 0, _slungItems, false] call FUNC(slingHelmet);
    };
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "_loadout", "_extendedInfo"];
    private _items = (_unit getVariable [QGVAR(slungHelmetItems), []]) apply { getItemCargo _x select 0 select 0};
    _extendedInfo set [QGVAR(slungHelmetItems), _items];
}] call CBA_fnc_addEventHandler;