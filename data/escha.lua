-- GearInfo-Mod for Final Fantasy XI
-- Copyright (c) 2026 Voliathon. All rights reserved.
-- Licensed under custom terms. See LICENSE file in the root directory.
local escha_tables = {}
for i = 1, 30 do escha_tables[i] = {} end

local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    -- Base Stats
    if rank_data.HP then full_stats['HP'] = rank_data.HP end
    if rank_data.MP then full_stats['MP'] = rank_data.MP end
    if rank_data.STR then full_stats['STR'] = rank_data.STR end
    if rank_data.DEX then full_stats['DEX'] = rank_data.DEX end
    if rank_data.VIT then full_stats['VIT'] = rank_data.VIT end
    if rank_data.AGI then full_stats['AGI'] = rank_data.AGI end
    if rank_data.INT then full_stats['INT'] = rank_data.INT end
    if rank_data.MND then full_stats['MND'] = rank_data.MND end
    if rank_data.CHR then full_stats['CHR'] = rank_data.CHR end
    
    -- Combat & Magic Stats
    if rank_data.Damage then full_stats['Damage'] = rank_data.Damage end
    if rank_data.Acc then full_stats['Accuracy'] = rank_data.Acc end
    if rank_data.Atk then full_stats['Attack'] = rank_data.Atk end
    if rank_data.Racc then full_stats['Ranged Accuracy'] = rank_data.Racc end
    if rank_data.Ratk then full_stats['Ranged Attack'] = rank_data.Ratk end
    if rank_data.Macc then full_stats['Magic Accuracy'] = rank_data.Macc end
    if rank_data.MAB then full_stats['Magic Attack Bonus'] = rank_data.MAB end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.Meva then full_stats['Magic Evasion'] = rank_data.Meva end
    
    -- Defensive & Traits
    if rank_data.DT then full_stats['Damage Taken'] = rank_data.DT end
    if rank_data.PDT then full_stats['Physical Damage Taken'] = rank_data.PDT end
    if rank_data.MDT then full_stats['Magic Damage Taken'] = rank_data.MDT end
    if rank_data.DA then full_stats['Double Attack'] = rank_data.DA end
    if rank_data.TA then full_stats['Triple Attack'] = rank_data.TA end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    if rank_data.SubtleBlow then full_stats['Subtle Blow'] = rank_data.SubtleBlow end
    if rank_data.DualWield then full_stats['Dual Wield'] = rank_data.DualWield end
    if rank_data.Enmity then full_stats['Enmity'] = rank_data.Enmity end
    if rank_data.FastCast then full_stats['Fast Cast'] = rank_data.FastCast end
    if rank_data.ConserveMP then full_stats['Conserve MP'] = rank_data.ConserveMP end
    if rank_data.SIRD then full_stats['Spell Interruption Rate'] = rank_data.SIRD end
    if rank_data.Counter then full_stats['Counter'] = rank_data.Counter end
    if rank_data.Snapshot then full_stats['Snapshot'] = rank_data.Snapshot end
    if rank_data.RapidShot then full_stats['Rapid Shot'] = rank_data.RapidShot end
    if rank_data.Recycle then full_stats['Recycle'] = rank_data.Recycle end
    if rank_data.Haste then full_stats['Haste'] = rank_data.Haste end
    
    -- Magic specific & Skill stats
    if rank_data.CurePot then full_stats['Cure Potency'] = rank_data.CurePot end
    if rank_data.CureRx then full_stats['Cure effect received'] = rank_data.CureRx end
    if rank_data.CureCast then full_stats['Cure Spellcasting Time'] = rank_data.CureCast end
    if rank_data.SumSkill then full_stats['Summoning Magic Skill'] = rank_data.SumSkill end
    if rank_data.NinSkill then full_stats['Ninjutsu skill'] = rank_data.NinSkill end
    if rank_data.ShieldSkill then full_stats['Shield Skill'] = rank_data.ShieldSkill end
    if rank_data.ElemSkill then full_stats['Elemental Magic Skill'] = rank_data.ElemSkill end
    if rank_data.DarkSkill then full_stats['Dark Magic Skill'] = rank_data.DarkSkill end
    if rank_data.BlueSkill then full_stats['Blue Magic Skill'] = rank_data.BlueSkill end
    if rank_data.StringSkill then full_stats['String Instrument Skill'] = rank_data.StringSkill end
    if rank_data.WindSkill then full_stats['Wind Instrument Skill'] = rank_data.WindSkill end
    if rank_data.EnhSkill then full_stats['Enhancing Magic Skill'] = rank_data.EnhSkill end
    if rank_data.EnfSkill then full_stats['Enfeebling Magic Skill'] = rank_data.EnfSkill end
    if rank_data.HealSkill then full_stats['Healing Magic Skill'] = rank_data.HealSkill end
    if rank_data.Refresh then full_stats['Refresh'] = rank_data.Refresh end
    if rank_data.AllSongs then full_stats['All songs'] = rank_data.AllSongs end
    if rank_data.BloodBoon then full_stats['Blood Boon'] = rank_data.BloodBoon end

    -- Pet & Avatar Stats
    if rank_data.PetAcc then full_stats['Pet: Accuracy'] = rank_data.PetAcc end
    if rank_data.PetAtk then full_stats['Pet: Attack'] = rank_data.PetAtk end
    if rank_data.PetMacc then full_stats['Pet: Mag. Acc.'] = rank_data.PetMacc end
    if rank_data.PetMAB then full_stats['Pet: Magic Attack Bonus'] = rank_data.PetMAB end
    if rank_data.PetDT then full_stats['Pet: Damage Taken'] = rank_data.PetDT end
    if rank_data.PetDA then full_stats['Pet: Double Attack'] = rank_data.PetDA end
    if rank_data.PetHP then full_stats['Pet: HP'] = rank_data.PetHP end
    if rank_data.PetMP then full_stats['Pet: MP'] = rank_data.PetMP end
    if rank_data.PetSTR then full_stats['Pet: STR'] = rank_data.PetSTR end
    if rank_data.PetVIT then full_stats['Pet: VIT'] = rank_data.PetVIT end
    if rank_data.PetINT then full_stats['Pet: INT'] = rank_data.PetINT end
    if rank_data.PetRegen then full_stats['Pet: Regen'] = rank_data.PetRegen end
    if rank_data.PetHaste then full_stats['Pet: Haste'] = rank_data.PetHaste end
    if rank_data.PetEnmity then full_stats['Pet: Enmity'] = rank_data.PetEnmity end
    if rank_data.BPDmg then full_stats['Blood Pact Damage'] = rank_data.BPDmg end
    if rank_data.BPDelay then full_stats['Blood Pact ability delay'] = rank_data.BPDelay end
    if rank_data.Perp then full_stats['Avatar Perpetuation Cost'] = rank_data.Perp end
    
    -- Automaton Stats
    if rank_data.AutoMelee then full_stats['Automaton Melee Skill'] = rank_data.AutoMelee end
    if rank_data.AutoRanged then full_stats['Automaton Ranged Skill'] = rank_data.AutoRanged end
    if rank_data.AutoMagic then full_stats['Automaton Magic Skill'] = rank_data.AutoMagic end
    if rank_data.AutoCurePot then full_stats['Automaton: Cure Potency'] = rank_data.AutoCurePot end
    if rank_data.AutoFC then full_stats['Automaton: Fast Cast'] = rank_data.AutoFC end

    return full_stats
end

