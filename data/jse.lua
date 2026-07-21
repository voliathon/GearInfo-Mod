-- /data/jse.lua
local jse_tables = {}
for i = 1, 30 do jse_tables[i] = {} end

-- Local expand_stats to ensure this module works completely independently
local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    -- Base Stats & HP/MP
    if rank_data.HP then full_stats['HP'] = rank_data.HP end
    if rank_data.MP then full_stats['MP'] = rank_data.MP end
    if rank_data.STR then full_stats['STR'] = rank_data.STR end
    if rank_data.DEX then full_stats['DEX'] = rank_data.DEX end
    if rank_data.VIT then full_stats['VIT'] = rank_data.VIT end
    if rank_data.AGI then full_stats['AGI'] = rank_data.AGI end
    if rank_data.INT then full_stats['INT'] = rank_data.INT end
    if rank_data.MND then full_stats['MND'] = rank_data.MND end
    if rank_data.CHR then full_stats['CHR'] = rank_data.CHR end

    -- Core Combat & Magic Stats
    if rank_data.DA then full_stats['Double Attack'] = rank_data.DA end
    if rank_data.TA then full_stats['Triple Attack'] = rank_data.TA end
    if rank_data.PDL then full_stats['Physical Damage Limit'] = rank_data.PDL end
    if rank_data.KickAttacks then full_stats['Kick Attacks'] = rank_data.KickAttacks end
    if rank_data.Enmity then full_stats['Enmity'] = rank_data.Enmity end
    if rank_data.FC then full_stats['Fast Cast'] = rank_data.FC end
    if rank_data.MBD then full_stats['Magic Burst Damage'] = rank_data.MBD end
    if rank_data.MBAcc then full_stats['Magic Burst Accuracy'] = rank_data.MBAcc end
    if rank_data.EnhMagDur then full_stats['Enhancing Magic Duration'] = rank_data.EnhMagDur end
    if rank_data.EnfMagDur then full_stats['Enfeebling Magic Duration'] = rank_data.EnfMagDur end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.DT then full_stats['Damage Taken'] = rank_data.DT end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.Daken then full_stats['Daken'] = rank_data.Daken end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    if rank_data.MDMG then full_stats['Magic Damage'] = rank_data.MDMG end
    if rank_data.MAB then full_stats['Magic Attack Bonus'] = rank_data.MAB end
    if rank_data.HelixDur then full_stats['Helix Effect Duration'] = rank_data.HelixDur end
    
    -- Companion & Unique Stats
    if rank_data.PetDA then full_stats['Pet: Double Attack'] = rank_data.PetDA end
    if rank_data.WyvDT then full_stats['Wyvern: Damage Taken'] = rank_data.WyvDT end
    if rank_data.AvaBaseStats then full_stats['Avatar: All Attr.'] = rank_data.AvaBaseStats end
    if rank_data.BPDmg then full_stats['Blood Pact Damage'] = rank_data.BPDmg end
    if rank_data.AutoMAB then full_stats['Automaton: Magic Attack Bonus'] = rank_data.AutoMAB end
    if rank_data.LuopanDur then full_stats['Luopan Duration'] = rank_data.LuopanDur end
    if rank_data.LuopanDT then full_stats['Luopan: Damage Taken'] = rank_data.LuopanDT end

    return full_stats
end

-- Generator Function: Automatically calculates intermediate ranks based on max cap
local function gen_ranks(item_id, max_rank, max_stats)
    for r = 1, max_rank do
        local current_stats = {}
        for stat, max_val in pairs(max_stats) do
            -- Standard FFXI linear interpolation: floor((max * current) / cap)
            local val = math.floor((max_val * r) / max_rank)
            if val ~= 0 then
                current_stats[stat] = val
            end
        end
        jse_tables[r][item_id] = { ['A'] = expand_stats(current_stats) }
    end
end

-- ==============================================================================
-- JSE NECK ARRAYS (Generates dynamically up to Max Rank)
-- ==============================================================================

-- WAR: Warrior's Beads
gen_ranks(25417, 15, {HP=50, STR=10, DEX=10, DA=5})
gen_ranks(25418, 20, {HP=75, STR=12, DEX=12, DA=6})
gen_ranks(25419, 25, {HP=100, STR=15, DEX=15, DA=7})

-- MNK: Monk's Nodowa
gen_ranks(25423, 15, {DEX=10, MND=10, KickAttacks=15, PDL=6})
gen_ranks(25424, 20, {DEX=12, MND=12, KickAttacks=20, PDL=8})
gen_ranks(25425, 25, {DEX=15, MND=15, KickAttacks=25, PDL=10})

-- WHM: Cleric's Torque
gen_ranks(25429, 15, {INT=10, MND=10, Enmity=-15, FC=6})
gen_ranks(25430, 20, {INT=12, MND=12, Enmity=-20, FC=8})
gen_ranks(25431, 25, {INT=15, MND=15, Enmity=-25, FC=10})

-- BLM: Sorcerer's Stole
gen_ranks(25435, 15, {INT=10, MND=10, MBD=6, MBAcc=15})
gen_ranks(25436, 20, {INT=12, MND=12, MBD=8, MBAcc=20})
gen_ranks(25437, 25, {INT=15, MND=15, MBD=10, MBAcc=25})

-- RDM: Duelist's Torque
gen_ranks(25441, 15, {INT=10, MND=10, EnhMagDur=15, EnfMagDur=15})
gen_ranks(25442, 20, {INT=12, MND=12, EnhMagDur=20, EnfMagDur=20})
gen_ranks(25443, 25, {INT=15, MND=15, EnhMagDur=25, EnfMagDur=25})

