[
    QGVAR(enabled), "CHECKBOX",
    [LSTRING(enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(slungHelmetPosition), "LIST",
    [LSTRING(slungHelmetPosition_name), LSTRING(slungHelmetPosition_tooltip)],
    _category, [GVAR(positions), GVAR(positionNames), 0], 0, {
        params ["_bone", "_attachPos", "_vectorDirAndUp"];
        {
            _x attachTo [ace_player, _attachPos, _bone, true];
            _x setVectorDirAndUp _vectorDirAndUp;
        } forEach (ace_player getVariable [QGVAR(slungHelmetItems), []]);
    }
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
