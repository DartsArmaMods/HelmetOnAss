class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class slh_slingHelmet {
                displayName = CSTRING(slingHelmet_name);
                condition = QUOTE(_player call FUNC(canSlingHelmet));
                statement = QUOTE(_player call FUNC(slingHelmet));

                class slh_slingHelmet_helmet {
                    displayName = CSTRING(slingHelmet_helmet_name);
                    condition = "true";
                    statement = QUOTE([ARR_2(_player,1)] call FUNC(slingHelmet));
                };
                class slh_slingHelmet_helmetNVG {
                    displayName = CSTRING(slingHelmet_helmetNVG_name);
                    condition = "true";
                    statement = QUOTE([ARR_2(_player,2)] call FUNC(slingHelmet));
                };
                class slh_slingHelmet_helmetFacewear {
                    displayName = CSTRING(slingHelmet_helmetFacewear_name);
                    condition = "true";
                    statement = QUOTE([ARR_2(_player,3)] call FUNC(slingHelmet));
                };
            };

            class slh_unslingHelmet {
                displayName = CSTRING(unslingHelmet_name);
                condition = QUOTE(_player call FUNC(canUnslingHelmet));
                statement = QUOTE(_player call FUNC(unslingHelmet));
            };

            class slh_swapHelmets {
                displayName = CSTRING(swapHelmets_name);
                condition = QUOTE(_player call FUNC(canSwapHelmets));
                statement = QUOTE(_player call FUNC(swapHelmets));
            };

            class slh_hideSlungHelmet {
                displayName = CSTRING(hideHelmet_name);
                condition = QUOTE(_player call FUNC(canHideHelmet));
                statement = QUOTE(_player call FUNC(hideHelmet));
            };

            class slh_unhideSlungHelmet {
                displayName = CSTRING(unhideHelmet_name);
                condition = QUOTE(_player call FUNC(canUnhideHelmet));
                statement = QUOTE([ARR_2(_player,false)] call FUNC(hideHelmet));
            };
        };
    };

    class Module_F;
    class slh_moduleBase: Module_F {
        scope = 0;
        scopeCurator = 2;
        author = AUTHOR;

        category = QUOTE(ADDON);
        function = "";
        functionPriority = 1;
        isGlobal = 1; // 0 = server only, 1 = global, 2 = global w/ JIP
        isTriggerActivated = 0;
    };

    class slh_moduleSlingHelmet: slh_moduleBase {
        scope = 1;
        author = AUTHOR;
        displayName = CSTRING(slingHelmet_name);
        curatorCanAttach = 1;
        function = QFUNC(moduleSlingHelmet);
    };

    class ReammoBox;
    class slh_groundholder: ReammoBox {
        scope = 1;
        author = AUTHOR;

        model = QPATHTOF(slh_groundholder.p3d);
        icon = "iconObject_1x1";
        mapSize = 1.39;
        accuracy = 0.2;
        destrType = "DestructNo";
        isGround = 0;

        memoryPointSupply = "";
        forceSupply = 0;
        supplyRadius = 0;
        showWeaponCargo = 1;
        transportMaxMagazines = 0;
        transportMaxWeapons = 1e+009; // Really big number to allow storing items
        transportMaxBackpacks = 0;

        class TransportWeapons {};
        class TransportMagazines {};
        class TransportItems {};
        class TransportBackpacks {};
    };
};