[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(allowedModesSetting), "EDITBOX",
    [LSTRING(allowedModes_name), LSTRING(allowedModes_tooltip)],
    _category, "[1, 2, 3]", true, {
        GVAR(allowedModes) = parseSimpleArray _this;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(canHideHelmet), "CHECKBOX",
    [LSTRING(canHideHelmet_name), LSTRING(canHideHelmet_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;