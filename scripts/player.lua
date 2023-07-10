-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

require 'core:player'

local _OnLoadedFromBackup = OnLoadedFromBackup
function OnLoadedFromBackup()
    _OnLoadedFromBackup()
    -- apply the spirit effect right away if necessary
    Effect.Apply(this, "Spirit")
end