#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Adds extra information to a CBA loadout hashmap.
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
 * [player, [], createHashMap] call hoa_sling_fnc_loadoutGet
 *
 * Public: No
 */

params ["_unit", "", "_extendedInfo"];
TRACE_2("fnc_loadoutGet",_unit,_extendedInfo);

_extendedInfo deleteAt QGVAR(slungHelmetItems); // old name, unused now
private _slungItems = GET_SLUNG_ITEMS(_unit);
if (_slungItems isNotEqualTo []) then {
    _extendedInfo set [VAR_SLUNG_ITEMS, _slungItems];
};
