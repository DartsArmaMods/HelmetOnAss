class CfgAmmo {
    // IR strobes are used because shotNVGMarker simulation will collide with units
    class GrenadeCore;
    class IRStrobeBase: GrenadeCore {
        class NVGMarkers {
            class Blinking1;
        };
    };
    class GVAR(helmetGrenade_ammo): IRStrobeBase {
        class NVGMarkers: NVGMarkers {
            class Blinking1: Blinking1 {
                blinking = 0;
                brightness = 0;
            };
        };
    };
};
