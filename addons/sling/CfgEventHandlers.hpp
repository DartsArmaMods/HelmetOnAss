class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_GetInMan_EventHandlers {
    class CAManBase {
        class ADDON {
            getInMan = QUOTE(call FUNC(handleGetInMan));
        };
    };
};

class Extended_GetOutMan_EventHandlers {
    class CAManBase {
        class ADDON {
            getOutMan = QUOTE(call FUNC(handleGetOutMan));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call FUNC(handleRespawn));
        };
    };
};

class Extended_Deleted_EventHandlers {
    class CAManBase {
        class ADDON {
            deleted = QUOTE(call FUNC(handleDeleted));
        };
    };
};