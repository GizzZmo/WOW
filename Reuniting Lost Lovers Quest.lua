-- Utility function to create love quest
function create_love_quest(npc1, npc2, quest_id, description, objective, rewards)
    local quest = CreateQuest("Reuniting Lost Lovers", quest_id)
    quest:SetDescription(description)
    quest:SetObjective(objective)
    quest:SetRewards(rewards)
    return quest
end

-- Use the utility function
local quest_love_reunion = create_love_quest(
    "Sir Cedric", "Lady Evelyne", 54321,
    "Help Sir Cedric find his lost love, Lady Evelyne.",
    "Travel to Stormwind and deliver Cedric’s love letter to Evelyne.",
    {
        {type = "title", name = "Champion of Love"},
        {type = "item", name = "Heartbound Cloak"},
        {type = "buff", name = "Love’s Blessing", duration = 3600}
    }
)
