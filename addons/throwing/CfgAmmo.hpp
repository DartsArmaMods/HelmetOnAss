class CfgAmmo {
    // IR strobes are used because shotNVGMarker simulation will collide with units
    class IRStrobeBase;
    class GVAR(helmetGrenade_ammo): IRStrobeBase {
        class NVGMarkers {};
    };
};
