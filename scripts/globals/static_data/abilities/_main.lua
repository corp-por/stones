-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:globals.static_data.abilities._main'

function PostCastIdle(mobileObj, cancelled)
    mobileObj:PlayAnimation("idle")
end

require 'globals.static_data.abilities.spells'