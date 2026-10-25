#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Wrapper for sling_fnc_canUnslingItems to also check object type for ZEN context actions.
 *
 * Arguments:
 * 0: Entity <OBJECT>
 *
 * Return Value:
 * True if items can be unslung, otherwise false <BOOL>
 *
 * Example:
 * player call hoa_zeus_fnc_canUnslingItems
 *
 * Public: No
 */

params ["_entity"];
TRACE_1("fnc_canUnslingItems",_entity);

_entity isEqualType objNull && { _entity isKindOf "CAManBase" } && { _entity call EFUNC(sling,canUnslingItems) }
