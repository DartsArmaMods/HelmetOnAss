#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Repositions a unit's slung groundholders based on the given option
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Sling params (optional, default: CBA Setting) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call hoa_sling_fnc_repositionSlungHolders
 *
 * Public: No
 */

params ["_unit", ["_slingParams", []]];
TRACE_2("fnc_repositionSlungHolders",_unit,_slingParams);

if (_slingParams isEqualTo []) then { _slingParams = GVAR(slungHelmetPosition) };

_slingParams params ["_bone", "_attachPos", "_vectorDirAndUp"];
{
    _x attachTo [_unit, _attachPos, _bone, true];
    _x setVectorDirAndUp _vectorDirAndUp;
} forEach GET_SLUNG_HOLDERS(_unit);
