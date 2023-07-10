-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:globals.lib.ability'


function Ability.Hook.Perform(playerObj, targetObj, ability, castComplete, abilityData, isPlayer)

    if ( isPlayer and abilityData.RequiredMageryLevel ~= nil and Skill.Magery.Get(playerObj) < abilityData.RequiredMageryLevel ) then
        return Ability.Error("Requires Magery level of "..abilityData.RequiredMageryLevel.." to cast.", playerObj, isPlayer)
    end

    return true
end