-- ==============================================================================
-- APOGEE SET (Rank 15)
-- ==============================================================================
escha_tables[15][26676] = { ['A']=expand_stats({MP=60, PetMAB=30, BPDmg=7}), ['B']=expand_stats({MP=60, PetAtk=30, BPDmg=7}), ['C']=expand_stats({PetAtk=20, PetMAB=20, BPDmg=7}), ['D']=expand_stats({Perp=-5, PetAcc=20, PetDT=-3}) } -- Apogee Crown
escha_tables[15][26852] = { ['A']=expand_stats({MP=60, PetMAB=30, BPDmg=7}), ['B']=expand_stats({MP=60, PetAtk=30, BPDmg=7}), ['C']=expand_stats({PetAtk=20, PetMAB=20, BPDmg=7}), ['D']=expand_stats({SumSkill=15, Enmity=-5, PetDT=-3}) } -- Apogee Dalmatica
escha_tables[15][27028] = { ['A']=expand_stats({MP=60, PetMAB=30, BPDmg=7}), ['B']=expand_stats({MP=60, PetAtk=30, BPDmg=7}), ['C']=expand_stats({PetAtk=20, PetMAB=20, BPDmg=7}), ['D']=expand_stats({PetMacc=20, BPDelay=-5, BPDmg=7}) } -- Apogee Mitts
escha_tables[15][27204] = { ['A']=expand_stats({MP=60, PetMAB=30, BPDmg=7}), ['B']=expand_stats({MP=60, PetAtk=30, BPDmg=7}), ['C']=expand_stats({PetAtk=20, PetMAB=20, BPDmg=7}), ['D']=expand_stats({PetSTR=15, PetDA=3, BPDmg=13}) } -- Apogee Slacks
escha_tables[15][27380] = { ['A']=expand_stats({MP=60, PetMAB=30, BPDmg=7}), ['B']=expand_stats({MP=60, PetAtk=30, BPDmg=7}), ['C']=expand_stats({PetAtk=20, PetMAB=20, BPDmg=7}), ['D']=expand_stats({MP=70, SumSkill=15, BPDmg=7}) } -- Apogee Pumps
escha_tables[15][26677] = { ['A']=expand_stats({MP=80, PetMAB=35, BPDmg=8}), ['B']=expand_stats({MP=80, PetAtk=35, BPDmg=8}), ['C']=expand_stats({PetAtk=25, PetMAB=25, BPDmg=8}), ['D']=expand_stats({Perp=-7, PetAcc=25, PetDT=-4}) } -- Apogee Crown +1
escha_tables[15][26853] = { ['A']=expand_stats({MP=80, PetMAB=35, BPDmg=8}), ['B']=expand_stats({MP=80, PetAtk=35, BPDmg=8}), ['C']=expand_stats({PetAtk=25, PetMAB=25, BPDmg=8}), ['D']=expand_stats({SumSkill=20, Enmity=-6, PetDT=-4}) } -- Apogee Dalmatica +1
escha_tables[15][27029] = { ['A']=expand_stats({MP=80, PetMAB=35, BPDmg=8}), ['B']=expand_stats({MP=80, PetAtk=35, BPDmg=8}), ['C']=expand_stats({PetAtk=25, PetMAB=25, BPDmg=8}), ['D']=expand_stats({PetMacc=25, BPDelay=-7, BPDmg=8}) } -- Apogee Mitts +1
escha_tables[15][27205] = { ['A']=expand_stats({MP=80, PetMAB=35, BPDmg=8}), ['B']=expand_stats({MP=80, PetAtk=35, BPDmg=8}), ['C']=expand_stats({PetAtk=25, PetMAB=25, BPDmg=8}), ['D']=expand_stats({PetSTR=20, PetDA=4, BPDmg=14}) } -- Apogee Slacks +1
escha_tables[15][27381] = { ['A']=expand_stats({MP=80, PetMAB=35, BPDmg=8}), ['B']=expand_stats({MP=80, PetAtk=35, BPDmg=8}), ['C']=expand_stats({PetAtk=25, PetMAB=25, BPDmg=8}), ['D']=expand_stats({MP=80, SumSkill=20, BPDmg=8}) } -- Apogee Pumps +1

-- ==============================================================================
-- RYUO SET (Rank 15)
-- ==============================================================================
escha_tables[15][25611] = { ['A']=expand_stats({STR=10, DEX=10, Acc=15}), ['B']=expand_stats({HP=50, Acc=15, Atk=15}), ['C']=expand_stats({HP=50, STP=4, SubtleBlow=7}), ['D']=expand_stats({NinSkill=15, Macc=20, MAB=20}) } -- Ryuo Somen
escha_tables[15][25684] = { ['A']=expand_stats({STR=10, DEX=10, Acc=15}), ['B']=expand_stats({HP=50, Acc=15, Atk=15}), ['C']=expand_stats({HP=50, STP=4, SubtleBlow=7}), ['D']=expand_stats({HP=50, STP=5, DA=2}) } -- Ryuo Domaru
escha_tables[15][27115] = { ['A']=expand_stats({STR=10, DEX=10, Acc=15}), ['B']=expand_stats({HP=50, Acc=15, Atk=15}), ['C']=expand_stats({HP=50, STP=4, SubtleBlow=7}), ['D']=expand_stats({DEX=10, Acc=20, DA=3}) } -- Ryuo Tekko
escha_tables[15][27300] = { ['A']=expand_stats({STR=10, DEX=10, Acc=15}), ['B']=expand_stats({HP=50, Acc=15, Atk=15}), ['C']=expand_stats({HP=50, STP=4, SubtleBlow=7}), ['D']=expand_stats({Acc=20, STP=4, PDT=-3}) } -- Ryuo Hakama
escha_tables[15][27471] = { ['A']=expand_stats({STR=10, DEX=10, Acc=15}), ['B']=expand_stats({HP=50, Acc=15, Atk=15}), ['C']=expand_stats({HP=50, STP=4, SubtleBlow=7}), ['D']=expand_stats({STR=10, Atk=20, Crit=3}) } -- Ryuo Sune-Ate
escha_tables[15][25612] = { ['A']=expand_stats({STR=12, DEX=12, Acc=20}), ['B']=expand_stats({HP=65, Acc=20, Atk=20}), ['C']=expand_stats({HP=65, STP=5, SubtleBlow=8}), ['D']=expand_stats({NinSkill=20, Macc=25, MAB=25}) } -- Ryuo Somen +1
escha_tables[15][25685] = { ['A']=expand_stats({STR=12, DEX=12, Acc=20}), ['B']=expand_stats({HP=65, Acc=20, Atk=20}), ['C']=expand_stats({HP=65, STP=5, SubtleBlow=8}), ['D']=expand_stats({HP=65, STP=8, DA=4}) } -- Ryuo Domaru +1
escha_tables[15][27116] = { ['A']=expand_stats({STR=12, DEX=12, Acc=20}), ['B']=expand_stats({HP=65, Acc=20, Atk=20}), ['C']=expand_stats({HP=65, STP=5, SubtleBlow=8}), ['D']=expand_stats({DEX=12, Acc=25, DA=4}) } -- Ryuo Tekko +1
escha_tables[15][27301] = { ['A']=expand_stats({STR=12, DEX=12, Acc=20}), ['B']=expand_stats({HP=65, Acc=20, Atk=20}), ['C']=expand_stats({HP=65, STP=5, SubtleBlow=8}), ['D']=expand_stats({Acc=25, STP=5, PDT=-4}) } -- Ryuo Hakama +1
escha_tables[15][27472] = { ['A']=expand_stats({STR=12, DEX=12, Acc=20}), ['B']=expand_stats({HP=65, Acc=20, Atk=20}), ['C']=expand_stats({HP=65, STP=5, SubtleBlow=8}), ['D']=expand_stats({STR=12, Atk=25, Crit=4}) } -- Ryuo Sune-Ate +1

-- ==============================================================================
-- SOUVERAN SET (Rank 15)
-- ==============================================================================
escha_tables[15][26670] = { ['A']=expand_stats({Acc=10, Atk=10, Enmity=4}), ['B']=expand_stats({HP=50, STR=10, Acc=10}), ['C']=expand_stats({HP=80, Enmity=7, CureRx=10}), ['D']=expand_stats({HP=80, VIT=10, PDT=-3}) } -- Souveran Schaller
escha_tables[15][26846] = { ['A']=expand_stats({Acc=10, Atk=10, Enmity=4}), ['B']=expand_stats({HP=50, STR=10, Acc=10}), ['C']=expand_stats({HP=80, Enmity=7, CureRx=10}), ['D']=expand_stats({VIT=10, Atk=20, Refresh=2}) } -- Souveran Cuirass
escha_tables[15][27022] = { ['A']=expand_stats({Acc=10, Atk=10, Enmity=4}), ['B']=expand_stats({HP=50, STR=10, Acc=10}), ['C']=expand_stats({HP=80, Enmity=7, CureRx=10}), ['D']=expand_stats({HP=50, ShieldSkill=10, PDT=-3}) } -- Souveran Handschuhs
escha_tables[15][27198] = { ['A']=expand_stats({Acc=10, Atk=10, Enmity=4}), ['B']=expand_stats({HP=50, STR=10, Acc=10}), ['C']=expand_stats({HP=80, Enmity=7, CureRx=10}), ['D']=expand_stats({STR=10, VIT=10, Acc=15}) } -- Souveran Diechlings
escha_tables[15][27374] = { ['A']=expand_stats({Acc=10, Atk=10, Enmity=4}), ['B']=expand_stats({HP=50, STR=10, Acc=10}), ['C']=expand_stats({HP=80, Enmity=7, CureRx=10}), ['D']=expand_stats({HP=50, Atk=20, MDT=-3}) } -- Souveran Schuhs
escha_tables[15][26671] = { ['A']=expand_stats({Acc=13, Atk=12, Enmity=5}), ['B']=expand_stats({HP=65, STR=13, Acc=13}), ['C']=expand_stats({HP=105, Enmity=9, CureRx=15}), ['D']=expand_stats({HP=105, VIT=12, PDT=-4}) } -- Souveran Schaller +1
escha_tables[15][26847] = { ['A']=expand_stats({Acc=13, Atk=12, Enmity=5}), ['B']=expand_stats({HP=65, STR=13, Acc=13}), ['C']=expand_stats({HP=105, Enmity=9, CureRx=15}), ['D']=expand_stats({VIT=12, Atk=25, Refresh=3}) } -- Souveran Cuirass +1
escha_tables[15][27023] = { ['A']=expand_stats({Acc=13, Atk=12, Enmity=5}), ['B']=expand_stats({HP=65, STR=13, Acc=13}), ['C']=expand_stats({HP=105, Enmity=9, CureRx=15}), ['D']=expand_stats({HP=65, ShieldSkill=15, PDT=-4}) } -- Souveran Handschuhs +1
escha_tables[15][27199] = { ['A']=expand_stats({Acc=13, Atk=12, Enmity=5}), ['B']=expand_stats({HP=65, STR=13, Acc=13}), ['C']=expand_stats({HP=105, Enmity=9, CureRx=15}), ['D']=expand_stats({STR=12, VIT=12, Acc=20}) } -- Souveran Diechlings +1
escha_tables[15][27375] = { ['A']=expand_stats({Acc=13, Atk=12, Enmity=5}), ['B']=expand_stats({HP=65, STR=13, Acc=13}), ['C']=expand_stats({HP=105, Enmity=9, CureRx=15}), ['D']=expand_stats({HP=65, Atk=25, MDT=-4}) } -- Souveran Schuhs +1

