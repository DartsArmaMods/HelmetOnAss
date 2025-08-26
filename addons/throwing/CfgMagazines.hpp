class CfgMagazines {
    class HandGrenade;
    class GVAR(helmetGrenade): HandGrenade {
        scope = 2;
        author = AUTHOR;
        displayName = CSTRING(helmetGrenade);
        displayNameShort = "$STR_A3_RscDisplayArsenal_tab_headgear";
        descriptionShort = "";

        picture = "\A3\UI_F\data\gui\rsc\rscdisplayarsenal\headgear_ca.paa";
        ammo = QGVAR(helmetGrenade_ammo);
    };
};
