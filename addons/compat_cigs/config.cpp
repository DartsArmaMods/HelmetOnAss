#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "hoa_sling",
            "cigs_Apollo",
            "cigs_black_devil",
            "cigs_cigars",
            "cigs_craven",
            "cigs_crayons",
            "cigs_eckstein",
            "cigs_Kosmos",
            "cigs_pops",
            "cigs_lucky_strike",
            "cigs_morley",
            "cigs_baja_blast",
            "cigs_Voron"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;

        skipWhenMissingDependencies = 1;
    };
};

#include "CfgWeapons.hpp"
