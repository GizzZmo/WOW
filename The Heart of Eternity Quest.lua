-- Define the NPCs
local npc_love_spirit = CreateNPC("Elyndra, Spirit of Eternal Love", 98765, "Moonglade")
local npc_quest_giver = CreateNPC("High Priestess Selene", 54321, "Stormwind Cathedral")

-- Quest Initialization
local quest_heart_eternity = CreateQuest("The Heart of Eternity", 112233)
quest_heart_eternity:SetDescription("Gather the lost relics of love and awaken Elyndra, the Spirit of Eternal Love.")
quest_heart_eternity:SetObjective("Find the three enchanted relics hidden across Azeroth.")

-- Define the relics
local relics = {
    {name = "Moonlit Rose", location = "Teldrassil"},
    {name = "Crimson Heartstone", location = "Blackrock Depths"},
    {name = "Whispering Veil", location = "Tanaris"}
}

-- Quest Progression
function quest_heart_eternity:OnStart(player)
    SendChatMessage(player, "High Priestess Selene whispers: 'The Spirit of Eternal Love sleeps, waiting for the relics to be reunited. Seek them across Azeroth.'")
end

function quest_heart_eternity:OnCollectRelic(player, relic)
    SendChatMessage(player, "You feel a warm glow as you hold the " .. relic.name .. ". Love’s essence stirs within.")
end

function quest_heart_eternity:OnComplete(player)
    SendChatMessage(player, "Elyndra awakens, her voice echoing through the land: 'Love is eternal, and so is your bond with Azeroth.'")
    GiveReward(player, "Heartbound Cloak")
    GiveBuff(player, "Eternal Love’s Blessing", 7200)
end

-- Register the quest
RegisterQuest(quest_heart_eternity)
