[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(enableContextActions), "CHECKBOX",
    [LSTRING(enableContextActions_name), LSTRING(enableContextActions_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(slungItemsPosition), "LIST",
    [LSTRING(slungItemsPosition_name), LSTRING(slungItemsPosition_tooltip)],
    _category, [GVAR(positions), GVAR(positionNames), 1], 0, {
        [ace_player, _this] call FUNC(repositionSlungHolders);
    }
] call CBA_fnc_addSetting;
