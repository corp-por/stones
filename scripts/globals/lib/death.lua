-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:globals.lib.death'


-- temporary death solution so players aren't perma corpses
function Death.PlayerAutoResurrect(playerObj)
    playerObj:SystemMessage("You will be auto resurrected in the next 30 seconds.")
    CallFunctionDelayed(TimeSpan.FromSeconds(30), function()
        Death.End(playerObj, 0.5)
    end, playerObj.Id .. "Resurrect")
end

local _DeathInit = Death.Init
function Death.Init(mobileObj)
    _DeathInit(mobileObj)
    if ( mobileObj ~= nil and mobileObj:IsValid() and IsPlayerCharacter(mobileObj) and Death.Active(mobileObj) ) then
        Death.PlayerAutoResurrect(mobileObj)
    end
end

local _PlayerStart = Death.Player.Start
function Death.Player.Start(playerObj)
    _PlayerStart(playerObj)
    Death.PlayerAutoResurrect(playerObj)
end