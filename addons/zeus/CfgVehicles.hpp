class CfgVehicles {
    class Module_F;
    class hoa_moduleBase: Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QUOTE(ADDON);
        function = "";
        functionPriority = 1;
        isGlobal = 1; // 0 = server only, 1 = global, 2 = global w/ JIP
        isTriggerActivated = 0;
    };

    class hoa_moduleSlingItems: hoa_moduleBase {
        scope = 1;
        author = AUTHOR;
        displayName = ECSTRING(sling,slingItems_name);
        curatorCanAttach = 1;
        function = "ace_common_fnc_dummy";
        curatorInfoType = QGVAR(RscSlingItems);
    };

    class hoa_moduleUnslingItems: hoa_moduleBase {
        scope = 1;
        author = AUTHOR;
        displayName = ECSTRING(sling,unslingItems_name);
        curatorCanAttach = 1;
        function = QFUNC(moduleUnslingItems);
    };
};
