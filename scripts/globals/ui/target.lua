-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD
require 'core:globals.ui.target'

local _BuildTargetElement = BuildTargetElement
function BuildTargetElement(playerObj,targetObj)
    local dynamicWindow = _BuildTargetElement(playerObj, targetObj)

    if dynamicWindow == nil then return nil end

    if targetObj ~= nil and not IsPlayerCharacter(targetObj) then
        local level = AIProperty.GetLevel(Object.Template(targetObj))
        if ( level > 1 ) then
		    dynamicWindow:AddLabel(154,36,tostring(level),180,100,48,"right",false,true,"Bonfire_Dynamic")
        end
    end

    return dynamicWindow
end