-- THF: Assassin's Gorget
gen_ranks(25447, 15, {DEX=10, AGI=10, Eva=15, TA=2})
gen_ranks(25448, 20, {DEX=12, AGI=12, Eva=20, TA=3})
gen_ranks(25449, 25, {DEX=15, AGI=15, Eva=25, TA=4})

-- PLD: Knight's Beads
gen_ranks(25453, 15, {HP=30, VIT=10, MND=10, DT=-5})
gen_ranks(25454, 20, {HP=45, VIT=12, MND=12, DT=-6})
gen_ranks(25455, 25, {HP=60, VIT=15, MND=15, DT=-7})

-- DRK: Abyssal Beads
gen_ranks(25459, 15, {STR=15, STP=5, PDL=6})
gen_ranks(25460, 20, {STR=20, STP=6, PDL=8})
gen_ranks(25461, 25, {STR=25, STP=7, PDL=10})

-- BST: Beastmaster Collar
gen_ranks(25465, 15, {STR=10, DEX=10, PDL=6, PetDA=15})
gen_ranks(25466, 20, {STR=12, DEX=12, PDL=8, PetDA=20})
gen_ranks(25467, 25, {STR=15, DEX=15, PDL=10, PetDA=25})

-- BRD: Bard's Charm
gen_ranks(25471, 15, {DEX=15, CHR=15, STP=5, PDL=6})
gen_ranks(25472, 20, {DEX=20, CHR=20, STP=6, PDL=8})
gen_ranks(25473, 25, {DEX=25, CHR=25, STP=7, PDL=10})

-- RNG: Scout's Gorget
gen_ranks(25477, 15, {AGI=15, STP=5, PDL=6})
gen_ranks(25478, 20, {AGI=20, STP=6, PDL=8})
gen_ranks(25479, 25, {AGI=25, STP=7, PDL=10})

-- SAM: Samurai's Nodowa
gen_ranks(25483, 15, {STR=15, STP=5, PDL=6})
gen_ranks(25484, 20, {STR=20, STP=6, PDL=8})
gen_ranks(25485, 25, {STR=25, STP=7, PDL=10})

-- NIN: Ninja Nodowa
gen_ranks(25489, 15, {DEX=10, AGI=10, Daken=15, PDL=6})
gen_ranks(25490, 20, {DEX=12, AGI=12, Daken=20, PDL=8})
gen_ranks(25491, 25, {DEX=15, AGI=15, Daken=25, PDL=10})

-- DRG: Dragoon's Collar
gen_ranks(25495, 15, {STR=10, VIT=10, PDL=6, WyvDT=-15})
gen_ranks(25496, 20, {STR=12, VIT=12, PDL=8, WyvDT=-20})
gen_ranks(25497, 25, {STR=15, VIT=15, PDL=10, WyvDT=-25})

-- SMN: Summoner's Collar
gen_ranks(25501, 15, {MP=30, AvaBaseStats=15, BPDmg=6})
gen_ranks(25502, 20, {MP=40, AvaBaseStats=20, BPDmg=8})
gen_ranks(25503, 25, {MP=50, AvaBaseStats=25, BPDmg=10})

-- BLU: Mirage Stole
gen_ranks(25507, 15, {STR=15, DEX=15, STP=5, Crit=3})
gen_ranks(25508, 20, {STR=20, DEX=20, STP=6, Crit=4})
gen_ranks(25509, 25, {STR=25, DEX=25, STP=7, Crit=5})

-- COR: Commodore Charm
gen_ranks(25513, 15, {STR=10, AGI=10, MDMG=15, MAB=5})
gen_ranks(25514, 20, {STR=12, AGI=12, MDMG=20, MAB=6})
gen_ranks(25515, 25, {STR=15, AGI=15, MDMG=25, MAB=7})

-- PUP: Puppetmaster's Collar
gen_ranks(25519, 15, {DEX=10, AGI=10, PDL=6, AutoMAB=15})
gen_ranks(25520, 20, {DEX=12, AGI=12, PDL=8, AutoMAB=20})
gen_ranks(25521, 25, {DEX=15, AGI=15, PDL=10, AutoMAB=25})

-- DNC: Etoile Gorget
gen_ranks(25525, 15, {DEX=15, CHR=15, STP=5, PDL=6})
gen_ranks(25526, 20, {DEX=20, CHR=20, STP=6, PDL=8})
gen_ranks(25527, 25, {DEX=25, CHR=25, STP=7, PDL=10})

-- SCH: Argute Stole
gen_ranks(25531, 15, {INT=10, MND=10, MDMG=15, HelixDur=6})
gen_ranks(25532, 20, {INT=12, MND=12, MDMG=20, HelixDur=8})
gen_ranks(25533, 25, {INT=15, MND=15, MDMG=25, HelixDur=10})

-- GEO: Bagua Charm
gen_ranks(25537, 15, {MP=30, LuopanDur=15, LuopanDT=-6})
gen_ranks(25538, 20, {MP=40, LuopanDur=20, LuopanDT=-8})
gen_ranks(25539, 25, {MP=50, LuopanDur=25, LuopanDT=-10})

-- RUN: Futhark Torque
gen_ranks(25543, 15, {HP=30, STR=10, MND=10, DT=-5})
gen_ranks(25544, 20, {HP=45, STR=12, MND=12, DT=-6})
gen_ranks(25545, 25, {HP=60, STR=15, MND=15, DT=-7})

return jse_tables