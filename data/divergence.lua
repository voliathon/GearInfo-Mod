-- /data/divergence.lua
local divergence_tables = {}
for i = 1, 30 do divergence_tables[i] = {} end

-- Local expand_stats to ensure this module works completely independently
local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    -- Generic Path A & B Stats
    if rank_data.DblDmg then full_stats['Chance of double damage'] = rank_data.DblDmg end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.FollowUp then full_stats['Chance of follow-up attack'] = rank_data.FollowUp end
    if rank_data.SBII then full_stats['Subtle Blow II'] = rank_data.SBII end
    if rank_data.DMG then full_stats['Damage'] = rank_data.DMG end

    -- Job Specific Route C
    if rank_data.WyvHP then full_stats['Wyvern: HP'] = rank_data.WyvHP end
    if rank_data.WyvDT then full_stats['Wyvern: Damage Taken'] = rank_data.WyvDT end
    if rank_data.AffMisery then full_stats['Afflatus Misery stored'] = rank_data.AffMisery end
    if rank_data.HealRecast then full_stats['Healing magic recast delay'] = rank_data.HealRecast end
    if rank_data.DT then full_stats['Damage Taken'] = rank_data.DT end
    if rank_data.SongCast then full_stats['Song spellcasting time'] = rank_data.SongCast end
    if rank_data.SongDA then full_stats['Song effects: Double Attack'] = rank_data.SongDA end
    if rank_data.MBD2 then full_stats['Magic Burst Damage II'] = rank_data.MBD2 end
    if rank_data.MBAcc then full_stats['Magic Burst Accuracy'] = rank_data.MBAcc end
    if rank_data.DrainAspir then full_stats['Drain and Aspir Potency'] = rank_data.DrainAspir end
    if rank_data.SwordEnhDmg then full_stats['Sword Enhancement Spell Damage'] = rank_data.SwordEnhDmg end
    if rank_data.ElemWSD then full_stats['Elemental weapon skill damage'] = rank_data.ElemWSD end
    if rank_data.PetDblDmg then full_stats['Pet: Chance of double damage'] = rank_data.PetDblDmg end
    if rank_data.BPStatusDbl then full_stats['Chance of doubling Blood Pact status'] = rank_data.BPStatusDbl end
    if rank_data.BPDmg then full_stats['Blood Pact Damage'] = rank_data.BPDmg end
    if rank_data.DrainPot then full_stats['Drain potency'] = rank_data.DrainPot end
    if rank_data.WSD then full_stats['Weapon Skill Damage'] = rank_data.WSD end
    if rank_data.NinRecast then full_stats['Ninjutsu recast time'] = rank_data.NinRecast end
    if rank_data.EnmityUtsu then full_stats['Enmity for each Utsusemi'] = rank_data.EnmityUtsu end
    if rank_data.SekkaRecast then full_stats['Sekkanoki recast time'] = rank_data.SekkaRecast end
    if rank_data.SekkaWSD then full_stats['Sekkanoki: Weapon Skill Damage'] = rank_data.SekkaWSD end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.TPEva then full_stats['TP during evasion'] = rank_data.TPEva end
    if rank_data.MP then full_stats['MP'] = rank_data.MP end
    if rank_data.ManaWall then full_stats['Mana Wall'] = rank_data.ManaWall end
    if rank_data.TPCrit then full_stats['TP Gained when landing critical hits'] = rank_data.TPCrit end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    if rank_data.HP then full_stats['HP'] = rank_data.HP end
    if rank_data.CurePot then full_stats['Cure Potency'] = rank_data.CurePot end
    if rank_data.Refresh then full_stats['Refresh'] = rank_data.Refresh end
    if rank_data.RegenRec then full_stats['Regen effects received'] = rank_data.RegenRec end
    if rank_data.VivPulse then full_stats['Vivacious Pulse potency'] = rank_data.VivPulse end
    if rank_data.RegenPot then full_stats['Regen Potency'] = rank_data.RegenPot end
    if rank_data.FC then full_stats['Fast Cast'] = rank_data.FC end
    if rank_data.PetDT then full_stats['Pet: Damage Taken'] = rank_data.PetDT end
    if rank_data.RollDur then full_stats['Phantom Roll duration'] = rank_data.RollDur end
    if rank_data.RollXI then full_stats['Phantom Roll XI HP/MP'] = rank_data.RollXI end
    if rank_data.Roll then full_stats['Phantom Roll'] = rank_data.Roll end
    if rank_data.Chakra then full_stats['Chakra'] = rank_data.Chakra end
    if rank_data.FlourishRecast then full_stats['Flourish recast time'] = rank_data.FlourishRecast end
    if rank_data.StepDur then full_stats['Step duration'] = rank_data.StepDur end
    if rank_data.AmmoDmg then full_stats['Additional ammo damage'] = rank_data.AmmoDmg end
    if rank_data.AmmoAcc then full_stats['Additional ammo accuracy'] = rank_data.AmmoAcc end
    if rank_data.AutoSpecDmg then full_stats['Automaton: Special attack damage'] = rank_data.AutoSpecDmg end
    if rank_data.ChainRecast then full_stats['Chain Affinity recast time'] = rank_data.ChainRecast end
    if rank_data.BurstRecast then full_stats['Burst Affinity recast time'] = rank_data.BurstRecast end

    return full_stats
