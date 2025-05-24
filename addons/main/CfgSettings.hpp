class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                main_addon = QUOTE(ADDON);
                level = -2; // Only check version if server has the mod loaded

                class dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, QUOTE(true)};
                };
            };
        };
    };
};