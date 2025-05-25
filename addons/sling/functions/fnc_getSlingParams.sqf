#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Gets and caches sling parameters of a given class.
 *
 * Arguments:
 * 0: Uniform, helmet, nvg, or facewear class <STRING>
 *
 * Return Value:
 * Sling params <ARRAY>
 *   - 0: Sling with helmet <BOOL>
 *   - 1: Hide when slung <BOOL>
 *
 * Example:
 * "H_HelmetHBK_headset_F" call hoa_sling_fnc_getSlingParams
 *
 * Public: No
 */

params ["_item"];
TRACE_1("fnc_getSlingParams",_item);

private _type = _item call ace_common_fnc_getItemType select 1;
if !(_type in ["uniform", "headgear", "hmd", "glasses"]) exitWith {};

private _itemConfig = _item call CBA_fnc_getItemConfig;

if (_type == "uniform") then {
    GVAR(uniformCache) getOrDefaultCall [_item, {
        private _attachPos = getArray (_itemConfig >> QGVAR(slungHelmetPos));
        if (_attachPos isEqualTo []) then {
            _attachPos = GVAR(defaultPos);
        };

        private _pitchBankYaw = getArray (_itemConfig >> QGVAR(slungHelmetPitchBankYaw));
        if (_pitchBankYaw isEqualTo []) then {
            _pitchBankYaw = GVAR(defaultPitchBankYaw);
        };
        [_attachPos, _pitchBankYaw]; // return
    }, true];
} else {
    GVAR(slingCache) getOrDefaultCall [_item, {
        [
            _type == "headgear" || getNumber (_itemConfig >> QGVAR(slingWithHelmet)) == 1,
            getNumber (_itemConfig >> QGVAR(hideWhenSlung)) == 1
        ] // return
    }, true];
};