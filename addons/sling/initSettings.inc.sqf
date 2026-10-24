[
    QGVAR(enabled), "CHECKBOX",
    [ELSTRING(sling,enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(slungItemsPosition), "LIST",
    [LSTRING(slungItemsPosition_name), LSTRING(slungItemsPosition_tooltip)],
    _category, [GVAR(positions), GVAR(positionNames), 0], 0, {
        [ace_player, _this] call FUNC(repositionSlungHolders);
    }
] call CBA_fnc_addSetting;
