-- Define the NPCs
local npc_lost_lover = CreateNPC("Sir Cedric", 12345, "Ironforge")
local npc_beloved = CreateNPC("Lady Evelyne", 67890, "Stormwind")

-- Quest Initialization
local quest_love_reunion = CreateQuest("Reuniting Lost Lovers", 54321)
quest_love_reunion:SetDescription("Help Sir Cedric find his lost love, Lady Evelyne.")
quest_love_reunion:SetObjective("Travel to Stormwind and deliver Cedric’s love letter to Evelyne.")

-- Quest Rewards
quest_love_reunion:SetRewards({
    {type = "title", name = "Champion of Love"},
    {type = "item", name = "Heartbound Cloak"},
    {type = "buff", name = "Love’s Blessing", duration = 3600}
})

-- Quest Completion Logic
function quest_love_reunion:OnComplete(player)
    SendChatMessage(player, "Sir Cedric and Lady Evelyne embrace, thanking you for reuniting them!")
    GiveReward(player, "Champion of Love")
end

-- Register the quest
RegisterQuest(quest_love_reunion)
