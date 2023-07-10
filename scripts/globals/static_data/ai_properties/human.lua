-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

-- define the 'combat' properties for the ai via ItemProperties. This doesn't need to be a real XML or even ever created.
AIProperties.paladin_knight = {
    TeamType = "Human",
    Weapon = {
        Speed = 1.25,
        Damage = {4,12},
        Range = 1.35,
        DamageType = "Slashing"
    },
    Stats = {
        Health = 50,
    },
    Abilities = {
        "Energybolt"
    },
    Loot = {

    }
}