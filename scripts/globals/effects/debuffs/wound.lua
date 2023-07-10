-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD


Effects.Wound = {
    Debuff = true,
    -- icon of effect (optional)
    Icon = "SpellBook05_103",
    -- display name of icon, if not set will use effect name
    DisplayName = "Wounded.",
    -- tool tip to display on icon (optional)
    Tooltip = "Wounded, taking damage over time.",
    -- total duration of this effect (optional)
    Duration = TimeSpan.FromSeconds(20),
    -- how many times should this pulse? (optional)
    Pulse = 5,
    
    -- should this effect remain after a player and re-logged?
    PersistSession = true,
    -- should this effect remain on death?
    PersistDeath = false,

    -- handle starting the effect, returning false means the effect failed to start
    OnStart = function(self)
        if ( self.Target ~= nil and self.Target:IsValid() ) then
            self.Target:PlayAnimation("castattack1")
        end

        --Effects.Wound.OnPulse(self)

        return true
    end,

    -- on pulse will be called each pulse if Pulse is specified
    OnPulse = function(self)
        self.Parent:SendMessage("Damage", self.Target, 1, "Magic")
    end,

    -- called when effect has ended and been removed
    OnStop = function(self, canceled)
    end,
}