-- ==============================================================================
-- EMICHO SET (Rank 15)
-- ==============================================================================
escha_tables[15][25609] = { ['A']=expand_stats({HP=50, STR=10, Atk=15}), ['B']=expand_stats({HP=50, DEX=10, Acc=15}), ['C']=expand_stats({PetAcc=15, PetAtk=15, PetDA=3}), ['D']=expand_stats({Atk=20, STP=6, PetSTR=15}) } -- Emicho Coronet
escha_tables[15][25682] = { ['A']=expand_stats({HP=50, STR=10, Atk=15}), ['B']=expand_stats({HP=50, DEX=10, Acc=15}), ['C']=expand_stats({PetAcc=15, PetAtk=15, PetDA=3}), ['D']=expand_stats({PetHP=100, PetINT=15, PetRegen=2}) } -- Emicho Haubert
escha_tables[15][27113] = { ['A']=expand_stats({HP=50, STR=10, Atk=15}), ['B']=expand_stats({HP=50, DEX=10, Acc=15}), ['C']=expand_stats({PetAcc=15, PetAtk=15, PetDA=3}), ['D']=expand_stats({Acc=20, DualWield=5, PetAcc=20}) } -- Emicho Gauntlets
escha_tables[15][27298] = { ['A']=expand_stats({HP=50, STR=10, Atk=15}), ['B']=expand_stats({HP=50, DEX=10, Acc=15}), ['C']=expand_stats({PetAcc=15, PetAtk=15, PetDA=3}), ['D']=expand_stats({STR=10, Acc=20, Atk=20}) } -- Emicho Hose
escha_tables[15][27469] = { ['A']=expand_stats({HP=50, STR=10, Atk=15}), ['B']=expand_stats({HP=50, DEX=10, Acc=15}), ['C']=expand_stats({PetAcc=15, PetAtk=15, PetDA=3}), ['D']=expand_stats({Atk=20, SubtleBlow=4, PetAtk=25}) } -- Emicho Gambieras
escha_tables[15][25610] = { ['A']=expand_stats({HP=65, STR=12, Atk=20}), ['B']=expand_stats({HP=65, DEX=12, Acc=20}), ['C']=expand_stats({PetAcc=20, PetAtk=20, PetDA=4}), ['D']=expand_stats({Atk=25, STP=7, PetSTR=20}) } -- Emicho Coronet +1
escha_tables[15][25683] = { ['A']=expand_stats({HP=65, STR=12, Atk=20}), ['B']=expand_stats({HP=65, DEX=12, Acc=20}), ['C']=expand_stats({PetAcc=20, PetAtk=20, PetDA=4}), ['D']=expand_stats({PetHP=125, PetINT=20, PetRegen=3}) } -- Emicho Haubert +1
escha_tables[15][27114] = { ['A']=expand_stats({HP=65, STR=12, Atk=20}), ['B']=expand_stats({HP=65, DEX=12, Acc=20}), ['C']=expand_stats({PetAcc=20, PetAtk=20, PetDA=4}), ['D']=expand_stats({Acc=25, DualWield=6, PetAcc=25}) } -- Emicho Gauntlets +1
escha_tables[15][27299] = { ['A']=expand_stats({HP=65, STR=12, Atk=20}), ['B']=expand_stats({HP=65, DEX=12, Acc=20}), ['C']=expand_stats({PetAcc=20, PetAtk=20, PetDA=4}), ['D']=expand_stats({STR=12, Acc=25, Atk=25}) } -- Emicho Hose +1
escha_tables[15][27470] = { ['A']=expand_stats({HP=65, STR=12, Atk=20}), ['B']=expand_stats({HP=65, DEX=12, Acc=20}), ['C']=expand_stats({PetAcc=20, PetAtk=20, PetDA=4}), ['D']=expand_stats({Atk=25, SubtleBlow=5, PetAtk=30}) } -- Emicho Gambieras +1

-- ==============================================================================
-- KAYKAUS SET (Rank 15)
-- ==============================================================================
escha_tables[15][25617] = { ['A']=expand_stats({MP=60, MND=10, Macc=15}), ['B']=expand_stats({MP=60, CureCast=-5, Enmity=-5}), ['C']=expand_stats({MP=60, SIRD=-10, CureCast=-5}), ['D']=expand_stats({MND=10, Macc=15, MAB=15}) } -- Kaykaus Mitra
escha_tables[15][25690] = { ['A']=expand_stats({MP=60, MND=10, Macc=15}), ['B']=expand_stats({MP=60, CureCast=-5, Enmity=-5}), ['C']=expand_stats({MP=60, SIRD=-10, CureCast=-5}), ['D']=expand_stats({MP=60, CurePot=5, ConserveMP=6}) } -- Kaykaus Bliaut
escha_tables[15][27121] = { ['A']=expand_stats({MP=60, MND=10, Macc=15}), ['B']=expand_stats({MP=60, CureCast=-5, Enmity=-5}), ['C']=expand_stats({MP=60, SIRD=-10, CureCast=-5}), ['D']=expand_stats({MP=60, ConserveMP=6, FastCast=3}) } -- Kaykaus Cuffs
escha_tables[15][27306] = { ['A']=expand_stats({MP=60, MND=10, Macc=15}), ['B']=expand_stats({MP=60, CureCast=-5, Enmity=-5}), ['C']=expand_stats({MP=60, SIRD=-10, CureCast=-5}), ['D']=expand_stats({INT=10, MAB=15, Enmity=-5}) } -- Kaykaus Tights
escha_tables[15][27477] = { ['A']=expand_stats({MP=60, MND=10, Macc=15}), ['B']=expand_stats({MP=60, CureCast=-5, Enmity=-5}), ['C']=expand_stats({MP=60, SIRD=-10, CureCast=-5}), ['D']=expand_stats({Macc=15, CurePot=5, FastCast=3}) } -- Kaykaus Boots
escha_tables[15][25618] = { ['A']=expand_stats({MP=80, MND=12, Macc=20}), ['B']=expand_stats({MP=80, CureCast=-7, Enmity=-6}), ['C']=expand_stats({MP=80, SIRD=-12, CureCast=-7}), ['D']=expand_stats({MND=12, Macc=20, MAB=20}) } -- Kaykaus Mitra +1
escha_tables[15][25691] = { ['A']=expand_stats({MP=80, MND=12, Macc=20}), ['B']=expand_stats({MP=80, CureCast=-7, Enmity=-6}), ['C']=expand_stats({MP=80, SIRD=-12, CureCast=-7}), ['D']=expand_stats({MP=80, CurePot=6, ConserveMP=7}) } -- Kaykaus Bliaut +1
escha_tables[15][27122] = { ['A']=expand_stats({MP=80, MND=12, Macc=20}), ['B']=expand_stats({MP=80, CureCast=-7, Enmity=-6}), ['C']=expand_stats({MP=80, SIRD=-12, CureCast=-7}), ['D']=expand_stats({MP=80, ConserveMP=7, FastCast=4}) } -- Kaykaus Cuffs +1
escha_tables[15][27307] = { ['A']=expand_stats({MP=80, MND=12, Macc=20}), ['B']=expand_stats({MP=80, CureCast=-7, Enmity=-6}), ['C']=expand_stats({MP=80, SIRD=-12, CureCast=-7}), ['D']=expand_stats({INT=12, MAB=20, Enmity=-6}) } -- Kaykaus Tights +1
escha_tables[15][27478] = { ['A']=expand_stats({MP=80, MND=12, Macc=20}), ['B']=expand_stats({MP=80, CureCast=-7, EnEnmity=-6}), ['C']=expand_stats({MP=80, SIRD=-12, CureCast=-7}), ['D']=expand_stats({Macc=20, CurePot=6, FastCast=4}) } -- Kaykaus Boots +1

