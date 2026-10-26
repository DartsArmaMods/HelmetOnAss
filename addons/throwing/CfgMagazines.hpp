class CfgMagazines {
    class HandGrenade;
    class GVAR(helmetGrenade): HandGrenade {
        scope = 1;
        author = AUTHOR;
        displayName = CSTRING(helmetGrenade);
        displayNameShort = "$STR_A3_RscDisplayArsenal_tab_headgear";
        descriptionShort = "";

        picture = QPATHTOEF(sling,data\ui\helmet_ca.paa);
        ammo = QGVAR(helmetGrenade_ammo);
    };
};
