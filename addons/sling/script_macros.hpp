// These use E variants so they can be reused by other addons
#define VAR_SLUNG_ITEMS QEGVAR(sling,slungItems)
#define VAR_SLUNG_HOLDERS QEGVAR(sling,slungHolders)
#define VAR_HIDE_SLUNG_HOLDERS QEGVAR(sling,hideSlungHolders)

#define GET_SLUNG_ITEMS(UNIT) (UNIT call EFUNC(sling,getSlungItems))
#define GET_SLUNG_HOLDERS(UNIT) (UNIT getVariable [VAR_SLUNG_HOLDERS, []])

#define ACTION_EXCEPTIONS "isNotSitting", "isNotSwimming"

#define SLING_MODE_DEFAULT 0
#define SLING_MODE_HELMET 1
#define SLING_MODE_HELMET_NVG 2
#define SLING_MODE_HELMET_FACEWEAR 3
