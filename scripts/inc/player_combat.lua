-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:inc.player_combat'

local _ExecuteHitAction = ExecuteHitAction
function ExecuteHitAction(target)
    _ExecuteHitAction(target)
    Skill.Melee.TryGainAgainst(this, target)
    Skill.Tactics.TryGainAgainst(this, target)
end

local _ExecuteMissAction = ExecuteMissAction
function ExecuteMissAction(target)
    _ExecuteMissAction(target)
    Skill.Melee.TryGainAgainst(this, target)
end

function CheckHitSuccess(target)
    local chance = (Skill.Melee.Get(this) or 1) / (Skill.Melee.Get(target) or 1)
	return Success(chance)
end

local _CalculateHitDamage = CalculateHitDamage
function CalculateHitDamage(target)
    return _CalculateHitDamage(target) * (Skill.Tactics.Get(this) / 100.0)
end