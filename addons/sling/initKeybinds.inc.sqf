#include "\z\slh\addons\main\data\hpp\defineDIKCodes.hpp"

[
    _category, QGVAR(key_slingHelmet),
    [LSTRING(slingHelmet_name), LSTRING(slingHelmet_tooltip)], {
        private _unit = [] call CBA_fnc_currentUnit;
        if (_unit call FUNC(canSlingHelmet)) then {
            _unit call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingHelmet_helmet),
    [LSTRING(slingHelmet_helmet_name), LSTRING(slingHelmet_helmet_tooltip)], {
        private _unit = [] call CBA_fnc_currentUnit;
        if (_unit call FUNC(canSlingHelmet)) then {
            [_unit, 1] call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingHelmet_helmetNVG),
    [LSTRING(slingHelmet_helmetNVG_name), LSTRING(slingHelmet_helmetNVG_tooltip)], {
        private _unit = [] call CBA_fnc_currentUnit;
        if (_unit call FUNC(canSlingHelmet)) then {
            [_unit, 2] call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_slingHelmet_helmetFacewear),
    [LSTRING(slingHelmet_helmetFacewear_name), LSTRING(slingHelmet_helmetFacewear_tooltip)], {
        private _unit = [] call CBA_fnc_currentUnit;
        if (_unit call FUNC(canSlingHelmet)) then {
            [_unit, 3] call FUNC(slingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_unslingHelmet),
    [LSTRING(unslingHelmet_name), LSTRING(unslingHelmet_tooltip)], {
        private _unit = [] call CBA_fnc_currentUnit;
        if (_unit call FUNC(canUnslingHelmet)) then {
            _unit call FUNC(unslingHelmet);
        };
    }, {}, []
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_swapHelmets),
    [LSTRING(swapHelmets_name), LSTRING(swapHelmets_tooltip)], {
        private _unit = [] call CBA_fnc_currentUnit;
        if (_unit call FUNC(canSwapHelmets)) then {
            _unit call FUNC(swapHelmets);
        };
    }, {}, []
] call CBA_fnc_addKeybind;