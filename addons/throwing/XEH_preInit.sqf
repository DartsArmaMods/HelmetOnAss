#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"

GVAR(helmetMassCache) = createHashMap;

[QGVAR(applyDamage), LINKFUNC(applyDamage)] call CBA_fnc_addEventHandler;
["CAManBase", "SlotItemChanged", LINKFUNC(slotItemChanged)] call CBA_fnc_addClassEventHandler;
