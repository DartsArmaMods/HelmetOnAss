#include "\z\hoa\addons\main\data\hpp\defineDIKCodes.hpp"

[
    _category, QGVAR(key_slingHelmet),
    [LSTRING(slingHelmet_name), LSTRING(slingHelmet_tooltip)], {
        if (ace_player call FUNC(canSlingHelmet)) then {
            ace_player call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingHelmet_helmet),
    [LSTRING(slingHelmet_helmet_name), LSTRING(slingHelmet_helmet_tooltip)], {
        if ([ace_player, 1] call FUNC(canSlingHelmet)) then {
            [ace_player, 1] call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingHelmet_helmetNVG),
    [LSTRING(slingHelmet_helmetNVG_name), LSTRING(slingHelmet_helmetNVG_tooltip)], {
        if ([ace_player, 2] call FUNC(canSlingHelmet)) then {
            [ace_player, 2] call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingHelmet_helmetFacewear),
    [LSTRING(slingHelmet_helmetFacewear_name), LSTRING(slingHelmet_helmetFacewear_tooltip)], {
        if ([ace_player, 3] call FUNC(canSlingHelmet)) then {
            [ace_player, 3] call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_unslingHelmet),
    [LSTRING(unslingHelmet_name), LSTRING(unslingHelmet_tooltip)], {
        if (ace_player call FUNC(canUnslingHelmet)) then {
            ace_player call FUNC(unslingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_swapHelmets),
    [LSTRING(swapHelmets_name), LSTRING(swapHelmets_tooltip)], {
        if (ace_player call FUNC(canSwapHelmets)) then {
            ace_player call FUNC(swapHelmets);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_hideHelmet),
    [LSTRING(hideHelmet_name), LSTRING(hideHelmet_tooltip)], {
        if (ace_player call FUNC(hideHelmet)) then {
            ace_player call FUNC(hideHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_unhideHelmet),
    [LSTRING(unhideHelmet_name), LSTRING(unhideHelmet_tooltip)], {
        if (ace_player call FUNC(canUnhideHelmet)) then {
            [ace_player, false] call FUNC(hideHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;