#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Adds a sling option to the CBA settings dropdown.
 * Passed arrays are used *by reference*. Modifying the passed array will update the value used in the settings.
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Sling settings <ARRAY>
 *    - 0: Memory point to attach to <STRING>
 *    - 1: Attach position <ARRAY>
 *    - 2: vectorDirAndUp
 *
 * Return Value:
 * Succeeded <BOOL>
 *
 * Example:
 * ["Belt", [-0.15, 0.35, -0.2], [[0.469846, -0.813798, 0.34202], [-0.17101, 0.296198, 0.939693]]] call hoa_sling_fnc_addSlingOption
 *
 * Public: Yes
 */

params [
    ["_name", "", [""]],
    ["_slingParams", [], [[]]]
];
TRACE_2("fnc_addSlingOption",_name,_slingParams);

if (_name == "" || _slingParams isEqualTo [] || _name in GVAR(positionNames)) exitWith { false };

GVAR(positionNames) pushBack _name;
GVAR(positions) pushBack _slingParams;
true;