-- ==============================================================================
-- RAO SET (Rank 15)
-- ==============================================================================
escha_tables[15][26674] = { ['A']=expand_stats({Acc=10, Atk=10, Eva=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({PetHP=100, PetAcc=15, PetDT=-3}), ['D']=expand_stats({VIT=10, Atk=20, Counter=3}) } -- Rao Kabuto
escha_tables[15][26850] = { ['A']=expand_stats({Acc=10, Atk=10, Eva=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({PetHP=100, PetAcc=15, PetDT=-3}), ['D']=expand_stats({Atk=15, SubtleBlow=7, PDT=-3}) } -- Rao Togi
escha_tables[15][27026] = { ['A']=expand_stats({Acc=10, Atk=10, Eva=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({PetHP=100, PetAcc=15, PetDT=-3}), ['D']=expand_stats({MND=10, Meva=15, MDT=-3}) } -- Rao Kote
escha_tables[15][27202] = { ['A']=expand_stats({Acc=10, Atk=10, Eva=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({PetHP=100, PetAcc=15, PetDT=-3}), ['D']=expand_stats({Acc=20, DA=3, PetAcc=20}) } -- Rao Haidate
escha_tables[15][27378] = { ['A']=expand_stats({Acc=10, Atk=10, Eva=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({PetHP=100, PetAcc=15, PetDT=-3}), ['D']=expand_stats({HP=50, Crit=3, DA=2}) } -- Rao Sune-Ate
escha_tables[15][26675] = { ['A']=expand_stats({Acc=12, Atk=12, Eva=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({PetHP=125, PetAcc=20, PetDT=-4}), ['D']=expand_stats({VIT=12, Atk=25, Counter=4}) } -- Rao Kabuto +1
escha_tables[15][26851] = { ['A']=expand_stats({Acc=12, Atk=12, Eva=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({PetHP=125, PetAcc=20, PetDT=-4}), ['D']=expand_stats({Atk=20, SubtleBlow=8, PDT=-4}) } -- Rao Togi +1
escha_tables[15][27027] = { ['A']=expand_stats({Acc=12, Atk=12, Eva=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({PetHP=125, PetAcc=20, PetDT=-4}), ['D']=expand_stats({MND=12, Meva=20, MDT=-5}) } -- Rao Kote +1
escha_tables[15][27203] = { ['A']=expand_stats({Acc=12, Atk=12, Eva=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({PetHP=125, PetAcc=20, PetDT=-4}), ['D']=expand_stats({Acc=25, DA=4, PetAcc=25}) } -- Rao Haidate +1
escha_tables[15][27379] = { ['A']=expand_stats({Acc=12, Atk=12, Eva=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({PetHP=125, PetAcc=20, PetDT=-4}), ['D']=expand_stats({HP=65, Crit=4, DA=4}) } -- Rao Sune-Ate +1

-- ==============================================================================
-- ADHEMAR SET (Rank 15)
-- ==============================================================================
escha_tables[15][25613] = { ['A']=expand_stats({AGI=10, DEX=10, Acc=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=15}), ['D']=expand_stats({HP=80, Atk=10, PDT=-3}) } -- Adhemar Bonnet
escha_tables[15][25686] = { ['A']=expand_stats({AGI=10, DEX=10, Acc=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=15}), ['D']=expand_stats({HP=80, FastCast=7, MDT=-3}) } -- Adhemar Jacket
escha_tables[15][27117] = { ['A']=expand_stats({AGI=10, DEX=10, Acc=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=15}), ['D']=expand_stats({AGI=10, RapidShot=10, Enmity=-5}) } -- Adhemar Wristbands
escha_tables[15][27302] = { ['A']=expand_stats({AGI=10, DEX=10, Acc=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=15}), ['D']=expand_stats({AGI=10, RapidShot=10, Enmity=-5}) } -- Adhemar Kecks
escha_tables[15][27473] = { ['A']=expand_stats({AGI=10, DEX=10, Acc=15}), ['B']=expand_stats({STR=10, DEX=10, Atk=15}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=15}), ['D']=expand_stats({HP=50, STP=6, Snapshot=8}) } -- Adhemar Gamashes
escha_tables[15][25614] = { ['A']=expand_stats({AGI=12, DEX=12, Acc=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({AGI=12, Racc=20, Ratk=20}), ['D']=expand_stats({HP=105, Atk=13, PDT=-4}) } -- Adhemar Bonnet +1
escha_tables[15][25687] = { ['A']=expand_stats({AGI=12, DEX=12, Acc=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({AGI=12, Racc=20, Ratk=20}), ['D']=expand_stats({HP=105, FastCast=10, MDT=-4}) } -- Adhemar Jacket +1
escha_tables[15][27118] = { ['A']=expand_stats({AGI=12, DEX=12, Acc=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({AGI=12, Racc=20, Ratk=20}), ['D']=expand_stats({Acc=20, Atk=20, SubtleBlow=8}) } -- Adhemar Wristbands +1
escha_tables[15][27303] = { ['A']=expand_stats({AGI=12, DEX=12, Acc=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({AGI=12, Racc=20, Ratk=20}), ['D']=expand_stats({AGI=12, RapidShot=13, Enmity=-6}) } -- Adhemar Kecks +1
escha_tables[15][27474] = { ['A']=expand_stats({AGI=12, DEX=12, Acc=20}), ['B']=expand_stats({STR=12, DEX=12, Atk=20}), ['C']=expand_stats({AGI=12, Racc=20, Ratk=20}), ['D']=expand_stats({HP=65, STP=7, Snapshot=10}) } -- Adhemar Gamashes +1

-- ==============================================================================
-- CARMINE SET (Rank 15)
-- ==============================================================================
escha_tables[15][26678] = { ['A']=expand_stats({HP=60, STR=10, INT=10}), ['B']=expand_stats({Acc=10, DEX=10, MND=15}), ['C']=expand_stats({MP=60, INT=10, MND=10}), ['D']=expand_stats({Acc=15, Macc=10, FastCast=3}) } -- Carmine Mask
escha_tables[15][26854] = { ['A']=expand_stats({HP=60, STR=10, INT=10}), ['B']=expand_stats({Acc=10, DEX=10, MND=15}), ['C']=expand_stats({MP=60, INT=10, MND=10}), ['D']=expand_stats({Atk=15, MAB=10, DA=2}) } -- Carmine Scale Mail
escha_tables[15][27030] = { ['A']=expand_stats({HP=60, STR=10, INT=10}), ['B']=expand_stats({Acc=10, DEX=10, MND=15}), ['C']=expand_stats({MP=60, INT=10, MND=10}), ['D']=expand_stats({Ratk=15, MAB=10, STP=5}) } -- Carmine Finger Gauntlets
escha_tables[15][27206] = { ['A']=expand_stats({HP=60, STR=10, INT=10}), ['B']=expand_stats({Acc=10, DEX=10, MND=15}), ['C']=expand_stats({MP=60, INT=10, MND=10}), ['D']=expand_stats({Acc=15, Atk=10, DualWield=5}) } -- Carmine Cuisses
escha_tables[15][27382] = { ['A']=expand_stats({HP=60, STR=10, INT=10}), ['B']=expand_stats({Acc=10, DEX=10, MND=15}), ['C']=expand_stats({MP=60, INT=10, MND=10}), ['D']=expand_stats({HP=60, MP=60, PDT=-3}) } -- Carmine Greaves
escha_tables[15][26679] = { ['A']=expand_stats({HP=80, STR=12, INT=12}), ['B']=expand_stats({Acc=12, DEX=12, MND=20}), ['C']=expand_stats({MP=80, INT=12, MND=12}), ['D']=expand_stats({Acc=20, Macc=12, FastCast=4}) } -- Carmine Mask +1
escha_tables[15][26855] = { ['A']=expand_stats({HP=80, STR=12, INT=12}), ['B']=expand_stats({Acc=12, DEX=12, MND=20}), ['C']=expand_stats({MP=80, INT=12, MND=12}), ['D']=expand_stats({Atk=20, MAB=12, DA=4}) } -- Carmine Scale Mail +1
escha_tables[15][27031] = { ['A']=expand_stats({HP=80, STR=12, INT=12}), ['B']=expand_stats({Acc=12, DEX=12, MND=20}), ['C']=expand_stats({MP=80, INT=12, MND=12}), ['D']=expand_stats({Ratk=20, MAB=12, STP=6}) } -- Carmine Finger Gauntlets +1
escha_tables[15][27207] = { ['A']=expand_stats({HP=80, STR=12, INT=12}), ['B']=expand_stats({Acc=12, DEX=12, MND=20}), ['C']=expand_stats({MP=80, INT=12, MND=12}), ['D']=expand_stats({Acc=20, Atk=12, DualWield=6}) } -- Carmine Cuisses +1
escha_tables[15][27383] = { ['A']=expand_stats({HP=80, STR=12, INT=12}), ['B']=expand_stats({Acc=12, DEX=12, MND=20}), ['C']=expand_stats({MP=80, INT=12, MND=12}), ['D']=expand_stats({HP=80, MP=80, PDT=-4}) } -- Carmine Greaves +1

-- ==============================================================================
-- LUSTRATIO SET (Rank 15)
-- ==============================================================================
escha_tables[15][26668] = { ['A']=expand_stats({Atk=15, STR=5, DA=2}), ['B']=expand_stats({Acc=15, DEX=5, Crit=2}), ['C']=expand_stats({Acc=8, STP=4, Atk=8}), ['D']=expand_stats({INT=30, STR=5, DEX=5}) } -- Lustratio Cap
escha_tables[15][26844] = { ['A']=expand_stats({Atk=15, STR=5, DA=2}), ['B']=expand_stats({Acc=15, DEX=5, Crit=2}), ['C']=expand_stats({Acc=8, STP=4, Atk=8}), ['D']=expand_stats({Acc=8, Atk=10, DA=2}) } -- Lustratio Harness
escha_tables[15][27020] = { ['A']=expand_stats({Atk=15, STR=5, DA=2}), ['B']=expand_stats({Acc=15, DEX=5, Crit=2}), ['C']=expand_stats({Acc=8, STP=4, Atk=8}), ['D']=expand_stats({Acc=25, VIT=10, DEX=7}) } -- Lustratio Mittens
escha_tables[15][27196] = { ['A']=expand_stats({Atk=15, STR=5, DA=2}), ['B']=expand_stats({Acc=15, DEX=5, Crit=2}), ['C']=expand_stats({Acc=8, STP=4, Atk=8}), ['D']=expand_stats({HP=50, Atk=25, Enmity=-5}) } -- Lustratio Subligar
escha_tables[15][27372] = { ['A']=expand_stats({Atk=15, STR=5, DA=2}), ['B']=expand_stats({Acc=15, DEX=5, Crit=2}), ['C']=expand_stats({Acc=8, STP=4, Atk=8}), ['D']=expand_stats({HP=50, STR=10, DEX=10}) } -- Lustratio Leggings
escha_tables[15][26669] = { ['A']=expand_stats({Atk=20, STR=8, DA=3}), ['B']=expand_stats({Acc=20, DEX=8, Crit=3}), ['C']=expand_stats({Acc=10, STP=5, Atk=10}), ['D']=expand_stats({STR=8, DEX=8, INT=35}) } -- Lustratio Cap +1
escha_tables[15][26845] = { ['A']=expand_stats({Atk=20, STR=8, DA=3}), ['B']=expand_stats({Acc=20, DEX=8, Crit=3}), ['C']=expand_stats({Acc=10, STP=5, Atk=10}), ['D']=expand_stats({Acc=10, Atk=13, DA=4}) } -- Lustratio Harness +1
escha_tables[15][27021] = { ['A']=expand_stats({Atk=20, STR=8, DA=3}), ['B']=expand_stats({Acc=20, DEX=8, Crit=3}), ['C']=expand_stats({Acc=10, STP=5, Atk=10}), ['D']=expand_stats({Acc=30, VIT=13, DEX=10}) } -- Lustratio Mittens +1
escha_tables[15][27197] = { ['A']=expand_stats({Atk=20, STR=8, DA=3}), ['B']=expand_stats({Acc=20, DEX=8, Crit=3}), ['C']=expand_stats({Acc=10, STP=5, Atk=10}), ['D']=expand_stats({HP=65, Atk=30, Enmity=-6}) } -- Lustratio Subligar +1
escha_tables[15][27373] = { ['A']=expand_stats({Atk=20, STR=8, DA=3}), ['B']=expand_stats({Acc=20, DEX=8, Crit=3}), ['C']=expand_stats({Acc=10, STP=5, Atk=10}), ['D']=expand_stats({HP=65, STR=15, DEX=15}) } -- Lustratio Leggings +1

-- ==============================================================================
-- ARGOSY SET (Rank 15)
-- ==============================================================================
escha_tables[15][26672] = { ['A']=expand_stats({STR=10, DEX=10, Atk=15}), ['B']=expand_stats({HP=50, Acc=10, Atk=15}), ['C']=expand_stats({HP=50, STR=12, PDT=-3}), ['D']=expand_stats({DEX=10, Acc=15, DA=2}) } -- Argosy Celata
escha_tables[15][26848] = { ['A']=expand_stats({STR=10, DEX=10, Atk=15}), ['B']=expand_stats({HP=50, Acc=10, Atk=15}), ['C']=expand_stats({HP=50, STR=12, PDT=-3}), ['D']=expand_stats({STR=10, Atk=15, STP=5}) } -- Argosy Hauberk
escha_tables[15][27024] = { ['A']=expand_stats({STR=10, DEX=10, Atk=15}), ['B']=expand_stats({HP=50, Acc=10, Atk=15}), ['C']=expand_stats({HP=50, STR=12, PDT=-3}), ['D']=expand_stats({STR=15, DA=2, Haste=2}) } -- Argosy Mufflers
escha_tables[15][27200] = { ['A']=expand_stats({STR=10, DEX=10, Atk=15}), ['B']=expand_stats({HP=50, Acc=10, Atk=15}), ['C']=expand_stats({HP=50, STR=12, PDT=-3}), ['D']=expand_stats({STR=10, Atk=20, STP=5}) } -- Argosy Breeches
escha_tables[15][27376] = { ['A']=expand_stats({STR=10, DEX=10, Atk=15}), ['B']=expand_stats({HP=50, Acc=10, Atk=15}), ['C']=expand_stats({HP=50, STR=12, PDT=-3}), ['D']=expand_stats({HP=60, DA=2, STP=3}) } -- Argosy Sollerets
escha_tables[15][26673] = { ['A']=expand_stats({STR=12, DEX=12, Atk=20}), ['B']=expand_stats({HP=65, Acc=13, Atk=20}), ['C']=expand_stats({HP=65, STR=15, PDT=-4}), ['D']=expand_stats({DEX=12, Acc=20, DA=3}) } -- Argosy Celata +1
escha_tables[15][26849] = { ['A']=expand_stats({STR=12, DEX=12, Atk=20}), ['B']=expand_stats({HP=65, Acc=13, Atk=20}), ['C']=expand_stats({HP=65, STR=15, PDT=-4}), ['D']=expand_stats({STR=12, Atk=20, STP=6}) } -- Argosy Hauberk +1
escha_tables[15][27025] = { ['A']=expand_stats({STR=12, DEX=12, Atk=20}), ['B']=expand_stats({HP=65, Acc=13, Atk=20}), ['C']=expand_stats({HP=65, STR=15, PDT=-4}), ['D']=expand_stats({STR=20, DA=3, Haste=3}) } -- Argosy Mufflers +1
escha_tables[15][27201] = { ['A']=expand_stats({STR=12, DEX=12, Atk=20}), ['B']=expand_stats({HP=65, Acc=13, Atk=20}), ['C']=expand_stats({HP=65, STR=15, PDT=-4}), ['D']=expand_stats({STR=12, Atk=25, STP=6}) } -- Argosy Breeches +1
escha_tables[15][27377] = { ['A']=expand_stats({STR=12, DEX=12, Atk=20}), ['B']=expand_stats({HP=65, Acc=13, Atk=20}), ['C']=expand_stats({HP=65, STR=15, PDT=-4}), ['D']=expand_stats({HP=65, DA=3, STP=5}) } -- Argosy Sollerets +1

-- ==============================================================================
-- AMALRIC SET (Rank 15)
-- ==============================================================================
escha_tables[15][25615] = { ['A']=expand_stats({MP=60, Macc=15, MAB=15}), ['B']=expand_stats({MP=60, INT=10, Enmity=-5}), ['C']=expand_stats({INT=10, ElemSkill=15, DarkSkill=15}), ['D']=expand_stats({INT=10, Macc=20, Enmity=-5}) } -- Amalric Coif
escha_tables[15][25688] = { ['A']=expand_stats({MP=60, Macc=15, MAB=15}), ['B']=expand_stats({MP=60, INT=10, Enmity=-5}), ['C']=expand_stats({INT=10, ElemSkill=15, DarkSkill=15}), ['D']=expand_stats({MP=60, MAB=20, FastCast=3}) } -- Amalric Doublet
escha_tables[15][27119] = { ['A']=expand_stats({MP=60, Macc=15, MAB=15}), ['B']=expand_stats({MP=60, INT=10, Enmity=-5}), ['C']=expand_stats({INT=10, ElemSkill=15, DarkSkill=15}), ['D']=expand_stats({INT=10, Macc=15, MAB=15}) } -- Amalric Gages
escha_tables[15][27304] = { ['A']=expand_stats({MP=60, Macc=15, MAB=15}), ['B']=expand_stats({MP=60, INT=10, Enmity=-5}), ['C']=expand_stats({INT=10, ElemSkill=15, DarkSkill=15}), ['D']=expand_stats({MP=60, MAB=20, Enmity=-5}) } -- Amalric Slops
escha_tables[15][27475] = { ['A']=expand_stats({MP=60, Macc=15, MAB=15}), ['B']=expand_stats({MP=60, INT=10, Enmity=-5}), ['C']=expand_stats({INT=10, ElemSkill=15, DarkSkill=15}), ['D']=expand_stats({Macc=15, MAB=15, ConserveMP=6}) } -- Amalric Nails
escha_tables[15][25616] = { ['A']=expand_stats({MP=80, Macc=20, MAB=20}), ['B']=expand_stats({MP=80, INT=12, Enmity=-6}), ['C']=expand_stats({INT=12, ElemSkill=20, DarkSkill=20}), ['D']=expand_stats({INT=12, Macc=25, Enmity=-6}) } -- Amalric Coif +1
escha_tables[15][25689] = { ['A']=expand_stats({MP=80, Macc=20, MAB=20}), ['B']=expand_stats({MP=80, INT=12, Enmity=-6}), ['C']=expand_stats({INT=12, ElemSkill=20, DarkSkill=20}), ['D']=expand_stats({MP=80, MAB=25, FastCast=4}) } -- Amalric Doublet +1
escha_tables[15][27120] = { ['A']=expand_stats({MP=80, Macc=20, MAB=20}), ['B']=expand_stats({MP=80, INT=12, Enmity=-6}), ['C']=expand_stats({INT=12, ElemSkill=20, DarkSkill=20}), ['D']=expand_stats({INT=12, Macc=20, MAB=20}) } -- Amalric Gages +1
escha_tables[15][27305] = { ['A']=expand_stats({MP=80, Macc=20, MAB=20}), ['B']=expand_stats({MP=80, INT=12, Enmity=-6}), ['C']=expand_stats({INT=12, ElemSkill=20, DarkSkill=20}), ['D']=expand_stats({MP=80, MAB=25, Enmity=-6}) } -- Amalric Slops +1
escha_tables[15][27476] = { ['A']=expand_stats({MP=80, Macc=20, MAB=20}), ['B']=expand_stats({MP=80, INT=12, Enmity=-6}), ['C']=expand_stats({INT=12, ElemSkill=20, DarkSkill=20}), ['D']=expand_stats({Macc=20, MAB=20, ConserveMP=7}) } -- Amalric Nails +1

-- ==============================================================================
-- NIBIRU WEAPONS (Rank 15)
-- ==============================================================================
escha_tables[15][20983] = { ['A']=expand_stats({Atk=15, Acc=15, Racc=15}), ['B']=expand_stats({Acc=15, Racc=15, STP=5}), ['C']=expand_stats({INT=7, Macc=15, MAB=15}), ['D']=expand_stats({Eva=20, Meva=20, Enmity=4}) } -- Mijin
escha_tables[15][20710] = { ['A']=expand_stats({DEX=10, Acc=20, Macc=15}), ['B']=expand_stats({STR=10, Atk=20, STP=3}), ['C']=expand_stats({Macc=15, MAB=15, Meva=20}), ['D']=expand_stats({HP=50, DA=3, FastCast=5}) } -- Nibiru Blade
escha_tables[15][21216] = { ['A']=expand_stats({AGI=10, Racc=25, Enmity=-6}), ['B']=expand_stats({HP=50, Ratk=25, RapidShot=10}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=15}), ['D']=expand_stats({Ratk=20, Recycle=15, STP=5}) } -- Nibiru Bow
escha_tables[15][20848] = { ['A']=expand_stats({HP=50, STR=10, Acc=25}), ['B']=expand_stats({Atk=20, Enmity=4, DA=3}), ['C']=expand_stats({VIT=10, Eva=20, Counter=3}), ['D']=expand_stats({HP=80, Enmity=7, PDT=-3}) } -- Nibiru Chopper
escha_tables[15][21092] = { ['A']=expand_stats({MND=10, Macc=15, CurePot=15}), ['B']=expand_stats({MP=50, INT=10, MAB=15}), ['C']=expand_stats({Acc=15, Macc=15, FastCast=3}), ['D']=expand_stats({MP=50, PetDT=-3, PetRegen=2}) } -- Nibiru Cudgel
escha_tables[15][21699] = { ['A']=expand_stats({STR=10, Atk=25, Macc=15}), ['B']=expand_stats({Acc=10, Atk=15, STP=5}), ['C']=expand_stats({Eva=20, Meva=20, FastCast=5}), ['D']=expand_stats({VIT=10, Acc=25, PDT=-4}) } -- Nibiru Faussar
escha_tables[15][21273] = { ['A']=expand_stats({STR=10, Racc=15, STP=3}), ['B']=expand_stats({HP=50, AGI=10, Racc=20}), ['C']=expand_stats({STR=10, Racc=15, Ratk=15}), ['D']=expand_stats({STR=15, AGI=7, STP=5}) } -- Nibiru Gun
escha_tables[15][21399] = { ['A']=expand_stats({MP=50, Macc=10, AllSongs=2}), ['B']=expand_stats({HP=50, CHR=10, AllSongs=2}), ['C']=expand_stats({MP=50, CurePot=5, AllSongs=2}), ['D']=expand_stats({Meva=20, PDT=-3, MDT=-3}) } -- Nibiru Harp
escha_tables[15][20600] = { ['A']=expand_stats({Acc=20, Atk=15, Eva=20}), ['B']=expand_stats({DEX=7, Atk=20, STP=3}), ['C']=expand_stats({STR=15, DEX=10, CHR=10}), ['D']=expand_stats({MP=50, Meva=20, FastCast=5}) } -- Nibiru Knife
escha_tables[15][20939] = { ['A']=expand_stats({STR=10, Acc=20, DA=3}), ['B']=expand_stats({HP=50, Acc=15, Atk=15}), ['C']=expand_stats({PetHP=100, PetAcc=20, PetAtk=20}), ['D']=expand_stats({Acc=20, PetAcc=20, STP=5}) } -- Nibiru Lance
escha_tables[15][20524] = { ['A']=expand_stats({Acc=25, STR=7, SubtleBlow=7}), ['B']=expand_stats({HP=50, Atk=20, STP=3}), ['C']=expand_stats({Eva=20, Enmity=7, PDT=-3}), ['D']=expand_stats({AutoMelee=20, AutoRanged=20, AutoMagic=20}) } -- Nibiru Sainti
escha_tables[15][27642] = { ['A']=expand_stats({HP=80, Enmity=7, PDT=-5}), ['B']=expand_stats({HP=80, MP=80, FastCast=7}), ['C']=expand_stats({MND=15, CurePot=5, CureRx=5}), ['D']=expand_stats({Acc=15, Atk=15, STP=5}) } -- Nibiru Shield
escha_tables[15][20895] = { ['A']=expand_stats({STR=10, Atk=25, INT=7}), ['B']=expand_stats({Atk=20, MAB=25, FastCast=5}), ['C']=expand_stats({Acc=20, Atk=15, STP=3}), ['D']=expand_stats({Macc=20, MAB=15, Refresh=1}) } -- Nibiru Sickle
escha_tables[15][21156] = { ['A']=expand_stats({MP=80, MAB=25, Enmity=-5}), ['B']=expand_stats({MDT=-3, MND=10, Macc=25}), ['C']=expand_stats({PetRegen=2, PetMacc=20, PetMAB=25}), ['D']=expand_stats({PetAcc=20, PetAtk=20, PetDA=3}) } -- Nibiru Staff
escha_tables[15][20801] = { ['A']=expand_stats({STR=10, Atk=20, PetAtk=20}), ['B']=expand_stats({Acc=15, Atk=15, STP=5}), ['C']=expand_stats({PetAtk=25, PetMAB=15, PetEnmity=7}), ['D']=expand_stats({CHR=15, PetHaste=3, PetDA=3}) } -- Nibiru Tabar
escha_tables[15][21031] = { ['A']=expand_stats({DEX=7, Acc=20, STP=5}), ['B']=expand_stats({Atk=15, SubtleBlow=7, DA=3}), ['C']=expand_stats({AGI=10, Racc=15, Ratk=20}), ['D']=expand_stats({Eva=20, Meva=20, PDT=-3}) } -- Sensui

-- ==============================================================================
-- ESCHA - RU'AUN WEAPONS (Rank 15)
-- ==============================================================================
escha_tables[15][20979] = { ['A']=expand_stats({Damage=15, STR=15, Atk=15}), ['B']=expand_stats({Damage=15, STR=15, Acc=10}), ['C']=expand_stats({Damage=15, Acc=15, Atk=15}), ['D']=expand_stats({Damage=17, Acc=15, Racc=15}) } -- Aizushintogo
escha_tables[15][21150] = { ['A']=expand_stats({MP=80, INT=20, MAB=20}), ['B']=expand_stats({MND=20, Macc=20, CurePot=10}), ['C']=expand_stats({INT=15, MAB=15, Macc=15}), ['D']=expand_stats({Macc=20, EnhSkill=15, EnfSkill=15}) } -- Akademos
escha_tables[15][21698] = { ['A']=expand_stats({Damage=30, STR=20, Atk=20}), ['B']=expand_stats({Damage=30, Acc=20, Atk=20}), ['C']=expand_stats({Damage=30, Atk=20, Enmity=7}), ['D']=expand_stats({Damage=32, STP=7, Enmity=7}) } -- Bidenhander
escha_tables[15][21482] = { ['A']=expand_stats({Damage=15, AGI=15, Ratk=15}), ['B']=expand_stats({Damage=15, AGI=15, Racc=15}), ['C']=expand_stats({Damage=15, Racc=15, Ratk=15}), ['D']=expand_stats({Damage=15, Ratk=15, MAB=15}) } -- Compensator
escha_tables[15][20892] = { ['A']=expand_stats({Damage=30, STR=20, Atk=20}), ['B']=expand_stats({Damage=30, Atk=20, STP=3}), ['C']=expand_stats({Damage=30, Atk=20, DarkSkill=15}), ['D']=expand_stats({Damage=32, MP=80, STR=20}) } -- Deathbane
escha_tables[15][20702] = { ['A']=expand_stats({Damage=15, Acc=15, Atk=15}), ['B']=expand_stats({Damage=15, Acc=15, Macc=15}), ['C']=expand_stats({Damage=15, Macc=15, MAB=15}), ['D']=expand_stats({Macc=15, MAB=20, Refresh=1}) } -- Emissary
escha_tables[15][20597] = { ['A']=expand_stats({Damage=15, STR=15, Atk=15}), ['B']=expand_stats({Damage=15, STR=15, Acc=10}), ['C']=expand_stats({Damage=15, DEX=15, SubtleBlow=7}), ['D']=expand_stats({Damage=17, Eva=15, Meva=15}) } -- Enchufla
escha_tables[15][21149] = { ['A']=expand_stats({Enmity=-6, PetMAB=30, PetDT=-4}), ['B']=expand_stats({SumSkill=15, PetMacc=30, PetDT=-4}), ['C']=expand_stats({MP=50, PetMAB=20, PetMacc=20}), ['D']=expand_stats({PetSTR=15, PetAtk=25, PetDA=4}) } -- Espiritus
escha_tables[15][20519] = { ['A']=expand_stats({Damage=15, STR=20, Atk=20}), ['B']=expand_stats({Damage=15, STR=20, Acc=15}), ['C']=expand_stats({Damage=15, Atk=20, Enmity=-5}), ['D']=expand_stats({Damage=17, HP=80, VIT=15}) } -- Hammerfists
escha_tables[15][21027] = { ['A']=expand_stats({Damage=30, STR=20, Atk=20}), ['B']=expand_stats({Damage=30, STR=20, Acc=15}), ['C']=expand_stats({Damage=30, Atk=20, Acc=20}), ['D']=expand_stats({AGI=20, Racc=25, Recycle=15}) } -- Ichigohitofuri
escha_tables[15][20845] = { ['A']=expand_stats({Damage=30, STR=20, Atk=20}), ['B']=expand_stats({Damage=30, STR=20, Acc=15}), ['C']=expand_stats({Damage=30, Atk=20, Acc=20}), ['D']=expand_stats({Damage=32, STR=15, VIT=15}) } -- Instigator
escha_tables[15][20701] = { ['A']=expand_stats({Damage=15, STR=15, Atk=15}), ['B']=expand_stats({Damage=15, STR=15, Acc=15}), ['C']=expand_stats({Damage=15, Atk=15, MAB=15}), ['D']=expand_stats({BlueSkill=15, Macc=15, MAB=15}) } -- Iris
escha_tables[15][20599] = { ['A']=expand_stats({Damage=15, CHR=15, Macc=15}), ['B']=expand_stats({Damage=15, CHR=15, Enmity=-5}), ['C']=expand_stats({MP=60, Macc=20, Refresh=1}), ['D']=expand_stats({Macc=15, StringSkill=10, WindSkill=10}) } -- Kali
escha_tables[15][21151] = { ['A']=expand_stats({MP=80, INT=20, MAB=20}), ['B']=expand_stats({MP=80, Macc=20, FastCast=5}), ['C']=expand_stats({INT=15, MAB=15, Macc=15}), ['D']=expand_stats({Macc=20, EnfSkill=15, DarkSkill=15}) } -- Lathi
escha_tables[15][20520] = { ['A']=expand_stats({Damage=15, STR=20, Atk=20}), ['B']=expand_stats({Damage=15, STR=20, Acc=20}), ['C']=expand_stats({Damage=15, PetAtk=25, PetHaste=3}), ['D']=expand_stats({PetAtk=25, PetAcc=25, PetDT=-3}) } -- Midnights
escha_tables[15][20700] = { ['A']=expand_stats({Damage=15, STR=15, Atk=15}), ['B']=expand_stats({Damage=15, STR=15, Acc=10}), ['C']=expand_stats({Damage=15, Acc=15, Atk=15}), ['D']=expand_stats({Damage=17, STR=15, VIT=15}) } -- Nixxer
escha_tables[15][21084] = { ['A']=expand_stats({MP=80, CurePot=15, Enmity=-5}), ['B']=expand_stats({MND=15, Macc=15, CurePot=15}), ['C']=expand_stats({MAB=15, Macc=15, CurePot=15}), ['D']=expand_stats({HealSkill=15, CurePot=10, CureCast=-7}) } -- Queller Rod
escha_tables[15][20937] = { ['A']=expand_stats({Damage=30, STR=20, Atk=20}), ['B']=expand_stats({Damage=30, STR=20, Acc=15}), ['C']=expand_stats({Damage=30, VIT=15, Atk=20}), ['D']=expand_stats({Damage=32, Atk=20, Enmity=-5}) } -- Rhomphaia
escha_tables[15][20598] = { ['A']=expand_stats({Damage=15, STR=15, Atk=15}), ['B']=expand_stats({Damage=15, STR=15, Acc=10}), ['C']=expand_stats({Damage=15, Acc=15, Atk=15}), ['D']=expand_stats({TA=2, DualWield=5, DEX=15}) } -- Shijo
escha_tables[15][20797] = { ['A']=expand_stats({Damage=15, STR=15, Atk=15}), ['B']=expand_stats({Damage=15, STR=15, Acc=15}), ['C']=expand_stats({Damage=15, PetAcc=20, PetAtk=20}), ['D']=expand_stats({Damage=15, PetMAB=15, PetRegen=2}) } -- Skullrender
escha_tables[15][21085] = { ['A']=expand_stats({MP=60, INT=15, MAB=15}), ['B']=expand_stats({MP=60, INT=15, Macc=15}), ['C']=expand_stats({INT=15, MAB=10, Refresh=1}), ['D']=expand_stats({Macc=20, PetDT=-4, FastCast=5}) } -- Solstice
escha_tables[15][21215] = { ['A']=expand_stats({Damage=15, AGI=15, Ratk=15}), ['B']=expand_stats({Damage=15, AGI=15, Racc=15}), ['C']=expand_stats({Damage=15, Racc=15, Ratk=15}), ['D']=expand_stats({Damage=15, Ratk=15, Crit=3}) } -- Vijaya Bow

-- ==============================================================================
-- DESPAIR SET (Rank 15)
-- ==============================================================================
escha_tables[15][26792] = { ['A']=expand_stats({HP=50, VIT=10, CureRx=5}), ['B']=expand_stats({STR=12, VIT=7, Haste=2}), ['C']=expand_stats({Acc=10, PetVIT=7, PetDT=-3}), ['D']=expand_stats({STR=15, Enmity=7, STP=3}) } -- Despair Helm
escha_tables[15][26948] = { ['A']=expand_stats({HP=50, VIT=10, CureRx=5}), ['B']=expand_stats({STR=12, VIT=7, Haste=2}), ['C']=expand_stats({Acc=10, PetVIT=7, PetDT=-3}), ['D']=expand_stats({Atk=25, Meva=20, DA=3}) } -- Despair Mail
escha_tables[15][27098] = { ['A']=expand_stats({HP=50, VIT=10, CureRx=5}), ['B']=expand_stats({STR=12, VIT=7, Haste=2}), ['C']=expand_stats({Acc=10, PetVIT=7, PetDT=-3}), ['D']=expand_stats({Racc=25, Ratk=20, Recycle=10}) } -- Despair Finger Gauntlets
escha_tables[15][27283] = { ['A']=expand_stats({HP=50, VIT=10, CureRx=5}), ['B']=expand_stats({STR=12, VIT=7, Haste=2}), ['C']=expand_stats({Acc=10, PetVIT=7, PetDT=-3}), ['D']=expand_stats({AGI=10, Eva=20, SubtleBlow=7}) } -- Despair Cuisses
escha_tables[15][27458] = { ['A']=expand_stats({HP=50, VIT=10, CureRx=5}), ['B']=expand_stats({STR=12, VIT=7, Haste=2}), ['C']=expand_stats({Acc=10, PetVIT=7, PetDT=-3}), ['D']=expand_stats({DEX=10, STR=7, PDT=-3}) } -- Despair Greaves

-- ==============================================================================
-- RAWHIDE SET (Rank 15)
-- ==============================================================================
escha_tables[15][26794] = { ['A']=expand_stats({DEX=10, STR=7, INT=7}), ['B']=expand_stats({HP=50, Acc=15, Eva=20}), ['C']=expand_stats({Acc=15, PetAcc=15, PetDA=3}), ['D']=expand_stats({Atk=15, PetMacc=20, PetMAB=15}) } -- Rawhide Mask
escha_tables[15][26950] = { ['A']=expand_stats({DEX=10, STR=7, INT=7}), ['B']=expand_stats({HP=50, Acc=15, Eva=20}), ['C']=expand_stats({Acc=15, PetAcc=15, PetDA=3}), ['D']=expand_stats({HP=50, SubtleBlow=7, TA=2}) } -- Rawhide Vest
escha_tables[15][27100] = { ['A']=expand_stats({DEX=10, STR=7, INT=7}), ['B']=expand_stats({HP=50, Acc=15, Eva=20}), ['C']=expand_stats({Acc=15, PetAcc=15, PetDA=3}), ['D']=expand_stats({Macc=15, INT=7, MND=7}) } -- Rawhide Gloves
escha_tables[15][27285] = { ['A']=expand_stats({DEX=10, STR=7, INT=7}), ['B']=expand_stats({HP=50, Acc=15, Eva=20}), ['C']=expand_stats({Acc=15, PetAcc=15, PetDA=3}), ['D']=expand_stats({MP=50, FastCast=5, Refresh=1}) } -- Rawhide Trousers
escha_tables[15][27460] = { ['A']=expand_stats({DEX=10, STR=7, INT=7}), ['B']=expand_stats({HP=50, Acc=15, Eva=20}), ['C']=expand_stats({Acc=15, PetAcc=15, PetDA=3}), ['D']=expand_stats({STR=10, Atk=15, STP=5}) } -- Rawhide Boots

-- ==============================================================================
-- ESCHITE SET (Rank 15)
-- ==============================================================================
escha_tables[15][26791] = { ['A']=expand_stats({HP=80, Enmity=7, PDT=-4}), ['B']=expand_stats({MP=80, Acc=10, Enmity=7}), ['C']=expand_stats({Meva=15, SIRD=-15, Enmity=7}), ['D']=expand_stats({STR=9, VIT=7, CurePot=7}) } -- Eschite Helm
escha_tables[15][26947] = { ['A']=expand_stats({HP=80, Enmity=7, PDT=-4}), ['B']=expand_stats({MP=80, Acc=10, Enmity=7}), ['C']=expand_stats({Meva=15, SIRD=-15, Enmity=7}), ['D']=expand_stats({Atk=15, VIT=7, DT=-4}) } -- Eschite Breastplate
escha_tables[15][27097] = { ['A']=expand_stats({HP=80, Enmity=7, PDT=-4}), ['B']=expand_stats({MP=80, Acc=10, Enmity=7}), ['C']=expand_stats({Meva=15, SIRD=-15, Enmity=7}), ['D']=expand_stats({Acc=20, DA=4, Enmity=7}) } -- Eschite Gauntlets
escha_tables[15][27282] = { ['A']=expand_stats({HP=80, Enmity=7, PDT=-4}), ['B']=expand_stats({MP=80, Acc=10, Enmity=7}), ['C']=expand_stats({Meva=15, SIRD=-15, Enmity=7}), ['D']=expand_stats({MAB=25, ConserveMP=6, FastCast=5}) } -- Eschite Cuisses
escha_tables[15][27457] = { ['A']=expand_stats({HP=80, Enmity=7, PDT=-4}), ['B']=expand_stats({MP=80, Acc=10, Enmity=7}), ['C']=expand_stats({Meva=15, SIRD=-15, Enmity=7}), ['D']=expand_stats({STR=15, HP=50, STP=5}) } -- Eschite Greaves

-- ==============================================================================
-- NAGA SET (Rank 15)
-- ==============================================================================
escha_tables[15][26793] = { ['A']=expand_stats({HP=50, VIT=10, Eva=20}), ['B']=expand_stats({PetMP=80, AutoCurePot=4, AutoFC=3}), ['C']=expand_stats({Acc=15, Racc=25, Enmity=-6}), ['D']=expand_stats({HP=80, DEX=10, Atk=20}) } -- Naga Somen
escha_tables[15][26949] = { ['A']=expand_stats({HP=50, VIT=10, Eva=20}), ['B']=expand_stats({PetMP=80, AutoCurePot=4, AutoFC=3}), ['C']=expand_stats({Acc=15, Racc=25, Enmity=-6}), ['D']=expand_stats({PetMP=80, PetMAB=20, PetMacc=20}) } -- Naga Samue
escha_tables[15][27099] = { ['A']=expand_stats({HP=50, VIT=10, Eva=20}), ['B']=expand_stats({PetMP=80, AutoCurePot=4, AutoFC=3}), ['C']=expand_stats({Acc=15, Racc=25, Enmity=-6}), ['D']=expand_stats({Atk=20, Ratk=25, Crit=4}) } -- Naga Tekko
escha_tables[15][27284] = { ['A']=expand_stats({HP=50, VIT=10, Eva=20}), ['B']=expand_stats({PetMP=80, AutoCurePot=4, AutoFC=3}), ['C']=expand_stats({Acc=15, Racc=25, Enmity=-6}), ['D']=expand_stats({PetHP=100, PetAcc=25, PetAtk=25}) } -- Naga Hakama
escha_tables[15][27459] = { ['A']=expand_stats({HP=50, VIT=10, Eva=20}), ['B']=expand_stats({PetMP=80, AutoCurePot=4, AutoFC=3}), ['C']=expand_stats({Acc=15, Racc=25, Enmity=-6}), ['D']=expand_stats({Acc=15, SubtleBlow=7}) } -- Naga Kyahan

-- ==============================================================================
-- PSYCLOTH SET (Rank 15)
-- ==============================================================================
escha_tables[15][26796] = { ['A']=expand_stats({Macc=10, SIRD=-15, MND=7}), ['B']=expand_stats({PetAtk=25, PetMAB=15, PetEnmity=7}), ['C']=expand_stats({Macc=20, FastCast=10, INT=7}), ['D']=expand_stats({ElemSkill=20, INT=7, Enmity=-6}) } -- Psycloth Tiara
escha_tables[15][26952] = { ['A']=expand_stats({Macc=10, SIRD=-15, MND=7}), ['B']=expand_stats({PetAtk=25, PetMAB=15, PetEnmity=7}), ['C']=expand_stats({Macc=20, FastCast=10, INT=7}), ['D']=expand_stats({MP=80, BloodBoon=4, PetMAB=25}) } -- Psycloth Vest
escha_tables[15][27102] = { ['A']=expand_stats({Macc=10, SIRD=-15, MND=7}), ['B']=expand_stats({PetAtk=25, PetMAB=15, PetEnmity=7}), ['C']=expand_stats({Macc=20, FastCast=10, INT=7}), ['D']=expand_stats({MP=80, Macc=15, FastCast=7}) } -- Psycloth Manillas
escha_tables[15][27287] = { ['A']=expand_stats({Macc=10, SIRD=-15, MND=7}), ['B']=expand_stats({PetAtk=25, PetMAB=15, PetEnmity=7}), ['C']=expand_stats({Macc=20, FastCast=10, INT=7}), ['D']=expand_stats({PetMacc=20, PetMAB=20, PetEnmity=7}) } -- Psycloth Lappas
escha_tables[15][27462] = { ['A']=expand_stats({Macc=10, SIRD=-15, MND=7}), ['B']=expand_stats({PetAtk=25, PetMAB=15, PetEnmity=7}), ['C']=expand_stats({Macc=20, FastCast=10, INT=7}), ['D']=expand_stats({MP=50, INT=7, ConserveMP=6}) } -- Psycloth Boots

-- ==============================================================================
-- PURSUER'S SET (Rank 15)
-- ==============================================================================
escha_tables[15][26795] = { ['A']=expand_stats({DEX=7, AGI=10, Recycle=15}), ['B']=expand_stats({HP=50, Acc=20, Atk=15}), ['C']=expand_stats({Ratk=15, Enmity=-6, SubtleBlow=7}), ['D']=expand_stats({HP=50, Crit=4, Snapshot=6}) } -- Pursuer's Beret
escha_tables[15][26951] = { ['A']=expand_stats({DEX=7, AGI=10, Recycle=15}), ['B']=expand_stats({HP=50, Acc=20, Atk=15}), ['C']=expand_stats({Ratk=15, Enmity=-6, SubtleBlow=7}), ['D']=expand_stats({Ratk=15, STR=7, PDT=-4}) } -- Pursuer's Doublet
escha_tables[15][27101] = { ['A']=expand_stats({DEX=7, AGI=10, Recycle=15}), ['B']=expand_stats({HP=50, Acc=20, Atk=15}), ['C']=expand_stats({Ratk=15, Enmity=-6, SubtleBlow=7}), ['D']=expand_stats({DEX=7, AGI=10, STR=7}) } -- Pursuer's Cuffs
escha_tables[15][27286] = { ['A']=expand_stats({DEX=7, AGI=10, Recycle=15}), ['B']=expand_stats({HP=50, Acc=20, Atk=15}), ['C']=expand_stats({Ratk=15, Enmity=-6, SubtleBlow=7}), ['D']=expand_stats({Racc=10, RapidShot=10, Recycle=15}) } -- Pursuer's Pants
escha_tables[15][27461] = { ['A']=expand_stats({DEX=7, AGI=10, Recycle=15}), ['B']=expand_stats({HP=50, Acc=20, Atk=15}), ['C']=expand_stats({Ratk=15, Enmity=-6, SubtleBlow=7}), ['D']=expand_stats({AGI=10, RapidShot=10, SubtleBlow=7}) } -- Pursuer's Gaiters

-- ==============================================================================
-- VANYA SET (Rank 15)
-- ==============================================================================
escha_tables[15][26797] = { ['A']=expand_stats({HealSkill=20, CureCast=-7, MDT=-3}), ['B']=expand_stats({MND=10, SIRD=-15, ConserveMP=6}), ['C']=expand_stats({MP=50, FastCast=10, Haste=2}), ['D']=expand_stats({HP=50, MP=50, Refresh=2}) } -- Vanya Hood
escha_tables[15][26953] = { ['A']=expand_stats({HealSkill=20, CureCast=-7, MDT=-3}), ['B']=expand_stats({MND=10, SIRD=-15, ConserveMP=6}), ['C']=expand_stats({MP=50, FastCast=10, Haste=2}), ['D']=expand_stats({CHR=10, StringSkill=10, Macc=20}) } -- Vanya Robe
escha_tables[15][27103] = { ['A']=expand_stats({HealSkill=20, CureCast=-7, MDT=-3}), ['B']=expand_stats({MND=10, SIRD=-15, ConserveMP=6}), ['C']=expand_stats({MP=50, FastCast=10, Haste=2}), ['D']=expand_stats({HP=50, Meva=15, PDT=-3}) } -- Vanya Cuffs
escha_tables[15][27288] = { ['A']=expand_stats({HealSkill=20, CureCast=-7, MDT=-3}), ['B']=expand_stats({MND=10, SIRD=-15, ConserveMP=6}), ['C']=expand_stats({MP=50, FastCast=10, Haste=2}), ['D']=expand_stats({CurePot=5, CureCast=-15, ConserveMP=6}) } -- Vanya Slops
escha_tables[15][27463] = { ['A']=expand_stats({HealSkill=20, CureCast=-7, MDT=-3}), ['B']=expand_stats({MND=10, SIRD=-15, ConserveMP=6}), ['C']=expand_stats({MP=50, FastCast=10, Haste=2}), ['D']=expand_stats({MP=50, CurePot=7, Enmity=-6}) } -- Vanya Clogs

return escha_tables