end

-- Helper: Truncates values toward 0 (Safely handles negative numbers like DT)
local function truncate(val)
    return val > 0 and math.floor(val) or math.ceil(val)
end

-- Generator Function: Calculates scaling for Path A, B, and C
local function gen_divergence(item_id, tier, path_c_max, extra_dmg)
    local max_rank = 15
    local a_max = {DblDmg=30, STP=15}
    local b_max = {FollowUp=30, SBII=15}

    if tier == 2 then
        max_rank = 20
        a_max = {DblDmg=40, STP=20}
        b_max = {FollowUp=40, SBII=20}
    elseif tier == 3 then
        max_rank = 25
        a_max = {DblDmg=50, STP=25}
        b_max = {FollowUp=50, SBII=25}
        if extra_dmg then
            a_max.DMG = extra_dmg
            b_max.DMG = extra_dmg
            path_c_max.DMG = extra_dmg
        end
    end

    for r = 1, max_rank do
        local current_a, current_b, current_c = {}, {}, {}

        for stat, max_val in pairs(a_max) do
            local val = truncate((max_val * r) / max_rank)
            if val ~= 0 then current_a[stat] = val end
        end

        for stat, max_val in pairs(b_max) do
            local val = truncate((max_val * r) / max_rank)
            if val ~= 0 then current_b[stat] = val end
        end

        for stat, max_val in pairs(path_c_max) do
            local val = truncate((max_val * r) / max_rank)
            if val ~= 0 then current_c[stat] = val end
        end

        divergence_tables[r][item_id] = {
            ['A'] = expand_stats(current_a),
            ['B'] = expand_stats(current_b),
            ['C'] = expand_stats(current_c)
        }
    end
end

-- ==============================================================================
-- DIVERGENCE WEAPON ARRAYS (Generates dynamically up to Max Rank)
-- ==============================================================================

-- DRG
gen_divergence(21876, 1, {WyvHP=150, WyvDT=-10}) -- Wyrm Lance
gen_divergence(21877, 2, {WyvHP=200, WyvDT=-12}) -- Pteroslaver Lance
gen_divergence(21878, 3, {WyvHP=250, WyvDT=-15}, 14) -- Aram

-- WHM
gen_divergence(22033, 1, {AffMisery=150, HealRecast=-15, DT=-10}) -- Cleric's Wand
gen_divergence(22034, 2, {AffMisery=200, HealRecast=-20, DT=-12}) -- Piety Wand
gen_divergence(22035, 3, {AffMisery=250, HealRecast=-25, DT=-15}, 8) -- Asclepius

-- BRD
gen_divergence(21576, 1, {SongCast=-15, SongDA=2}) -- Bard's Knife
gen_divergence(21577, 2, {SongCast=-20, SongDA=3}) -- Bihu Knife
gen_divergence(21578, 3, {SongCast=-25, SongDA=4}, 5) -- Barfawc

-- GEO
gen_divergence(22036, 1, {MBD2=6, MBAcc=20, DrainAspir=10}) -- Bagua Wand
gen_divergence(22037, 2, {MBD2=8, MBAcc=25, DrainAspir=15}) -- Sifang Wand
gen_divergence(22038, 3, {MBD2=10, MBAcc=30, DrainAspir=20}, 8) -- Bhima

-- RDM
gen_divergence(21625, 1, {SwordEnhDmg=300, ElemWSD=50}) -- Duelist's Sword
gen_divergence(21626, 2, {SwordEnhDmg=400, ElemWSD=75}) -- Vitiation Sword
gen_divergence(21627, 3, {SwordEnhDmg=500, ElemWSD=100}, 7) -- Crocea Mors

-- SMN
gen_divergence(22094, 1, {PetDblDmg=20, BPStatusDbl=15, BPDmg=10}) -- Summoner's Staff
gen_divergence(22095, 2, {PetDblDmg=35, BPStatusDbl=20, BPDmg=12}) -- Glyphic Staff
gen_divergence(22096, 3, {PetDblDmg=50, BPStatusDbl=25, BPDmg=15}, 11) -- Draumstafir

-- DRK
gen_divergence(21823, 1, {DrainPot=15, WSD=10}) -- Abyss Scythe
gen_divergence(21824, 2, {DrainPot=20, WSD=12}) -- Fallen's Scythe
gen_divergence(21825, 3, {DrainPot=25, WSD=15}, 15) -- Father Time

-- NIN
gen_divergence(21915, 1, {NinRecast=-15, EnmityUtsu=6}) -- Koga Shin.
gen_divergence(21916, 2, {NinRecast=-20, EnmityUtsu=8}) -- Mochi. Shin.
gen_divergence(21917, 3, {NinRecast=-25, EnmityUtsu=10}, 7) -- Fudo Masamune

