class zen_context_menu_actions {
    class GVAR(slingItems) {
        displayName = ECSTRING(sling,slingItems_name);
        condition = QUOTE(_hoveredEntity call EFUNC(modules,canSlingItems));
        statement = QUOTE(_hoveredEntity call EFUNC(sling,slingItems));
        icon = QPATHTOEF(sling,data\ui\helmet_ca.paa);
        priority = 41;
        class Helmet {
            displayName = ECSTRING(sling,slingItems_helmet_name);
            statement = QUOTE([ARR_2(_hoveredEntity,SLING_MODE_HELMET)] call EFUNC(sling,slingItems));
        };
        class HelmetNVG {
            displayName = ECSTRING(sling,slingItems_helmetNVG_name);
            statement = QUOTE([ARR_2(_hoveredEntity,SLING_MODE_HELMET_NVG)] call EFUNC(sling,slingItems));
        };
        class HelmetFacewear {
            displayName = ECSTRING(sling,slingItems_helmetFacewear_name);
            statement = QUOTE([ARR_2(_hoveredEntity,SLING_MODE_HELMET_FACEWEAR)] call EFUNC(sling,slingItems));
        };
        class All {
            displayName = ECSTRING(sling,slingItems_all_name);
            statement = QUOTE([ARR_2(_hoveredEntity,SLING_MODE_ALL)] call EFUNC(sling,slingItems));
        };
    };
    class GVAR(unslingItems) {
        displayName = ECSTRING(sling,unslingItems_name);
        condition = QUOTE(_hoveredEntity call EFUNC(modules,canUnslingItems));
        statement = QUOTE(_hoveredEntity call EFUNC(sling,unslingItems));
        icon = QPATHTOEF(sling,data\ui\helmet_ca.paa);
        priority = 41;
    };
};
