Here’s a **Lua script** for **matchmaking UI enhancements** in WoW Classic, integrating **interactive matchmaking profiles, leaderboards, and notifications**. This script allows players to **view matchmaking rankings, customize their matchmaking preferences, and receive matchmaking alerts**.

---

## **💖 Lua Script: Matchmaking UI Enhancements**
This script includes:
1️⃣ **Matchmaking Profile UI (Customizable Preferences)**  
2️⃣ **Interactive Matchmaking Leaderboard UI**  
3️⃣ **Matchmaking Notifications & Alerts**  

```lua
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
    local leaderboard = GetMatchmakingLeaderboard() -- Custom function to fetch leaderboard data
    player:SendBroadcastMessage("🏆 Matchmaking Leaderboard:")
    for i, entry in ipairs(leaderboard) do
        player:SendBroadcastMessage(i .. ". " .. entry.name .. " - Matches: " .. entry.matches)
    end
end

-- 🔔 Matchmaking Notifications & Alerts
function SendMatchmakingNotification(player, matchedPlayer)
    player:SendBroadcastMessage("💖 You’ve been matched with " .. matchedPlayer:GetName() .. "! Accept or decline?")
    local menu = CreateMenu()
    menu:AddOption("Accept Match", "AcceptMatch")
    menu:AddOption("Decline Match", "DeclineMatch")
    player:SendMenu(menu)
end

function AcceptMatch(player, matchedPlayer)
    player:SendBroadcastMessage("✨ You and " .. matchedPlayer:GetName() .. " are now matched! Adventure together for buffs.")
    ApplyEternalBondsBuff(player, matchedPlayer)
end

function DeclineMatch(player)
    player:SendBroadcastMessage("❌ You declined the matchmaking request. Try again later!")
end

-- ❤️ Eternal Bonds Buff (Passive Bonus for Matched Players)
function ApplyEternalBondsBuff(player1, player2)
    player1:AddAura(12345) -- Replace with actual buff spell ID
    player2:AddAura(12345)
    player1:SendBroadcastMessage("💖 You and " .. player2:GetName() .. " are now bound by Eternal Bonds! Quest together for stronger buffs.")
end

-- 🛡 Event Registration
RegisterUnitGossipEvent(1001, 1, "ShowMatchmakingProfile") -- Matchmaking profile UI
RegisterUnitGossipEvent(1002, 1, "ShowMatchmakingLeaderboard") -- Leaderboard UI
RegisterMatchmakingEvent("SendMatchmakingNotification", "SendMatchmakingNotification") -- Matchmaking notifications
RegisterMatchmakingEvent("AcceptMatch", "AcceptMatch") -- Accept matchmaking
RegisterMatchmakingEvent("DeclineMatch", "DeclineMatch") -- Decline matchmaking
```

---

### **🚀 What’s Included in This Lua Script?**
✅ **Matchmaking profile UI (customizable preferences)**  
✅ **Interactive matchmaking leaderboard UI**  
✅ **Matchmaking notifications & alerts**  
✅ **Eternal Bonds buff for matched players**  

Would you like **additional Lua scripts for matchmaking minigames** or **PvP matchmaking duels** next? 🚀💖✨
