#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles a group's **behavior** changing.
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: New mode <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, "COMBAT"] call hoa_ai_fnc_combatModeChanged
 *
 * Public: No
 */

params ["_group", "_newMode"];
TRACE_2("fnc_combatModeChanged",_group,_newMode);

private _units = (units _group) select {
    !(_x call ace_common_fnc_isPlayer) && { _x call ace_common_fnc_isAwake }
};

private _unitsToSling = [];

// Exit combat, re-sling items
if (_newMode != "COMBAT") exitWith {
    TRACE_CHAT_0("Exit combat");
    {
        if (_x getVariable [QGVAR(slungInCombat), false]) then {
            _x setVariable [QGVAR(slungInCombat), nil, true];
            _unitsToSling pushBackUnique _x;
        };
    } forEach _units;
    [QGVAR(swapSlungItemsAI), [_unitsToSling], _unitsToSling] call CBA_fnc_targetEvent;
};

private _fnc_getArmor = {
    params ["_item"];
    GVAR(armorCache) getOrDefaultCall [_item, {
        private _sum = 0;
        private _config = configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "HitpointsProtectionInfo";
        {
            private _hitpoint = getText (_x >> "hitpointName");
            _sum = _sum + ([_item, _hitpoint] call ace_medical_engine_fnc_getItemArmor);
        } forEach (configProperties [_config, "true"]);
        _sum;
    }, true];
};

TRACE_CHAT_1("Enter combat",_units);
{
    private _slungItems = GET_SLUNG_ITEMS(_x);
    if (_slungItems isEqualTo []) then { continue };

    private _currentArmor = (headgear _x) call _fnc_getArmor;
    private _slungArmor = (_slungItems param [0, ""]) call _fnc_getArmor;
    TRACE_CHAT_2("",_currentArmor,_slungArmor);

    if (_slungArmor > _currentArmor) then {
        _x setVariable [QGVAR(slungInCombat), true, true];
        _unitsToSling pushBackUnique _x;
    };
} forEach _units;

[QGVAR(swapSlungItemsAI), [_unitsToSling], _unitsToSling] call CBA_fnc_targetEvent;
