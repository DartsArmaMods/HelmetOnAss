#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Handles adding or removing an item from a slot.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item (unused) <STRING>
 * 2: Slot <NUMBER>
 * 3: Assigned <BOOL>
 * 4: Weapon (unused) <STRING>
 *    - For adding/removing weapon attachments
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "H_HelmetHBK_headset_F", 605, true, ""] call hoa_throwing_fnc_slotItemChanged
 *
 * Public: No
 */

params ["_unit", "", "_slot", "_assigned"];
TRACE_3("fnc_slotItemChanged",_unit,_slot,_assigned);

if !(GVAR(enabled) && local _unit && _slot == TYPE_HEADGEAR) exitWith {};

if (_assigned) then {
    _unit call FUNC(addGrenade);
} else {
    if (GET_SLUNG_ITEMS(_unit) isEqualTo []) then {
        _unit removeMagazines GRENADE_CLASS;
    };
};