-- SAM
gen_divergence(21968, 1, {SekkaRecast=-15, SekkaWSD=50}) -- Saotome-no-tachi
gen_divergence(21969, 2, {SekkaRecast=-20, SekkaWSD=75}) -- Sakonji-no-tachi
gen_divergence(21970, 3, {SekkaRecast=-25, SekkaWSD=100}, 13) -- Fusenaikyo

-- THF
gen_divergence(21573, 1, {Eva=50, TPEva=20}) -- Assassin's Knife
gen_divergence(21574, 2, {Eva=75, TPEva=35}) -- Plun. Knife
gen_divergence(21575, 3, {Eva=100, TPEva=50}, 5) -- Gandring

-- BLM
gen_divergence(22091, 1, {MP=50, ManaWall=15, DT=-10}) -- Sorcerer's Staff
gen_divergence(22092, 2, {MP=75, ManaWall=20, DT=-12}) -- Archmage's Staff
gen_divergence(22093, 3, {MP=100, ManaWall=25, DT=-15}, 11) -- Kaumodaki

-- WAR
gen_divergence(21772, 1, {TPCrit=30, Crit=6}) -- War. Chopper
gen_divergence(21773, 2, {TPCrit=40, Crit=8}) -- Agoge Chopper
gen_divergence(21774, 3, {TPCrit=50, Crit=10}, 14) -- Labraunda

-- PLD
gen_divergence(21628, 1, {HP=150, CurePot=15, Refresh=2}) -- Valor Sword
gen_divergence(21629, 2, {HP=200, CurePot=20, Refresh=3}) -- Cabal. Sword
gen_divergence(21630, 3, {HP=250, CurePot=25, Refresh=4}, 7) -- Moralltach

-- RUN
gen_divergence(21667, 1, {RegenRec=15, VivPulse=20}) -- Futhark Claymore
gen_divergence(21668, 2, {RegenRec=20, VivPulse=25}) -- Peord Claymore
gen_divergence(21669, 3, {RegenRec=25, VivPulse=30}, 14) -- Morgelai

-- SCH
gen_divergence(22097, 1, {RegenPot=15, CurePot=15, FC=6}) -- Argute Staff
gen_divergence(22098, 2, {RegenPot=20, CurePot=20, FC=8}) -- Pedagogy Staff
gen_divergence(22099, 3, {RegenPot=25, CurePot=25, FC=10}, 11) -- Musa

-- BST
gen_divergence(21715, 1, {DT=-15, PetDT=-10}) -- Monster Axe
gen_divergence(21716, 2, {DT=-20, PetDT=-12}) -- Ankusa Axe
gen_divergence(21717, 3, {DT=-25, PetDT=-15}, 11) -- Pangu

-- COR
gen_divergence(21579, 1, {RollDur=30, RollXI=10, Roll=6}) -- Comm. Knife
gen_divergence(21580, 2, {RollDur=45, RollXI=12, Roll=7}) -- Lanun Knife
gen_divergence(21581, 3, {RollDur=60, RollXI=15, Roll=8}, 5) -- Rostam

-- MNK
gen_divergence(21521, 1, {HP=200, Chakra=20}) -- Melee Fists
gen_divergence(21522, 2, {HP=300, Chakra=35}) -- Hes. Fists
gen_divergence(21523, 3, {HP=400, Chakra=50}, 12) -- Sagitta

-- DNC
gen_divergence(21582, 1, {FlourishRecast=-15, StepDur=30}) -- Etoile Knife
gen_divergence(21583, 2, {FlourishRecast=-20, StepDur=45}) -- Horos Knife
gen_divergence(21584, 3, {FlourishRecast=-25, StepDur=60}, 5) -- Setan Kober

-- RNG
gen_divergence(22147, 1, {AmmoDmg=200, AmmoAcc=100}) -- Scout's Crossbow
gen_divergence(22148, 2, {AmmoDmg=250, AmmoAcc=125}) -- Arke Crossbow
gen_divergence(22149, 3, {AmmoDmg=250, AmmoAcc=150}, 6) -- Sharanga

-- PUP
gen_divergence(21524, 1, {WSD=10, AutoSpecDmg=15}) -- Pantin Fists
gen_divergence(21525, 2, {WSD=12, AutoSpecDmg=20}) -- Pitre Fists
gen_divergence(21526, 3, {WSD=15, AutoSpecDmg=25}, 12) -- Xiucoatl

-- BLU
gen_divergence(21631, 1, {ChainRecast=-15, BurstRecast=-15}) -- Mirage Sword
gen_divergence(21632, 2, {ChainRecast=-20, BurstRecast=-20}) -- Luhlaza Sword
gen_divergence(21633, 3, {ChainRecast=-25, BurstRecast=-25}, 7) -- Zomorrodnegar

return divergence_tables