class CfgWeapons {
    class Binocular;
    class NVGoggles: Binocular {
        GVAR(slingWithHelmet) = 1; // 0-Don't sling this item, 1-Sling
        GVAR(hideWhenSlung) = 0; // 0-Nothing 1-Hide item when slung
    };
};
