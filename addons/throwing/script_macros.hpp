#define GRENADE_CLASS QEGVAR(throwing,helmetGrenade)

#define HAS_GRENADE(UNIT) (GRENADE_CLASS in ((throwables [ARR_2(UNIT,true)]) apply { _x select 0 }))
