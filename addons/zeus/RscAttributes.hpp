class RscControlsGroupNoScrollbars;
class RscText;
class RscListBox;

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content;
        class ButtonOK;
        class ButtonCancel;
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
                class SlingItems: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(call FUNC(ui_slingItems));
                    idc = IDC_SLING_ITEMS;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(6.2));
                    class controls {
                        class PositionLabel: RscText {
                            idc = 99;
                            text = ECSTRING(sling,slungItemsPosition_name);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class Position: RscListBox {
                            idc = 100;
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
