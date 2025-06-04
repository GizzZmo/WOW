-- 💖 Matchmaking Profile UI
function ShowMatchmakingProfile(player)
    local menu = CreateMenu()
    menu:AddOption("I prefer PvE.", "PvE")
    menu:AddOption("I prefer PvP.", "PvP")
    menu:AddOption("I enjoy questing solo.", "Solo")
    menu:AddOption("I love group adventures.", "Party")
    menu:AddOption("Save Preferences", "SavePreferences")
    player:SendMenu(menu)
end

function SaveMatchmakingPreferences(player, choice)
    player:SetData("matchmaking_pref", choice)
    player:SendBroadcastMessage("✨ Your matchmaking preference has been saved: " .. choice)
end

-- 🏆 Interactive Matchmaking Leaderboard UI
function ShowMatchmakingLeaderboard(player)
    local leaderboard = GetMatchmakingLeaderboard()
    player:SendBroadcastMessage("🏆 Matchmaking Leaderboard:")
    for i, entry in ipairs(leaderboard) do
        player:SendBroadcastMessage(i .. ". " .. entry.name .. " - Matches: " .. entry.matches)
    end
end

-- 🏹 Cupid’s Archery Challenge: Target Practice Mini-Game
function CupidArchery_OnStart(player)
    player:SendBroadcastMessage("🏹 Welcome to Cupid’s Archery Challenge! Hit the enchanted targets to earn matchmaking points.")
    StartArcheryGame(player)
end

function StartArcheryGame(player)
    local targetsHit = 0
    local totalTargets = 5

    for i = 1, totalTargets do
        local target = SpawnGameObject(12345, player:GetLocation())
        target:SetOnHit(function()
            targetsHit = targetsHit + 1
            player:SendBroadcastMessage("🎯 You hit a target! Keep going!")
        end)
    end

    if targetsHit == totalTargets then
        player:SendBroadcastMessage("✨ You completed Cupid’s Archery Challenge! Matchmaking points awarded.")
        AwardMatchmakingPoints(player, 10)
    end
end

-- 🌿 Love’s Labyrinth: Maze Puzzle Mini-Game
function LovesLabyrinth_OnStart(player)
    player:SendBroadcastMessage("🌿 Welcome to Love’s Labyrinth! Navigate through the maze to reunite lost lovers.")
    StartMazeGame(player)
end

function StartMazeGame(player)
    local mazeCompleted = false

    function CheckMazeCompletion(player)
        if player:IsAtLocation(67890) then
            mazeCompleted = true
            player:SendBroadcastMessage("✨ You completed Love’s Labyrinth! Matchmaking rewards unlocked.")
            AwardMatchmakingPoints(player, 15)
        end
    end
end

-- 🛡 Love-Themed Dungeon Matchmaking
function DungeonMatchmaking_OnStart(player)
    local matchedPlayer = FindDungeonMatch(player)
    if matchedPlayer then
        player:SendBroadcastMessage("✨ You’ve been matched with " .. matchedPlayer:GetName() .. "! Enter the dungeon together for buffs.")
        ApplyEternalBondsBuff(player, matchedPlayer)
    else
        player:SendBroadcastMessage("😢 No match found at the moment. Try again later!")
    end
end

-- 💘 Love-Themed Dungeon Boss Mechanics
function LoveDungeonBoss_OnCombat(event, boss, target)
    boss:SendBroadcastMessage("💘 You dare challenge the Guardian of Love? Only true partners can defeat me!")
    target:AddAura(56789)
end

-- ❤️ Eternal Bonds Buff for Matched Players
function ApplyEternalBondsBuff(player1, player2)
    player1:AddAura(12345)
    player2:AddAura(12345)
    player1:SendBroadcastMessage("💖 You and " .. player2:GetName() .. " are now bound by Eternal Bonds! Work together for stronger buffs.")
end

-- 💖 Heartbound PvP Arena: Matchmaking Duels
function HeartboundArena_OnStart(player)
    player:SendBroadcastMessage("💖 Welcome to the Heartbound Arena! Duel your matched partner for honor and rewards.")
    StartMatchmakingDuel(player)
end

function StartMatchmakingDuel(player)
    local matchedPlayer = FindMatch(player)
    if matchedPlayer then
        player:SendBroadcastMessage("✨ Your duel partner is " .. matchedPlayer:GetName() .. "! Prepare for battle.")
        matchedPlayer:SendBroadcastMessage("✨ You’ve been matched with " .. player:GetName() .. "! Fight with honor.")
        ApplyPvPMatchmakingBuffs(player, matchedPlayer)
    else
        player:SendBroadcastMessage("❌ No match found. Try again later!")
    end
end

-- 🏹 Cupid’s Duel Mechanics (Love-Infused Combat Effects)
function CupidDuel_OnHit(attacker, target)
    if attacker:IsInPvPZone() then
        target:AddAura(98765)
        target:SendBroadcastMessage("💘 You’ve been struck by Cupid’s Arrow! Love clouds your senses for a moment.")
    end
end

-- 🏆 Heartbound Grand Tournament: Ranked PvP Matchmaking
function HeartboundTournament_OnStart(player)
    player:SendBroadcastMessage("💖 Welcome to the Heartbound Grand Tournament! Compete in ranked matchmaking battles for seasonal rewards.")
    StartMatchmakingTournament(player)
end

function StartMatchmakingTournament(player)
    local matchedPlayer = FindMatch(player)
    if matchedPlayer then
        player:SendBroadcastMessage("✨ Your tournament opponent is " .. matchedPlayer:GetName() .. "! Prepare for battle.")
        matchedPlayer:SendBroadcastMessage("✨ You’ve been matched with " .. player:GetName() .. "! Fight with honor.")
        ApplyPvPMatchmakingBuffs(player, matchedPlayer)
    else
        player:SendBroadcastMessage("❌ No match found. Try again later!")
    end
end

-- 🛡 Event Registration
RegisterUnitGossipEvent(1001, 1, "ShowMatchmakingProfile") -- Matchmaking profile UI
RegisterUnitGossipEvent(1002, 1, "ShowMatchmakingLeaderboard") -- Leaderboard UI
RegisterMinigameEvent("CupidArchery_OnStart", "CupidArchery_OnStart") -- Cupid’s Archery Challenge
RegisterMinigameEvent("LovesLabyrinth_OnStart", "LovesLabyrinth_OnStart") -- Love’s Labyrinth
RegisterDungeonMatchmakingEvent("DungeonMatchmaking_OnStart", "DungeonMatchmaking_OnStart") -- Dungeon matchmaking
RegisterBossCombatEvent("LoveDungeonBoss_OnCombat", "LoveDungeonBoss_OnCombat") -- Love-themed dungeon boss mechanics
RegisterPvPEvent("HeartboundArena_OnStart", "HeartboundArena_OnStart") -- Heartbound PvP Arena
RegisterPvPEvent("CupidDuel_OnHit", "CupidDuel_OnHit") -- Cupid’s Duel mechanics
RegisterPvPEvent("HeartboundTournament_OnStart", "HeartboundTournament_OnStart") -- Heartbound Grand Tournament matchmaking
