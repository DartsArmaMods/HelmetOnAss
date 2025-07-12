class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscText;
class RscListBox;

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content: RscControlsGroup {
            class controls;
        };
        class ButtonOK;
        class ButtonCancel;
    };
};

class GVAR(RscSlingHelmet): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RscSlingHelmet))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RscSlingHelmet))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class SlingHelmet: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(call FUNC(ui_slingHelmet));
                    idc = IDC_SLING_HELMET;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(6.2));
                    class controls {
                        class PositionLabel: RscText {
                            idc = -1;
                            text = ECSTRING(sling,slungHelmetPosition_name);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Position: RscListBox {
                            idc = IDC_SLING_HELMET_POSITION;
                            x = QUOTE(W_PART(10.1));
                            y = 0;
                            w = QUOTE(W_PART(26));
                            h = QUOTE(H_PART(6));
                            class Items {};
                        };
                    };
                };
            };
        };

        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
