-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:inc.damage'

local _OnDamageReceived = OnDamageReceived
function OnDamageReceived(from, amount, damageType)
    -- call the default function
    _OnDamageReceived(from, amount, damageType)
    
    if ( _IS_PLAYER == true ) then
        -- apply the effect
        Effect.Apply(this, "Spirit")
    end
end