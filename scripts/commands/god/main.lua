-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
local Include = require 'core:commands.god.main'

Include.functions.SetSkill = function(id, level)
    if ( id == nil or level == nil ) then return end

    if ( Skill[id] == nil ) then
        this:SystemMessage(string.format("%s is not a skill", id))
        return
    end

    Skill[id].Set(this, level)

    local display = Skill[id].Display(this)
    this:SystemMessage(display[1] .. " set to " .. display[2])
end

Include.commands[#Include.commands + 1] = { "setskill", Include.functions.SetSkill, "<skill>", "Set the level of a skill", {} }

return Include