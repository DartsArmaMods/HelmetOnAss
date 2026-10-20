#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Creates slung item groundholders for a unit based on what is currently slung.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Created groundholders <ARRAY>
 *
 * Example:
 * player call hoa_sling_fnc_createHolders
 *
 * Public: No
 */

#define IS_FACEWEAR(CLASS_NAME) ((CLASS_NAME call ace_common_fnc_getItemType) select 1 == "glasses")

params ["_unit", ["_slingParams", []]];
TRACE_2("fnc_createSlungHolders",_unit,_slingParams);

private _slungItems = GET_SLUNG_ITEMS(_unit);
if !(alive _unit &&
    isNull objectParent _unit &&
    _slungItems isNotEqualTo []
) exitWith {};

// Always delete the existing ones before re-creating them
deleteVehicle GET_SLUNG_HOLDERS(_unit);

// Create a new groundholder for each item
private _groundholders = [];
private _positionASL = getPosASL _unit;
{
    // Facewear items are rotated 180 degrees when dropped on the ground, so we have a separate class
    // with its proxy rotated 180 degrees to compensate
    private _groundholderClass = ["hoa_groundholder", "hoa_groundholder_facewear"] select IS_FACEWEAR(_x);
    private _groundholder = createVehicle [_groundholderClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _groundholder addItemCargoGlobal [_x, 1];

    _groundholder setPosASL _positionASL; // Attaching objects when they're far away can cause issues sometimes
    _groundholders pushBack _groundholder;

    // Have object claim itself to remove ace interactions
    [_groundholder, _groundholder] call ace_common_fnc_claimSafeServer;
} forEach _slungItems;

_unit setVariable [VAR_SLUNG_HOLDERS, _groundholders, true];
[_unit, _slingParams] call FUNC(repositionSlungHolders);

_groundholders;
