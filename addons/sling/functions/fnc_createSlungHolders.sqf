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

params ["_unit", ["_slingParams", []]];
TRACE_2("fnc_createSlungHolders",_unit,_slingParams);

private _slungItems = GET_SLUNG_ITEMS(_unit);
if !(local _unit && alive _unit &&
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
    private _isFacewear = (_x call EFUNC(common,getItemType)) == "glasses";
    private _groundholderClass = ["hoa_groundholder", "hoa_groundholder_facewear"] select _isFacewear;
    private _groundholder = createVehicle [_groundholderClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _groundholder addItemCargoGlobal [_x, 1];

    _groundholder setPosASL _positionASL; // Attaching objects when they're far away can cause issues sometimes
    _groundholders pushBack _groundholder;

    // Have object claim itself to remove ace interactions
    [_groundholder, _groundholder] call ace_common_fnc_claimSafeServer;
} forEach _slungItems;

_unit setVariable [VAR_SLUNG_HOLDERS, _groundholders, true];
[_unit, _slingParams] call FUNC(repositionSlungHolders);

// If player sets it to hide the slung items, always hide everything
if (_unit getVariable [VAR_HIDE_SLUNG_HOLDERS, false]) then {
    [QGVAR(hideObjects), [_groundholders, true]] call CBA_fnc_serverEvent;
} else {
    // Otherwise, hide items that are configured to hide on sling
    private _groundholdersToHide = _groundHolders select {
        (getItemCargo _x select 0 select 0) call FUNC(getSlingParams) select 1
    };
    [QGVAR(hideObjects), [_groundholdersToHide, true]] call CBA_fnc_serverEvent;

    // If every item is hidden, set the variable to true
    _unit setVariable [VAR_HIDE_SLUNG_HOLDERS, count _groundHolders == count _groundholdersToHide];
};

_groundholders;
