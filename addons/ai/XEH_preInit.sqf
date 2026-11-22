#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"

GVAR(armorCache) = createHashMap;

// Bulks networking calls for multiple units
[QGVAR(swapSlungItemsAI), {
    params ["_units"];
    TRACE_CHAT_1("",_units);

    {
        _x call EFUNC(sling,swapSlungItems);
    } forEach (_units select { local _x });
}] call CBA_fnc_addEventHandler;
