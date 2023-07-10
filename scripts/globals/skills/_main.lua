-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

Skill = {}

function ForeachSkill(cb)
    if ( cb ~= nil ) then
        for id,skill in pairs(Skill) do
            cb(id)
        end
    end
end

function NewSkill(name)

    local self = {
        ID = name,
        DisplayName = name,
        GainFactor = 0.1,
    }

    local function _validate(mobileObj)
        if ( mobileObj == nil ) then
            LuaDebugCallStack("[Skill Validate] nil mobileObj provided")
            return false
        end
        if not( mobileObj:IsValid() ) then
            LuaDebugCallStack("[Skill Validate] invalid mobileObj provided")
            return false
        end
        return true
    end

    function self.Get(mobileObj)
        if not( _validate(mobileObj) ) then return 0 end
        if not( IsPlayerCharacter(mobileObj) ) then
            return AIProperty.GetLevel(mobileObj:GetCreationTemplateId())
        end
        return ((Var.Get(mobileObj, "Skills") or {})[self.ID] or {0.0})[1]
    end

    function self.DisplayValue(mobileObj)
        return math.round(self.Get(mobileObj), 4)
    end

    function self.Set(mobileObj, val)
        if not( _validate(mobileObj) ) then return end
        local skills = Var.Get(mobileObj, "Skills") or {}
        if not( skills[self.ID] ) then skills[self.ID] = {} end
        skills[self.ID][1] = val
        Var.Set(mobileObj, "Skills", skills)
    end

    function self.TryGainAgainst(mobileObj, gameObj)
        local targetLevel = self.Get(gameObj)
        return self.TryGain(mobileObj, targetLevel)
    end

    function self.Display(mobileObj)
        return {self.DisplayName, self.DisplayValue(mobileObj)}
    end

    function self.TryGain(mobileObj, againstLevel, adjustment)
        local skill = self.Get(mobileObj)

        if ( skill >= 100.0 ) then return false end

        if ( againstLevel < skill - 25 or againstLevel > skill + 25 ) then
            return false
        end

        local ratio1 = 1.0 - (math.abs(againstLevel - skill) / 25)
        local ratio2 = 1.0 - (skill / 120.0)

        local amount = self.GainFactor * ( (ratio1 + ratio2) / 2 )

        -- the adjustment is useful for faster gains with slow weapons and slower gains with faster weapons
        if ( adjustment ~= nil ) then
            amount = amount * adjustment
        end

        local new_level = self.Get(mobileObj) + amount
        if ( new_level > 100 ) then new_level = 100.0 end
        self.Set(mobileObj, new_level)

        if ( math.floor(new_level) > math.floor(skill) ) then
            mobileObj:SystemMessage(self.DisplayName .. ": " .. self.DisplayValue(mobileObj))
        end

        return true
    end
    
    Skill[self.ID] = self
end

-- take the initial list of skills (that's formated for our viewing pleasure) and turn it into real usable functions
function InitializeAllSkills()
    for id,data in pairs(Skill) do
        NewSkill(id)
        for k,v in pairs(data) do
            Skill[id][k] = v
        end
    end
end

require 'globals.skills.skills'