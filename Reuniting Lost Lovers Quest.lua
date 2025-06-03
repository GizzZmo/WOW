--[[
    Reuniting Lost Lovers Quest
    Version: 1.1
    Author: GizzZmo
    Description: Help Sir Cedric find his lost love, Lady Evelyne, in this dynamic quest.
]]

-- Utility function to safely create an NPC with error checking
local function SafeCreateNPC(name, id, location)
    local npc = CreateNPC(name, id, location)
    if not npc then
        error("Failed to create NPC: " .. name)
    end
    return npc
end

-- Utility function to safely create a quest
local function SafeCreateQuest(title, id, description, objective, rewards)
    local quest = CreateQuest(title, id)
    if not quest then
        error("Failed to create quest: " .. title)
    end
    quest:SetDescription(description)
    quest:SetObjective(objective)
    quest:SetRewards(rewards)
    return quest
end

-- Dynamic dialogue options for more immersive NPC interaction
local cedric_dialogues = {
    "Have you seen my beloved Lady Evelyne?",
    "My heart aches for the one I lost...",
    "Can you help me deliver this letter to Stormwind?"
}
local evelyne_dialogues = {
    "A letter for me? From Sir Cedric?",
    "I wondered if he'd ever reach out again...",
    "Thank you, brave soul, for reuniting us."
}

local function GetRandomLine(dialogues)
    return dialogues[math.random(#dialogues)]
end

-- Create NPCs with error handling
local npc_cedric = SafeCreateNPC("Sir Cedric", 12345, "Ironforge")
local npc_evelyne = SafeCreateNPC("Lady Evelyne", 67890, "Stormwind")

-- Define quest details
local quest_id = 54321
local quest_title = "Reuniting Lost Lovers"
local quest_description = "Help Sir Cedric find his lost love, Lady Evelyne."
local quest_objective = "Travel to Stormwind and deliver Cedric’s love letter to Evelyne."
local rewards = {
    {type = "title", name = "Champion of Love"},
    {type = "item", name = "Heartbound Cloak"},
    {type = "buff", name = "Love’s Blessing", duration = 3600}
}

-- Create and register the quest
local quest_love_reunion = SafeCreateQuest(
    quest_title, quest_id, quest_description, quest_objective, rewards
)

-- Enhanced quest completion logic with dynamic feedback
function quest_love_reunion:OnComplete(player)
    local message = string.format(
        "As you deliver the letter, Lady Evelyne's eyes well up with tears. Sir Cedric rushes to embrace her. %s %s\nYou are hailed as the Champion of Love!",
        GetRandomLine(cedric_dialogues),
        GetRandomLine(evelyne_dialogues)
    )
    SendChatMessage(player, message)
    -- Visual or sound effect could be triggered here if API allows
    GiveReward(player, "Champion of Love")
end

-- Register the quest in the system
RegisterQuest(quest_love_reunion)

--[[
    CHANGELOG
    v1.1: Refactored for modularity, added dynamic dialogue, improved error handling, and documentation.
    v1.0: Initial version.
]]
