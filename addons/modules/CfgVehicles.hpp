class CfgVehicles {
    class Module_F;
    class MODULE(Base): Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QUOTE(ADDON);
        function = "ace_common_fnc_dummy";
        functionPriority = 1;
        isGlobal = GLOBAL;
        isTriggerActivated = 0;
    };

    class MODULE(SlingItems_zeus): MODULE(Base) {
        scope = 1;
        author = AUTHOR;
        displayName = ECSTRING(sling,slingItems_name);
        curatorCanAttach = 1;
        curatorInfoType = QGVAR(RscSlingItems);
    };

    class MODULE(UnslingItems_zeus): MODULE(Base) {
        scope = 1;
        author = AUTHOR;
        displayName = ECSTRING(sling,unslingItems_name);
        curatorCanAttach = 1;
        function = QFUNC(moduleUnslingItems);
    };
};
