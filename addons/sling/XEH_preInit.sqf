#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"

// Mainly here for quick testing
GVAR(defaultPos) = [-0.15, 0.35, -0.2];
GVAR(defaultPitchBankYaw) = [20, 0, 150];
