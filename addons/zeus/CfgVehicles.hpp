class CfgVehicles {
    class Module_F;
    class MODULE(Base): Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QUOTE(ADDON);
        function = "";
        functionPriority = 1;
        isGlobal = GLOBAL;
        isTriggerActivated = 0;
    };

    class MODULE(SlingItems): MODULE(Base) {
        scope = 1;
        author = AUTHOR;
        displayName = ECSTRING(sling,slingItems_name);
        curatorCanAttach = 1;
        function = "ace_common_fnc_dummy";
        curatorInfoType = QGVAR(RscSlingItems);
    };

    class MODULE(UnslingItems): MODULE(Base) {
        scope = 1;
        author = AUTHOR;
        displayName = ECSTRING(sling,unslingItems_name);
        curatorCanAttach = 1;
        function = QFUNC(moduleUnslingItems);
    };
};
