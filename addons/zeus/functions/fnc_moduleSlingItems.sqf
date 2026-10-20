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
 * player call hoa_zeus_fnc_moduleSlingItems
 *
 * Public: No
 */

if (canSuspend) exitWith {
    [FUNC(moduleSlingItems), _this] call CBA_fnc_directCall;
};

params ["_logic", "_units", "_activated"];
TRACE_3("fnc_moduleSlingItems",_logic,_units,_activated);

if (!_activated) exitWith {};

private _slingParams = _logic getVariable [QGVAR(slingParams), QEGVAR(sling,slungItemsPosition)];

{
    if (GET_SLUNG_ITEMS(_x) isEqualTo []) then {
        [_x, SLING_MODE_DEFAULT, [], true, _slingParams] call EFUNC(sling,slingItems);
    } else {
        // Unit already has slung items, so just reposition the existing ones
        [_x, _slingParams] call EFUNC(sling,createSlungHolders);
    };
} forEach _units;
