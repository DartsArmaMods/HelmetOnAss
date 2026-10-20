class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class hoa {
                displayName = QUOTE(MOD_NAME);
                icon = "\A3\UI_F\data\gui\rsc\rscdisplayarsenal\headgear_ca.paa";
                condition = "true";
                statement = "";
                exceptions[] = {ACTION_EXCEPTIONS};

                class hoa_slingItems {
                    displayName = CSTRING(slingItems_name);
                    condition = QUOTE(_player call FUNC(canSlingItems));
                    statement = QUOTE(_player call FUNC(slingItems));
                    exceptions[] = {ACTION_EXCEPTIONS};

                    class hoa_slingItems_helmet {
                        displayName = CSTRING(slingItems_helmet_name);
                        condition = QUOTE(_player call FUNC(canSlingItems));
                        statement = QUOTE([ARR_2(_player,SLING_MODE_HELMET)] call FUNC(slingItems));
                        exceptions[] = {ACTION_EXCEPTIONS};
                    };
                    class hoa_slingItems_helmetNVG: hoa_slingItems_helmet {
                        displayName = CSTRING(slingItems_helmetNVG_name);
                        statement = QUOTE([ARR_2(_player,SLING_MODE_HELMET_NVG)] call FUNC(slingItems));
                    };
                    class hoa_slingItems_helmetFacewear: hoa_slingItems_helmet {
                        displayName = CSTRING(slingItems_helmetFacewear_name);
                        statement = QUOTE([ARR_2(_player,SLING_MODE_HELMET_FACEWEAR)] call FUNC(slingItems));
                    };
                };

                class hoa_unslingItems {
                    displayName = CSTRING(unslingItems_name);
                    condition = QUOTE(_player call FUNC(canUnslingItems));
                    statement = QUOTE(_player call FUNC(unslingItems));
                    exceptions[] = {ACTION_EXCEPTIONS};
                };

                class hoa_swapSlungItems: hoa_unslingItems {
                    displayName = CSTRING(swapSlungItems_name);
                    condition = QUOTE(_player call FUNC(canSwapSlungItems));
                    statement = QUOTE(_player call FUNC(swapSlungItems));
                };

                class hoa_hideSlungItems: hoa_unslingItems {
                    displayName = CSTRING(hideSlungItems_name);
                    condition = QUOTE(_player call FUNC(canHideSlungItems));
                    statement = QUOTE(_player call FUNC(hideSlungItems));
                };

                class hoa_unhideSlungItems: hoa_unslingItems {
                    displayName = CSTRING(unhideSlungItems_name);
                    condition = QUOTE(_player call FUNC(canUnhideSlungItems));
                    statement = QUOTE([ARR_2(_player,false)] call FUNC(hideSlungItems));
                };
            };
        };
    };

    class CargoNet_01_box_F;
    class hoa_groundholder: CargoNet_01_box_F {
        scope = 1;
        author = AUTHOR;

        model = QPATHTOF(hoa_groundholder.p3d);
        icon = "iconObject_1x1";
        mapSize = 1.39;
        accuracy = 0.2;
        destrType = "DestructNo";
        isGround = 0;

        memoryPointSupply = "supply_pos";
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

    // Facewear models are rotated 180 degrees when in a groundholder
    // This model has the proxy rotated 180 degress to counteract this
    class hoa_groundholder_facewear: hoa_groundholder {
        // weapon proxy should be rotated - X: -89.9737d Y: -0.000005d Z: 0.000019d
        model = QPATHTOF(hoa_groundholder_facewear.p3d);
    };

    class hoa_groundholder_physx: CargoNet_01_box_F {
        scope = 1;
        author = AUTHOR;
        displayName = "$STR_cfgVehicles_WeaponHolder0";

        model = "\A3\Weapons_f\dummyweapon.p3d";

        icon = "iconObject_1x1";
        mapSize = 1.39;
        accuracy = 0.2;
        destrType = "DestructNo";
        isGround = 1;

        memoryPointSupply = "doplnovani";
        showWeaponCargo = 1;
        transportMaxMagazines = 0;
        transportMaxWeapons = 1e+009; // Really big number to allow storing items
        transportMaxBackpacks = 0;

        ace_cargo_noRename = 1;
    };
};
