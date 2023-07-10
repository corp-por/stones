-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

-- default 'template' when provided template is nil, or there's no item with a template
ItemProperties.fists = {
    Speed = 1,
    Damage = {2,5},
    Range = 0.625,
    DamageType = "Bashing"
}

ItemProperties.weapon_dagger = {
    Speed = 0.83,
    Damage = {5,10},
    Range = 2.0,
    DamageType = "Piercing",
    ImpactSound = "dagger",
}

ItemProperties.weapon_sword = {
    Speed = 0.5,
    Damage = {10,15},
    Range = 2.0,
    DamageType = "Slashing",
    ImpactSound = "sword",
}

ItemProperties.weapon_halberd = {
    Speed = 0.33,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Slashing",
    ImpactSound = "sword",
}

ItemProperties.weapon_great_axe = {
    Speed = 0.33,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Slashing",
    ImpactSound = "axe",
}

ItemProperties.weapon_hatchet = {
    Speed = 0.4,
    Damage = {10,15},
    Range = 2.0,
    DamageType = "Slashing",
    ImpactSound = "axe",
}

ItemProperties.weapon_warhammer = {
    Speed = 0.33,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Bashing",
    TwoHanded = true,
    ImpactSound = "warhammer"
}

ItemProperties.weapon_hammer_pick = {
    Speed = 0.5,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Bashing",
    ImpactSound = "axe"
}

ItemProperties.weapon_pick_axe = {
    Speed = 0.5,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Bashing",
    ImpactSound = "warhammer"
}

ItemProperties.weapon_quarterstaff = {
    Speed = 0.8,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Bashing",
    TwoHanded = true,
    ImpactSound = "staff"
}

ItemProperties.weapon_spear = {
    Speed = 0.6,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Piercing",
    TwoHanded = true,
    ImpactSound = "spear"
}

ItemProperties.weapon_pitchfork = {
    Speed = 0.33,
    Damage = {20,30},
    Range = 2.0,
    DamageType = "Piercing",
    TwoHanded = true,
    ImpactSound = "spear"
}

ItemProperties.weapon_bow = {
    Speed = 0.33,
    Damage = {20,30},
    Range = 10.0,
    DamageType = "Piercing",
    TwoHanded = true,
    ImpactSound = "bow"
}

-- items that go in the LeftHand slot are considered off hands and by default act as modifiers
ItemProperties.weapon_offhand_sword = {
    Speed = 0.1, -- a modifier of swing speed
    Damage = {0.75, 1.5}, -- a modifer of damage
    DamageType = "Slashing",
    ImpactSound = "sword",
}

