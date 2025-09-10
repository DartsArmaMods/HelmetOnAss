[
    QGVAR(enabled), "CHECKBOX",
    [ELSTRING(sling,enabled_name), LSTRING(enabled_tooltip)],
    _category, true, true
] call CBA_fnc_addSetting;

[
    QGVAR(helmetPriority), "LIST",
    [LSTRING(helmetPriority_name), LSTRING(helmetPriority_tooltip)],
    _category, [[USE_WORN_HELMET, USE_SLUNG_HELMET], [LSTRING(wornHelmet), LSTRING(slungHelmet)]]
] call CBA_fnc_addSetting;

[
    QGVAR(ragdollStrength), "SLIDER",
    [LSTRING(ragdollStrength_name), LSTRING(ragdollStrength_tooltip)],
    _category, [0, 20, 2], 1
] call CBA_fnc_addSetting;
