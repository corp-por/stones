-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

Abilities.Fireball = {
    Mana = 2,
    Range = 25,

    CastTime = TimeSpan.FromSeconds(1),
    RequireCombatTarget = true,
    RequestTarget = true,

    Effect = "SpellProjectile",
    EffectArgs = {
        TravelTime = TimeSpan.FromSeconds(1),
        Damage = 7,
        ProjectileEffect = "Fireball",
        HitEffect = "FireballExplosion",
        Type = "Fire",
    },

    PreCast = function(mobileObj)
        mobileObj:PlayAnimation("castsummon2")
    end,

    PostCast = PostCastIdle,
}

Abilities.Wound = {
    RequiredMageryLevel = 1,
    Mana = 2,
    Range = 25,

    CastTime = TimeSpan.FromSeconds(1),
    RequireCombatTarget = true,
    RequestTarget = true,

    TargetEffect = "Wound",
    TargetEffectArgs = {},

    PreCast = function(mobileObj)
        mobileObj:PlayAnimation("castsummon1")
    end,

    PostCast = PostCastIdle,
}


Abilities.Energybolt = {
    RequiredMageryLevel = 5,
    Mana = 2,
    Range = 25,

    CastTime = TimeSpan.FromSeconds(3),
    RequireCombatTarget = true,
    RequestTarget = true,

    Effect = "SpellProjectile",
    EffectArgs = {
        TravelTime = TimeSpan.FromSeconds(0.5),
        Damage = 30,
        ProjectileEffect = "EnergyBolt",
        HitEffect = "EnergyBoltExplosion",
        Type = "Energy",
    },

    PreCast = function(mobileObj)
        mobileObj:PlayAnimation("castsummon2")
    end,

    PostCast = PostCastIdle,
}