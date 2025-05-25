#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"

GVAR(uniformCache) = createHashMap; // Hashmap of uniforms and their sling position / angle
GVAR(slingCache) = createHashMap; // Hashamp of helmets, nvgs, and facewear and whether they should sling with the helmet and hidden when slung

// These are mainly here for modders (probably you) to quickly test setups
GVAR(defaultPos) = [-0.15, 0.35, -0.2];
GVAR(defaultPitchBankYaw) = [20, 0, 150];