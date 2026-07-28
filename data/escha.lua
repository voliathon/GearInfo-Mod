-- /data/escha.lua
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
    
    -- Combat & Magic Stats
    if rank_data.Acc then full_stats['Accuracy'] = rank_data.Acc end
    if rank_data.Atk then full_stats['Attack'] = rank_data.Atk end
    if rank_data.Racc then full_stats['Ranged Accuracy'] = rank_data.Racc end
    if rank_data.Ratk then full_stats['Ranged Attack'] = rank_data.Ratk end
    if rank_data.Macc then full_stats['Magic Accuracy'] = rank_data.Macc end
    if rank_data.MAB then full_stats['Magic Attack Bonus'] = rank_data.MAB end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.Meva then full_stats['Magic Evasion'] = rank_data.Meva end
    
    -- Defensive & Traits
    if rank_data.PDT then full_stats['Physical Damage Taken'] = rank_data.PDT end
    if rank_data.MDT then full_stats['Magic Damage Taken'] = rank_data.MDT end
    if rank_data.DA then full_stats['Double Attack'] = rank_data.DA end
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
    if rank_data.Refresh then full_stats['Refresh'] = rank_data.Refresh end

    -- Pet & Avatar Stats
    if rank_data.PetAcc then full_stats['Pet: Accuracy'] = rank_data.PetAcc end
    if rank_data.PetAtk then full_stats['Pet: Attack'] = rank_data.PetAtk end
    if rank_data.PetMacc then full_stats['Pet: Mag. Acc.'] = rank_data.PetMacc end
    if rank_data.PetMAB then full_stats['Pet: Magic Attack Bonus'] = rank_data.PetMAB end
    if rank_data.PetDT then full_stats['Pet: Damage Taken'] = rank_data.PetDT end
    if rank_data.PetDA then full_stats['Pet: Double Attack'] = rank_data.PetDA end
    if rank_data.PetHP then full_stats['Pet: HP'] = rank_data.PetHP end
    if rank_data.PetSTR then full_stats['Pet: STR'] = rank_data.PetSTR end
    if rank_data.PetINT then full_stats['Pet: INT'] = rank_data.PetINT end
    if rank_data.PetRegen then full_stats['Pet: Regen'] = rank_data.PetRegen end
    if rank_data.BPDmg then full_stats['Blood Pact Damage'] = rank_data.BPDmg end
    if rank_data.BPDelay then full_stats['Blood Pact ability delay'] = rank_data.BPDelay end
    if rank_data.Perp then full_stats['Avatar Perpetuation Cost'] = rank_data.Perp end

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
escha_tables[15][26671] = { ['A']=expand_stats({Acc=13, Atk=12, Enmity=5}), ['B']=expand_stats({HP=65, STR=13, Acc=13}), ['C']=expand_stats({HP=105, Enmity=9, CureRx=15}), ['D']=expand_stats({HP=105, VIT=12, PDT=-4}) } -- Souveran Schaller +1 (Fixed Missing ID assumed 26671 based on surrounding logic)
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
escha_tables[15][27478] = { ['A']=expand_stats({MP=80, MND=12, Macc=20}), ['B']=expand_stats({MP=80, CureCast=-7, Enmity=-6}), ['C']=expand_stats({MP=80, SIRD=-12, CureCast=-7}), ['D']=expand_stats({Macc=20, CurePot=6, FastCast=4}) } -- Kaykaus Boots +1

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

return escha_tables