#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Returns the contents of a unit's slung items.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Array of items <ARRAY>
 *
 * Example:
 * player call hoa_sling_fnc_getSlungItems
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];
TRACE_1("fnc_getSlungItems",_unit);

if (isNull _unit || !(_unit isKindOf "CAManBase")) exitWith { [] };

_unit getVariable [QGVAR(slungItems), []];
