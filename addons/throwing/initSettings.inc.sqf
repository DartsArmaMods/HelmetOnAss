[
    QGVAR(enabled), "CHECKBOX",
    [ELSTRING(sling,enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(helmetPriority), "LIST",
    [LSTRING(helmetPriority_name), LSTRING(helmetPriority_tooltip)],
    _category, [[0, 1], [LSTRING(wornHelmet), LSTRING(slungHelmet)]]
] call CBA_fnc_addSetting;

[
    QGVAR(ragdollStrength), "SLIDER",
    [LSTRING(ragdollStrength_name), LSTRING(ragdollStrength_tooltip)],
    _category, [0, 20]
] call CBA_fnc_addSetting;
