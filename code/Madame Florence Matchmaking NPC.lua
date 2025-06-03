-- 💖 Madame Florence Matchmaking NPC

-- Utility for logging
function LogEvent(event, details)
    print("[Matchmaking][" .. event .. "] " .. details)
end

-- Handles player interaction with Madame Florence
function Matchmaking_OnGossip(unit, player)
    player:SendBroadcastMessage("💖 Welcome to Eternal Bonds matchmaking! Answer a few questions to find your perfect match.")
    Matchmaking_ShowQuestions(player)
end

-- Creates the matchmaking questionnaire menu
function CreateMatchmakingMenu()
    local menu = CreateMenu()
    menu:AddOption("I prefer PvE.", "PvE")
    menu:AddOption("I prefer PvP.", "PvP")
    menu:AddOption("I enjoy questing solo.", "Solo")
    menu:AddOption("I love group adventures.", "Party")
    menu:AddOption("I’m a hardcore raider.", "Raider")
    menu:AddOption("I like casual exploration.", "Explorer")
    menu:AddOption("I’m interested in cross-faction friendships.", "CrossFaction")
    return menu
end

function Matchmaking_ShowQuestions(player)
    player:SendBroadcastMessage("🕑 Loading matchmaking questionnaire...")
    player:SendMenu(CreateMatchmakingMenu())
end

-- Finds a compatible match for the player
function Matchmaking_FindMatch(player)
    if not player then
        LogEvent("Error", "player is nil in FindMatch")
        return nil
    end
    local matchedPlayer = MatchmakingDatabaseQuery(player)
    if not matchedPlayer then
        LogEvent("MatchFail", player:GetName() .. " found no match")
    end
    return matchedPlayer
end

-- Applies the Eternal Bonds buff, scaling by player level
function Matchmaking_ApplyBuff(player1, player2)
    local level = math.max(player1:GetLevel(), player2:GetLevel())
    local buffId = 12345 -- Or scale based on level/relationship
    player1:AddAura(buffId)
    player2:AddAura(buffId)
    player1:SendBroadcastMessage("💖 You and " .. player2:GetName() .. " are now bound by Eternal Bonds! Quest together for stronger buffs.")
    LogEvent("BuffApplied", player1:GetName() .. " & " .. player2:GetName())
end

-- Main matchmaking result logic with lore
function Matchmaking_Result(player)
    local matchedPlayer = Matchmaking_FindMatch(player)
    if matchedPlayer then
        player:SendBroadcastMessage("✨ Your perfect match is " .. matchedPlayer:GetName() .. "! Adventure together for buffs. 💖")
        Matchmaking_ApplyBuff(player, matchedPlayer)
        LogEvent("MatchSuccess", player:GetName() .. " matched with " .. matchedPlayer:GetName())
    else
        player:SendBroadcastMessage("😢 No match found at the moment. Try again later! Madame Florence whispers: 'Love is patient, dear...'")
    end
end

-- Register events
RegisterUnitGossipEvent(1001, 1, "Matchmaking_OnGossip")
