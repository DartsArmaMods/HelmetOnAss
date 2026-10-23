#include "..\script_component.hpp"
#include "\z\ace\addons\arsenal\defines.hpp"
/*
 * Authors: DartRuffian
 * Reads HOA information from a CBA loadout hashmap.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Loadout (unused) <ARRAY>
 * 2: Extended info <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [], createHashMap] call hoa_sling_fnc_loadoutSet
 *
 * Public: No
 */

params ["_unit", "", "_extendedInfo"];
TRACE_2("fnc_loadoutSet",_unit,_extendedInfo);

// Old name, for BWC
private _slungItems = _extendedInfo getOrDefault [QGVAR(slungHelmetItems), []];
if (isNil "_slungItems" || { _slungItems isNotEqualTo [] }) then {
    _extendedInfo deleteAt QGVAR(slungHelmetItems);
    _extendedInfo set [VAR_SLUNG_ITEMS, _slungItems];
};

_slungItems = _extendedInfo getOrDefault [VAR_SLUNG_ITEMS, []];

// Make sure that the items in the loadout are available in the arsenal (if using one)
private _arsenal = missionNamespace getVariable ["ace_arsenal_currentBox", objNull];
if (!isNull _arsenal) then {
    // _virtualItems will be [] on full arsenals (i.e. used `true` for items)
    private _virtualItems = keys (_arsenal call ace_arsenal_fnc_getVirtualItems);
    if (_virtualitems isNotEqualTo []) then {
        if (hasInterface) then {
            private _unavailableItems = (_slungItems - _virtualItems);

            // Display message for missing items
            if (_unavailableItems isNotEqualTo []) then {
                _unavailableItems = _unavailableItems apply { getText ((_x call CBA_fnc_getItemConfig) >> "displayName") };
                [{
                    [findDisplay IDD_ace_arsenal, format [LLSTRING(unavailableItems), _this joinString ", "]] call ace_arsenal_fnc_message;
                }, _unavailableItems] call CBA_fnc_execNextFrame;
            };
        };
        _slungItems = _slungItems arrayIntersect _virtualItems;
    };
};

// Sling items if loadout has them, otherwise delete holders
if (_slungItems isEqualTo []) then {
    _unit call FUNC(resetVariables);
} else {
    _unit setVariable [VAR_SLUNG_ITEMS, _slungItems, true];
    _unit call FUNC(createSlungHolders);
};
