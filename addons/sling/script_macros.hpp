// These use E variants so they can be reused by other addons
#define GET_SLUNG_ITEMS(UNIT) (UNIT call EFUNC(sling,getSlungItems))
#define GET_SLUNG_HOLDERS(UNIT) (UNIT call EGVAR(sling,slungHolders))

#define SLING_MODE_DEFAULT 0
#define SLING_MODE_HELMET 1
#define SLING_MODE_HELMET_NVG 2
#define SLING_MODE_HELMET_FACEWEAR 3
