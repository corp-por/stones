-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:globals.ai.aiproperty'

function AIProperty.GetLevel(template)
    if ( template ~= nil and AIProperties[template] ~= nil and AIProperties[template].Level ~= nil ) then
        return AIProperties[template].Level
    end
    return 1.0
end