# Lionheart Love Patch Repository

## 📂 Project Structure

### 🔹 **Main Folders**
- `/code/` → Lua scripts for quests, matchmaking mechanics, and seasonal events.
- `/assets/` → Textures, icons, UI changes, and Love Patch-themed models.
- `/docs/` → Patch notes, development guidelines, changelogs, and community feedback.
- `/testing/` → Playtesting reports, bug tracking, and balancing adjustments.

### 🔹 **Files Overview**
#### **📜 Quest Scripts**
- `/code/Reuniting_Lost_Lovers.lua` → Love-themed quest about recovering stolen letters.
- `/code/The_Heart_of_Eternity.lua` → Mythical love relic quest with special effects.
- `/code/Destiny's_Trial.lua` → Advanced matchmaking system with unique trials.
- `/code/Soulmate_Bonding_Ritual.lua` → Pair players for cooperative buffs and rewards.

#### **🛠 Matchmaking Mechanics**
- `/code/Soulbound_Connection.lua` → Forms Soulmate pairs with custom buffs.
- `/code/Eternal_Love_Blessing.lua` → Creates seasonal festival buffs for matched players.
- `/code/Love_Duel_Arena.lua` → PvP system where players fight for Love’s Honor.

#### **🎨 Assets & UI Changes**
- `/assets/Heartbound_Cloak.png` → Special glowing red cloak texture.
- `/assets/Lover's_Lantern.png` → UI icons and toy assets.
- `/assets/Mini_Cupid_Pet.png` → Love-themed pet model and animations.

#### **📢 Patch Notes & Development**
- `/docs/README.md` → Introduction to the Lionheart Love Patch.
- `/docs/objectives.md` → Development roadmap and feature goals.
- `/docs/matchmaking_system.md` → Design details for matchmaking mechanics.
- `/docs/expanded_quests.md` → In-depth descriptions for all romantic adventure quests.

---

### **📜 More Lua Scripts for Love-Themed Mechanics**
Here are **expanded matchmaking mechanics, PvP events, and seasonal festival scripts** for the Love Patch.

#### **📜 Lua Script: Eternal Love Festival Buffs**
```lua
-- Define Seasonal Event NPC
local npc_love_festival = CreateNPC("Elyndra, Keeper of Love", 777888, "Stormwind")

-- Love Festival Buff Quest
local quest_love_festival = CreateQuest("Eternal Love Festival", 999222)
quest_love_festival:SetDescription("Celebrate love in Azeroth and receive a special blessing.")
quest_love_festival:SetObjective("Participate in festival events and receive the Eternal Love Blessing.")

-- Apply Festival Buff
function quest_love_festival:OnFestivalStart(player)
    SendChatMessage(player, "Elyndra whispers: 'The festival begins! Love’s magic fills the air.'")
    ApplyBuff(player, "Eternal Love Blessing", 10800)
end

function quest_love_festival:OnComplete(player)
    SendChatMessage(player, "Elyndra smiles: 'You carry love’s essence. May your heart guide you forever.'")
    GiveReward(player, "Lover’s Lantern")
end

-- Register the quest
RegisterQuest(quest_love_festival)
