-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
local Include = require 'core:commands.mortal.main'

Include.functions.GetSkill = function(id)

    if ( Skill[id] == nil ) then
        this:SystemMessage(string.format("%s is not a skill", id))
        return
    end

    local display = Skill[id].Display(this)
    this:SystemMessage("Your level in " .. display[1] .. " is " .. display[2])
end

Include.commands[#Include.commands + 1] = { "getskill", Include.functions.GetSkill, "<skill>", "Get the level of a skill", {"skill"} }

return Include