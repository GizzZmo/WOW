Here’s a **Lua script** for **love-themed matchmaking duels** in WoW Classic! This script introduces **Heartbound Arena**, where matched players can **duel for honor, buffs, and seasonal matchmaking rewards**.

---

## **💖 Lua Script: Love-Themed Matchmaking Duels**
This script includes:
1️⃣ **Heartbound Arena matchmaking system**  
2️⃣ **PvP matchmaking buffs for bonded players**  
3️⃣ **Cupid’s Duel mechanics (love-infused combat effects)**  
4️⃣ **Seasonal matchmaking duel rewards**  

```lua
-- 💖 Heartbound Arena Matchmaking System
function HeartboundArena_OnStart(player)
    player:SendBroadcastMessage("💖 Welcome to the Heartbound Arena! Duel your matched partner for honor and rewards.")
    StartMatchmakingDuel(player)
end

function StartMatchmakingDuel(player)
    local matchedPlayer = FindMatch(player) -- Custom matchmaking function
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
        target:AddAura(98765) -- Example charm effect
        target:SendBroadcastMessage("💘 You’ve been struck by Cupid’s Arrow! Love clouds your senses for a moment.")
    end
end

-- ❤️ PvP Matchmaking Buffs for Bonded Players
function ApplyPvPMatchmakingBuffs(player1, player2)
    player1:AddAura(56789) -- Example PvP buff
    player2:AddAura(56789)
    player1:SendBroadcastMessage("🔥 Your bond strengthens in battle! Fight together for enhanced matchmaking rewards.")
end

-- 🎁 Seasonal Matchmaking Duel Rewards
function AwardMatchmakingDuelRewards(player)
    player:SendBroadcastMessage("🏆 You’ve won a matchmaking duel! Seasonal rewards unlocked.")
    player:AddItem(12345) -- Example matchmaking reward item
end

-- 🛡 Event Registration
RegisterPvPEvent("HeartboundArena_OnStart", "HeartboundArena_OnStart") -- Heartbound Arena matchmaking
RegisterCombatEvent("CupidDuel_OnHit", "CupidDuel_OnHit") -- Cupid’s Duel mechanics
RegisterPvPEvent("AwardMatchmakingDuelRewards", "AwardMatchmakingDuelRewards") -- Seasonal matchmaking duel rewards
```

---

### **🚀 What’s Included in This Lua Script?**
✅ **Heartbound Arena matchmaking system**  
✅ **PvP matchmaking buffs for bonded players**  
✅ **Cupid’s Duel mechanics (love-infused combat effects)**  
✅ **Seasonal matchmaking duel rewards**  

Would you like **additional Lua scripts for matchmaking battlegrounds** or **love-themed PvP tournaments** next? 🚀💖✨
