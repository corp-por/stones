-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD


Effects.Spirit = {
    -- icon of effect (optional)
    Icon = "SpellBook02_116",
    -- display name of icon, if not set will use effect name
    DisplayName = "Healing",
    -- tool tip to display on icon (optional)
    --Tooltip = "Repeat a phrase over and over.",
    -- optional tooltip function
    --OnTooltip = function(self)
        --return ""
    --end,
    -- total duration of this effect (optional)
    Duration = TimeSpan.FromSeconds(9),

    -- handle starting the effect, returning false means the effect failed to start
    OnStart = function(self)
        if ( Death.Active(self.Parent) or Stat.Health.Percent(self.Parent) > 0.95 ) then return false end
        return true
    end,

    -- called when effect has ended and been removed
    OnStop = function(self, canceled)
        if not( canceled ) then
            if ( Effect.Has(self.Parent, "Wound") ) then
                Effect.End(self.Parent, "Wound")
            else
                -- heal ourselves
                local baseHeal = 10
                local healAmount = baseHeal + math.round( Skill.Spirit.Get(self.Parent) * 0.5 )
                Stat.Health.Delta(self.Parent, healAmount)
                self.Parent:PlayEffect("HealEffect")
            end

            -- do a skill gain against our own level
            Skill.Spirit.TryGainAgainst(self.Parent, self.Parent)
        end
        Effect.Apply(self.Parent, "Spirit")
    end,
}