#include "script_component.hpp"

params ["_display"];
TRACE_CHAT_1("init3DEN",_display);

// This has to be scheduled with a delay to have access to Eden entities
add3DENEventHandler ["OnMissionPreviewEnd", {
    [] spawn {
        sleep 0.5;
        {
            private _params = parseSimpleArray ((_x get3DENAttribute QGVAR(params)) select 0);
            _params params ["_slungItems", "_slingParams"];

            if (_slungItems isEqualTo []) then { continue };

            _x setVariable [VAR_SLUNG_ITEMS, _slungItems];
            [_x, _slingParams] call FUNC(createSlungHolders);
        } forEach (all3DENEntities select 0);
    };
}];
