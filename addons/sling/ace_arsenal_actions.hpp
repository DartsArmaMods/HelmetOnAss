class ace_arsenal_actions {
    class GVAR(slingItems) {
        displayName = QUOTE(MOD_NAME);
        condition = "true";
        scopeEditor = 2;
        updateOnCargoChanged = 0;
        tabs[] = {6, 7, 8};
        class button {
            label = CSTRING(slingItems_name);
            condition = "true";
            statement = QUOTE(call FUNC(buttonSling));
        };
    };
};
