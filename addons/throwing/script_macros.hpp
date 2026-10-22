#define GRENADE_CLASS QEGVAR(throwing,helmetGrenade)

#define HAS_GRENADE(UNIT) (GRENADE_CLASS in ((throwables UNIT) apply { _x select 0 }))
