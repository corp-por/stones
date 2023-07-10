-- SPDX-License-Identifier: AGPL-3.0-only
-- Copyright © 2023 Corp Por LTD

--- At the bottom, all skills are initialized and this table is transformed into a usable skill system

-- combat
Skill.Melee = {}

Skill.Tactics = {}

Skill.Spirit = {
    GainFactor = 0.33
}

Skill.Magery = {}

Skill.EvalInt = {
    DisplayName = "Evaluating Intelligence (EvalInt)"
}

InitializeAllSkills()