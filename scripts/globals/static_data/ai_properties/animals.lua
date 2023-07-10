-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

-- define the 'combat' properties for the ai via ItemProperties. This doesn't need to be a real XML or even ever created.
AIProperties.cat = {
    Level = 1,
    TeamType = "Animal",
    Weapon = {
        Speed = 4,
        Damage = {1,2},
        Range = 1.35,
        DamageType = "Slashing"
    },
    Stats = {
        Health = 5,
    },
    Loot = {

    }
}

AIProperties.cow = {
    Level = 1,
    TeamType = "Animal",
    Weapon = {
        Speed = 4,
        Damage = {1,2},
        Range = 1.35,
        DamageType = "Slashing"
    },
    Stats = {
        Health = 10,
    },
    Loot = {

    }
}