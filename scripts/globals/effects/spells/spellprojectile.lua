-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD


Effects.SpellProjectile = {

    -- handle starting the effect, returning false means the effect failed to start
    OnStart = function(self)
        if ( self.Target == nil or not self.Target:IsValid() ) then
            return false
        end

        self.Parent:PlayAnimation("castattack1")

        -- increase damage by skill
        self.Damage = self.Damage * (Skill.EvalInt.Get(self.Parent) / 100.0)
        -- increase damage by mod
        self.Damage = Modify.Apply(self.Parent, "ElementalTo", self.Damage or 1)

        -- play effect, with delayed damage
        local distance = self.Parent:DistanceFrom(self.Target)
        local travelTime = ( distance - 0.5 ) / ( self.Velocity or 10 )
        if ( travelTime <= 0 ) then
            travelTime = 0.1
        end

        if ( self.ReleaseSound ~= nil ) then
            self.Parent:PlayObjectSound(self.ReleaseSound)
        end

        local id = uuid()
        self.Parent:PlayProjectileEffectTo(
            self.ProjectileEffect or "Arrow",
            self.Target,
            travelTime
        )
        RegisterSingleEventHandler(EventType.Timer, id, function()
            if ( self.Target:IsValid() ) then
                --if not( Resisted(target, self.ParentObj) ) then
                    self.Target:SendMessage("Damage", self.Parent, self.Damage, self.Type or "Fire")
                    if ( self.HitSound ) then
                        self.Parent:PlayObjectSound(self.HitSound)
                    end
                    if ( self.HitEffect ) then
                        self.Target:PlayEffect(self.HitEffect)
                    end
                    Skill.EvalInt.TryGainAgainst(self.Parent, self.Target)
                    Skill.Magery.TryGainAgainst(self.Parent, self.Target)
                --end
            end
        end)
        self.Parent:ScheduleTimerDelay(TimeSpan.FromSeconds(travelTime), id)

        Effect.EndSelf(self)

        return true
    end,
}