Here’s a **Lua script** for **love-themed matchmaking minigames** in WoW Classic! This script introduces **Cupid’s Archery Challenge, Heartstring Harmony, and Love’s Labyrinth**, allowing players to engage in matchmaking-based mini-games.

---

## **💖 Lua Script: Love-Themed Matchmaking Minigames**
This script includes:
1️⃣ **Cupid’s Archery Challenge (Target Practice Mini-Game)**  
2️⃣ **Heartstring Harmony (Musical Rhythm Mini-Game)**  
3️⃣ **Love’s Labyrinth (Maze Puzzle Mini-Game)**  

```lua
-- 🏹 Cupid’s Archery Challenge: Target Practice Mini-Game
function CupidArchery_OnStart(player)
    player:SendBroadcastMessage("🏹 Welcome to Cupid’s Archery Challenge! Hit the enchanted targets to earn matchmaking points.")
    StartArcheryGame(player)
end

function StartArcheryGame(player)
    local targetsHit = 0
    local totalTargets = 5

    for i = 1, totalTargets do
        local target = SpawnGameObject(12345, player:GetLocation()) -- Example target object ID
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

-- 🎼 Heartstring Harmony: Musical Rhythm Mini-Game
function HeartstringHarmony_OnStart(player)
    player:SendBroadcastMessage("🎼 Welcome to Heartstring Harmony! Play the correct notes to unlock matchmaking buffs.")
    StartMusicGame(player)
end

function StartMusicGame(player)
    local correctSequence = {"C", "D", "E", "F", "G"}
    local playerSequence = {}

    function PlayNote(note)
        table.insert(playerSequence, note)
        if #playerSequence == #correctSequence then
            if table.concat(playerSequence) == table.concat(correctSequence) then
                player:SendBroadcastMessage("✨ Perfect harmony! Matchmaking buff applied.")
                ApplyMatchmakingBuff(player)
            else
                player:SendBroadcastMessage("❌ Incorrect sequence. Try again!")
                playerSequence = {}
            end
        end
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
        if player:IsAtLocation(67890) then -- Example maze exit location ID
            mazeCompleted = true
            player:SendBroadcastMessage("✨ You completed Love’s Labyrinth! Matchmaking rewards unlocked.")
            AwardMatchmakingPoints(player, 15)
        end
    end
end

-- 🛡 Event Registration
RegisterMinigameEvent("CupidArchery_OnStart", "CupidArchery_OnStart") -- Cupid’s Archery Challenge
RegisterMinigameEvent("HeartstringHarmony_OnStart", "HeartstringHarmony_OnStart") -- Heartstring Harmony
RegisterMinigameEvent("LovesLabyrinth_OnStart", "LovesLabyrinth_OnStart") -- Love’s Labyrinth
```

---

### **🚀 What’s Included in This Lua Script?**
✅ **Cupid’s Archery Challenge (Target Practice Mini-Game)**  
✅ **Heartstring Harmony (Musical Rhythm Mini-Game)**  
✅ **Love’s Labyrinth (Maze Puzzle Mini-Game)**  
✅ **Matchmaking points & buffs for successful completion**  

Would you like **additional Lua scripts for matchmaking duels** or **seasonal matchmaking events** next? 🚀💖✨
