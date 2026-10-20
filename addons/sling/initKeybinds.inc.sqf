#include "\z\hoa\addons\main\data\hpp\defineDIKCodes.hpp"

[
    _category, QGVAR(key_slingItems),
    [LSTRING(slingItems_name), LSTRING(slingItems_tooltip)], {
        if (ace_player call FUNC(canSlingItems)) then {
            ace_player call FUNC(slingItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingItems_helmet),
    [LSTRING(slingItems_helmet_name), LSTRING(slingItems_helmet_tooltip)], {
        if ([ace_player, SLING_MODE_HELMET] call FUNC(canSlingItems)) then {
            [ace_player, SLING_MODE_HELMET] call FUNC(slingItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingItems_helmetNVG),
    [LSTRING(slingItems_helmetNVG_name), LSTRING(slingItems_helmetNVG_tooltip)], {
        if ([ace_player, SLING_MODE_HELMET_NVG] call FUNC(canSlingItems)) then {
            [ace_player, SLING_MODE_HELMET_NVG] call FUNC(slingItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingItems_helmetFacewear),
    [LSTRING(slingItems_helmetFacewear_name), LSTRING(slingItems_helmetFacewear_tooltip)], {
        if ([ace_player, SLING_MODE_HELMET_FACEWEAR] call FUNC(canSlingItems)) then {
            [ace_player, SLING_MODE_HELMET_FACEWEAR] call FUNC(slingItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_unslingItems),
    [LSTRING(unslingItems_name), LSTRING(unslingItems_tooltip)], {
        if (ace_player call FUNC(canUnslingItems)) then {
            ace_player call FUNC(unslingItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_swapSlungItems),
    [LSTRING(swapSlungItems_name), LSTRING(swapSlungItems_tooltip)], {
        if (ace_player call FUNC(canSwapSlungItems)) then {
            ace_player call FUNC(swapSlungItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_hideSlungItems),
    [LSTRING(hideSlungItems_name), LSTRING(hideSlungItems_tooltip)], {
        if (ace_player call FUNC(canHideSlungItems)) then {
            ace_player call FUNC(hideSlungItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_unhideSlungItems),
    [LSTRING(unhideSlungItems_name), LSTRING(unhideSlungItems_tooltip)], {
        if (ace_player call FUNC(canUnhideSlungItems)) then {
            [ace_player, false] call FUNC(hideSlungItems);
        };
    }, {}, []
] call CBA_fnc_addKeybind;
