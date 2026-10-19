// These use E variants so they can be reused by other addons
#define GET_SLUNG_ITEMS(UNIT) (UNIT call EFUNC(sling,getSlungItems))
#define GET_SLUNG_HOLDERS(UNIT) (UNIT call EGVAR(sling,slungHolders))
