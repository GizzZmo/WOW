### **🚀 In-Depth Guide: Matchmaking Logic Implementation for WoW Classic**  
The **Lionheart Love Patch** introduces matchmaking mechanics to WoW Classic, allowing players to find their **soulmate in Azeroth** based on their playstyle and personality. Below is a **detailed breakdown** of each step required for implementation.  

---

## **📌 Step 1: Defining Matchmaking Criteria**  
Before coding, we must determine how the system selects compatible players. Here’s how we can **structure matchmaking logic**:  

✅ **Player Personality Questions** – Create **a short questionnaire** when players interact with Madame Florence. Example questions:  
   - Do you prefer **PvE or PvP** adventures?  
   - Are you a **casual explorer or hardcore raider**?  
   - What’s your **ideal questing style** (solo, duo, large group)?  

✅ **Faction & Class Compatibility** – Ensure matchmaking balances **Alliance and Horde** players fairly.  
   - Allow **cross-faction pairing** for lore-driven relationships (e.g., "forbidden love quests").  
   - Some classes may receive **synergy buffs** when paired (e.g., **Priest & Warrior** get an enhanced *Eternal Bonds* buff).  

✅ **Buff Mechanics – The ‘Eternal Bonds’ System**  
   - Matched players receive **a passive buff** when questing together.  
   - Buff **scales based on interaction**—helping each other, completing quests, healing in dungeons increases synergy.  
   - Buff dissipates if players stop adventuring together for long durations.  

✅ **Couple’s Trials – Love-Themed Dungeon Mechanics**  
   - Special **instanced dungeons** where matched players **prove their bond**.  
   - Mechanics require **teamwork-based combat or puzzle-solving** (e.g., synchronized lever activation).  
   - Completion unlocks **titles, cloaks, and permanent relationship perks**.  

✅ **Dynamic Titles & Rewards**  
   - Players earn unique **titles based on interactions** (*Heartbound Champion*, *Eternal Matchmaker*).  
   - Cosmetic **heart-shaped cloaks** for completing matchmaking milestones.  

---

## **📌 Step 2: Technical Implementation in WoW Classic**  
To **make matchmaking logic functional**, we need database structures, UI elements, and Lua scripting for interactions. Here’s a deeper breakdown:  

### **🗃 Database Integration (MySQL)**
✅ **Create a Table for Matchmaking Preferences**  
```sql
CREATE TABLE matchmaking_data (
   player_id INT PRIMARY KEY,
   faction VARCHAR(10),
   class VARCHAR(20),
   pve_pvp_pref VARCHAR(10),
   playstyle VARCHAR(20),
   last_active TIMESTAMP
);
```
- Stores **player personality questionnaire results**.  
- Tracks **last active time** to prevent pairing inactive players.  

✅ **Link Matchmaking Data to Character Stats**  
```sql
ALTER TABLE characters ADD COLUMN matchmaking_status VARCHAR(20);
```
- Enables **tracking bonded players and buff progression**.  

✅ **Matchmaking Pairing Query Example**  
```sql
SELECT c1.player_id, c2.player_id 
FROM matchmaking_data AS c1
JOIN matchmaking_data AS c2
ON c1.faction != c2.faction
AND c1.playstyle = c2.playstyle
AND c1.pve_pvp_pref = c2.pve_pvp_pref
ORDER BY RAND() LIMIT 1;
```
- Randomly pairs **players with compatible traits**.  
- Allows **cross-faction matchmaking** if enabled.  

---

### **🎭 UI Development – Matchmaking Interface**
✅ **Madame Florence NPC UI Setup (Lua)**
```lua
function MadameFlorence_OnGossip(unit, player)
   player:SendBroadcastMessage("Welcome to Eternal Bonds matchmaking! Answer a few questions to find your perfect match.")
   ShowPersonalityQuestions(player)
end
```
- Displays **matchmaking introduction UI**.  
- Calls function to **start personality questionnaire**.  

✅ **Building Questionnaire UI Elements**
```lua
function ShowPersonalityQuestions(player)
   local menu = CreateMenu()
   menu:AddOption("I prefer PvE.", "PvE")
   menu:AddOption("I prefer PvP.", "PvP")
   menu:AddOption("I like questing solo.", "Solo")
   menu:AddOption("I prefer party adventures.", "Party")
   player:SendMenu(menu)
end
```
- Shows **multiple-choice options** for player matchmaking preferences.  
- Stores **answers in database** upon selection.  

✅ **Displaying Matched Player Results**
```lua
function DisplayMatchResult(player, matched_player)
   player:SendBroadcastMessage("Your perfect match is " .. matched_player:GetName() .. "!")
   ApplyEternalBondsBuff(player, matched_player)
end
```
- When matchmaking completes, **announces the paired player**.  
- Applies the **Eternal Bonds Buff** automatically.  

---

## **📌 Step 3: Matchmaking Playtesting & Balancing**
To **refine matchmaking balance**, we need structured playtesting phases:  

✅ **Closed Alpha – Small Group Testing**  
   - Test matchmaking **logic, buff mechanics, and dungeon trials**.  
   - Debug UI elements and **database queries**.  

✅ **Open Beta – Larger Community Testing**  
   - Gather **player feedback** via Discord & GitHub issue tracking.  
   - Adjust matchmaking **difficulty scaling and reward progression**.  

✅ **Balancing Adjustments Before Full Release**  
   - Ensure matchmaking buffs **don’t overpower PvP/PvE encounters**.  
   - Modify matchmaking **criteria based on playstyle popularity**.  

---

### **📜 Summary of Implementation Steps**
1️⃣ **Define matchmaking criteria** – player personality questionnaire, faction balance, buff mechanics.  
2️⃣ **Database setup** – MySQL matchmaking tracking tables & pairing queries.  
3️⃣ **Lua scripting** – UI interface for Madame Florence, personality questionnaire, matchmaking logic.  
4️⃣ **Buff mechanics** – Eternal Bonds passive buffs scale based on gameplay interaction.  
5️⃣ **Dungeon matchmaking trials** – special cooperative trials for bonded players.  
6️⃣ **Playtesting & balancing** – closed alpha, open beta, PvP/PvE balance tuning.  

---

## **🚀 Next Steps: Enhancing the Matchmaking Experience**
Would you like to add:  
✅ **More matchmaking mini-games** (e.g., *Cupid’s Archery Challenge*)?  
✅ **Love-themed event progression** (e.g., *Seasonal Love Festival expansion*)?  
✅ **PvP matchmaking duels & battleground challenges** (e.g., *Heartbound Arena*)?  

Let me know how you’d like to **expand the matchmaking system!** 🚀💖✨  

