class CfgAmmo {
    // IR strobes are used because shotNVGMarker simulation will collide with units
    class IRStrobeBase;
    class B_IRStrobe: IRStrobeBase {
        class NVGMarkers {
            class Blinking1;
        };
    };
    class GVAR(helmetGrenade_ammo): B_IRStrobe {
        model = "\A3\Weapons_f\empty.p3d";
        class NVGMarkers: NVGMarkers {
            class Blinking1: Blinking1 {
                blinking = 0;
                brightness = 0;
            };
        };
    };
};
