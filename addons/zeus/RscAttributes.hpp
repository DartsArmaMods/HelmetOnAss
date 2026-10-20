class RscControlsGroupNoScrollbars;
class RscText;
class RscListBox;
class ctrlToolbox;

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content;
        class ButtonOK;
        class ButtonCancel;
    };
};

class GVAR(AttributeToolbox): RscControlsGroupNoScrollbars {
    idc = -1;
    onSetFocus = "";
    x = 0;
    y = 0;
    w = QUOTE(W_PART(26));
    h = QUOTE(H_PART(1.1));
    class Controls {
        class Label: RscText {
            idc = IDC_LABEL;
            text = "";
            tooltip = "";
            x = 0;
            y = 0;
            w = QUOTE(W_PART(LABEL_W));
            h = QUOTE(H_PART(1));
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class Toolbox: ctrlToolbox {
            idc = IDC_VALUE;
            x = QUOTE(W_PART(LABEL_W + LABEL_SPACING));
            y = 0;
            w = QUOTE(W_PART(15.9));
            h = QUOTE(H_PART(1));
            rows = 1;
            columns = 1;
            strings[] = {};
        };
    };
};

class GVAR(RscSlingItems): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RscSlingItems))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RscSlingItems))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class SlingPosition: RscControlsGroupNoScrollbars {
                    idc = IDC_SLING_POSITION;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(6.2));
                    class controls {
                        class PositionLabel: RscText {
                            idc = IDC_LABEL;
                            text = ECSTRING(sling,slungItemsPosition_name);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(LABEL_W));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Position: RscListBox {
                            idc = IDC_VALUE;
                            x = QUOTE(W_PART(LABEL_W + LABEL_SPACING));
                            y = 0;
                            w = QUOTE(W_PART(26));
                            h = QUOTE(H_PART(6));
                            class Items {};
                        };
                    };
                };
                class SlingMode: GVAR(AttributeToolbox) {
                    idc = IDC_SLING_MODE;
                    class Controls: Controls {
                        class Label: Label {
                            text = ECSTRING(sling,slingMode_name);
                            tooltip = CSTRING(slingMode_tooltip);
                        };
                        class ToolBox: ToolBox {
                            rows = 1;
                            columns = 4;
                            strings[] = {
                                "$STR_vehicle_default",
                                CSTRING(slingMode_helmet),
                                "$STR_A3_RscDisplayArsenal_tab_nvgs",
                                "$STR_A3_RscDisplayArsenal_tab_goggles"
                            };
                            tooltips[] = {
                                "$STR_vehicle_default",
                                CSTRING(slingMode_helmet),
                                CSTRING(slingMode_helmetNVG),
                                CSTRING(slingMode_helmetFacewear)
                            };
                        };
                    };
                };
            };
        };

        class ButtonOK: ButtonOK {
            onSetFocus = QUOTE(call FUNC(ui_slingItems));
        };
        class ButtonCancel: ButtonCancel {};
    };
};
