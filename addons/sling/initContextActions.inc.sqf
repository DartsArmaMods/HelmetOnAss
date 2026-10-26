{
    _x params ["_cbaItemType", "_itemType"];
    [_cbaItemType, "ALL", LLSTRING(slingItems_name), nil, QPATHTOF(data\ui\helmet_ca.paa), [
        {
            // Show the action but grey it out
            params ["_unit", "", "", "", "_params"];
            _params params ["_itemType"];

            private _slungItemTypes = GET_SLUNG_ITEMS(_unit) apply { _x call EFUNC(common,getItemType) };

            !(_itemType in _slungItemTypes);
        },
        { GVAR(enabled) && GVAR(enableContextActions) }
    ], {
        params ["_unit", "_container", "_item"];
        private _slungItems = GET_SLUNG_ITEMS(_unit);
        _slungItems pushBack _item;

        _unit setVariable [VAR_SLUNG_ITEMS, _slungItems, true];
        _unit call FUNC(createSlungHolders);

        _unit call EFUNC(throwing,addGrenade);

        // consume = True doesn't seem to work for groundholders and containers, so we re-implement our own logic
        // Container == unit when using action on an equipped item
        if (_container == _unit) then {
            _unit unlinkItem _item;
        } else {
            [_container, _item, 1] call CBA_fnc_removeItemCargo;
        };

        false; // Close menu
    }, false, _itemType] call CBA_fnc_addItemContextMenuOption;
} forEach [
    ["##Headgear", "headgear"],
    ["##NVGoggles", "hmd"],
    ["##Glasses", "glasses"]
];
