#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Wrapper for sling_fnc_canSlingItems to also check object type for ZEN context actions.
 *
 * Arguments:
 * 0: Entity <OBJECT>
 *
 * Return Value:
 * True if items can be slung, otherwise false <BOOL>
 *
 * Example:
 * player call hoa_zeus_fnc_canSlingItems
 *
 * Public: No
 */

params ["_entity"];
TRACE_1("fnc_canSlingItems",_entity);

_entity isEqualType objNull && { _entity isKindOf "CAManBase" } && { _entity call EFUNC(sling,canSlingItems) }
