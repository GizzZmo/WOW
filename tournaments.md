Here’s a **Lua script** for **love-themed PvP tournaments** in WoW Classic! This script introduces **Heartbound Tournament**, where matched players **compete in ranked matchmaking battles for seasonal rewards**.

---

## **💖 Lua Script: Love-Themed PvP Tournament System**
This script includes:
1️⃣ **Heartbound Tournament matchmaking system**  
2️⃣ **PvP matchmaking buffs for bonded players**  
3️⃣ **Tournament ranking & seasonal rewards**  
4️⃣ **Cupid’s Duel mechanics (love-infused combat effects)**  

```lua
-- 💖 Heartbound Tournament Matchmaking System
function HeartboundTournament_OnStart(player)
    player:SendBroadcastMessage("💖 Welcome to the Heartbound Tournament! Compete in ranked matchmaking battles for seasonal rewards.")
    StartMatchmakingTournament(player)
end

function StartMatchmakingTournament(player)
    local matchedPlayer = FindMatch(player) -- Custom matchmaking function
    if matchedPlayer then
        player:SendBroadcastMessage("✨ Your tournament opponent is " .. matchedPlayer:GetName() .. "! Prepare for battle.")
        matchedPlayer:SendBroadcastMessage("✨ You’ve been matched with " .. player:GetName() .. "! Fight with honor.")
        ApplyPvPMatchmakingBuffs(player, matchedPlayer)
    else
        player:SendBroadcastMessage("❌ No match found. Try again later!")
    end
end

-- 🏹 Cupid’s Duel Mechanics (Love-Infused Combat Effects)
function CupidDuel_OnHit(attacker, target)
    if attacker:IsInPvPZone() then
        target:AddAura(98765) -- Example charm effect
        target:SendBroadcastMessage("💘 You’ve been struck by Cupid’s Arrow! Love clouds your senses for a moment.")
    end
end

-- ❤️ PvP Matchmaking Buffs for Tournament Players
function ApplyPvPMatchmakingBuffs(player1, player2)
    player1:AddAura(56789) -- Example PvP buff
    player2:AddAura(56789)
    player1:SendBroadcastMessage("🔥 Your bond strengthens in battle! Fight together for enhanced matchmaking rewards.")
end

-- 🏆 Tournament Ranking & Seasonal Rewards
function AwardMatchmakingTournamentRewards(player)
    player:SendBroadcastMessage("🏆 You’ve won a matchmaking tournament battle! Seasonal rewards unlocked.")
    player:AddItem(12345) -- Example matchmaking reward item
end

-- 🛡 Event Registration
RegisterPvPEvent("HeartboundTournament_OnStart", "HeartboundTournament_OnStart") -- Heartbound Tournament matchmaking
RegisterCombatEvent("CupidDuel_OnHit", "CupidDuel_OnHit") -- Cupid’s Duel mechanics
RegisterPvPEvent("AwardMatchmakingTournamentRewards", "AwardMatchmakingTournamentRewards") -- Seasonal matchmaking tournament rewards
```

---

### **🚀 What’s Included in This Lua Script?**
✅ **Heartbound Tournament matchmaking system**  
✅ **PvP matchmaking buffs for bonded players**  
✅ **Tournament ranking & seasonal rewards**  
✅ **Cupid’s Duel mechanics (love-infused combat effects)**  

Would you like **additional Lua scripts for matchmaking raid mechanics** or **love-themed PvP battleground expansions** next? 🚀💖✨
