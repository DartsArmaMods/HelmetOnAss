class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {MUZZLE_CLASS};

        class ThrowMuzzle;
        class GVAR(helmetGrenade_muzzle): ThrowMuzzle {
            displayName = CSTRING(helmetGrenade);
            magazines[] = {GRENADE_CLASS};

            // Makes it so that the first grenade is kept loaded in the muzzle
            // This means it won't be saved in the inventory, and needs to be added manually
            keepInInventory = 0;
        };
    };
};
