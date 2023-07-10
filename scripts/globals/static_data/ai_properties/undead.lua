-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

AIProperties.skeleton = {
    Level = 20,
    TeamType = "Undead",
    -- this table is in the exact format of item properites and you could assign an item propery to the weapon if you choose.
    -- ex:
    -- Weapon = ItemProperties.weapon_sword
    Weapon = {
        Speed = 0.4,
        Damage = {3,7},
        Range = 1.25,
        DamageType = "Bashing"
    },
    Stats = {
        Health = 40,
    },
    Loot = {
        {"gold", {-5,5}},
        "scroll_of_fireball"
    },
    BaseMoveSpeed = 4.0,
}

AIProperties.skeleton_wizard = {
    Level = 40,
    TeamType = "Undead",
    Weapon = {
        Speed = 0.4,
        Damage = {7,9},
        Range = 1.25,
        DamageType = "Bashing"
    },
    Stats = {
        Health = 60,
    },
    Abilities = {
        "Fireball",
        "Energybolt"
    },
    Loot = {
        {"gold", {6,15}},
        "scroll_of_energybolt"
    },
    BaseMoveSpeed = 4.0,
}

AIProperties.lich = {
    Level = 80,
    TeamType = "Undead",
    Weapon = {
        Speed = 0.4,
        Damage = {24,26},
        Range = 1.25,
        DamageType = "Bashing"
    },
    Stats = {
        Health = 120,
    },
    Abilities = {
        "Fireball",
        "Energybolt"
    },
    Loot = {
        {"gold", {50,70}},
        "scroll_of_energybolt"
    },
    BaseMoveSpeed = 4.0,
}