class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class hoa_attributes {
                class Attributes {
                    // Not displayed to users but still saved to mission.sqm
                    // Not worried about translations
                    class GVAR(params) {
                        displayName = "Sling Params (Items + Position)";
                        tooltip = "DEBUG: You shouldn't see this!";
                        property = QGVAR(params);
                        control = "Edit";
                        defaultValue = "'[[],[]]'";
                        // GET_SLUNG_HOLDERS here is expanded since the variable needs to be quoted again
                        #pragma hemtt suppress pw3_padded_arg line
                        expression = QUOTE( \
                            deleteVehicle (_this getVariable [ARR_2(QUOTE(VAR_SLUNG_HOLDERS),[])]); \
                            _value = parseSimpleArray _value; \
                            _value params [ARR_2('_items','_slingParams')]; \
                            _this setVariable [ARR_3(QUOTE(VAR_SLUNG_ITEMS),_items,true)]; \
                            [ARR_2(_this,_slingParams)] call FUNC(createSlungHolders);
                        );
                        condition = "script"; // objectBrain
                        #ifdef DEBUG_MODE_FULL
                            conditionScript = "true";
                        #else
                            conditionScript = "false";
                        #endif
                    };
                };
            };
        };
    };
};
