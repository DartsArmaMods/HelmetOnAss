#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Wrapper around ace_common_fnc_getItemType to cache the result.
 *
 * Arguments:
 * 0: Item class <STRING>
 *
 * Return Value:
 * Item type <STRING>
 *
 * Example:
 * (headgear player) call hoa_common_fnc_getItemType
 *
 * Public: No
 */

params [["_item", "", [""]]];
TRACE_1("fnc_getItemType",_item);

GVAR(itemTypeCache) getOrDefaultCall [_item, {
    (_item call ace_common_fnc_getItemType) select 1;
}, true];
