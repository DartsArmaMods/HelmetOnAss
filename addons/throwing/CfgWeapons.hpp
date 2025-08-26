class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {
            QGVAR(helmetGrenade_muzzle)
        };

        class ThrowMuzzle;
        class GVAR(helmetGrenade_muzzle): ThrowMuzzle {
            displayName = CSTRING(helmetGrenade);
            magazines[] = {QGVAR(helmetGrenade)};
            // keepInInventory = 0;
        };
    };
};
