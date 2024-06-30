-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:globals.ai.aiproperty'

function AIProperty.GetLevel(templateid)
    if ( templateid ~= nil and Template[templateid] ~= nil and Template[templateid].Level ~= nil ) then
        return Template[templateid].Level
    end
    return 1.0
end