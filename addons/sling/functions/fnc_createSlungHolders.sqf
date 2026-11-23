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
) exitWith { [] };

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

private _groundholdersToHide = switch (true) do {
    case GVAR(trackHiddenItems): {
        // Hide items based on user data
        private _trackedItems = profileNamespace getVariable [QGVAR(trackedHiddenItems), createHashMap];
        [[], _groundholders] select (_trackedItems getOrDefault [_slungItems param [0, ""], false]);
    };
    case (_unit getVariable [VAR_HIDE_SLUNG_HOLDERS, false]): {
        // If player sets it to hide the slung items (and setting is disabled), always hide everything
        _groundholders;
    };
    default {
        // Hide items that are configured to hide on sling
        _groundHolders select {
            (_slungItems select 0) call FUNC(getSlingParams) select 1
        };
    };
};

// If every item is hidden, set the variable to true
_unit setVariable [VAR_HIDE_SLUNG_HOLDERS, count _groundHolders == count _groundholdersToHide];

[QGVAR(hideObjects), [_groundholdersToHide, true]] call CBA_fnc_serverEvent;
[QGVAR(createdSlungHolders), [_unit, _groundholders, _slingParams]] call CBA_fnc_localEvent;

if (is3DEN) then {
    _unit call FUNC(3DEN_addEventHandlers);
};

_groundholders;
