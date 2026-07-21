-- /data/unity.lua
local unity_tables = {}
for i = 1, 30 do unity_tables[i] = {} end

-- Local expand_stats to ensure this module works completely independently
local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    -- Combat Stats
    if rank_data.DMG then full_stats['Damage'] = rank_data.DMG end
    if rank_data.Acc then full_stats['Accuracy'] = rank_data.Acc end
    if rank_data.Racc then full_stats['Ranged Accuracy'] = rank_data.Racc end
    if rank_data.Macc then full_stats['Magic Accuracy'] = rank_data.Macc end
    if rank_data.Atk then full_stats['Attack'] = rank_data.Atk end
    if rank_data.Ratk then full_stats['Ranged Attack'] = rank_data.Ratk end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.Meva then full_stats['Magic Evasion'] = rank_data.Meva end
    if rank_data.DEF then full_stats['Defense'] = rank_data.DEF end
    if rank_data.HP then full_stats['HP'] = rank_data.HP end
    if rank_data.MP then full_stats['MP'] = rank_data.MP end
    if rank_data.MDB then full_stats['Magic Def. Bonus'] = rank_data.MDB end
    if rank_data.MAB then full_stats['Magic Attack Bonus'] = rank_data.MAB end
    if rank_data.MDMG then full_stats['Magic Damage'] = rank_data.MDMG end
    if rank_data.MBD then full_stats['Magic Burst Damage'] = rank_data.MBD end
    if rank_data.WSD then full_stats['Weapon Skill Damage'] = rank_data.WSD end
    if rank_data.DA then full_stats['Double Attack'] = rank_data.DA end
    if rank_data.TA then full_stats['Triple Attack'] = rank_data.TA end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.FC then full_stats['Fast Cast'] = rank_data.FC end
    if rank_data.SIRD then full_stats['Spell Interruption Rate'] = rank_data.SIRD end
    if rank_data.ConserveMP then full_stats['Conserve MP'] = rank_data.ConserveMP end
    if rank_data.SCDmg then full_stats['Skillchain Damage'] = rank_data.SCDmg end
    if rank_data.Snapshot then full_stats['Snapshot'] = rank_data.Snapshot end
    if rank_data.Counter then full_stats['Counter'] = rank_data.Counter end
    if rank_data.Enmity then full_stats['Enmity'] = rank_data.Enmity end
    if rank_data.DT then full_stats['Damage Taken'] = rank_data.DT end
    if rank_data.CurePot then full_stats['Cure Potency'] = rank_data.CurePot end
    if rank_data.EnfMagSkill then full_stats['Enfeebling Magic Skill'] = rank_data.EnfMagSkill end

    -- New Unique Unity Stats
    if rank_data.SwordEnhSpellDmg then full_stats['Sword Enhancement Spell Damage'] = rank_data.SwordEnhSpellDmg end
    if rank_data.ParryingSkill then full_stats['Parrying Skill'] = rank_data.ParryingSkill end
    if rank_data.HealMagSkill then full_stats['Healing Magic Skill'] = rank_data.HealMagSkill end
    if rank_data.EnhMagSkill then full_stats['Enhancing Magic Skill'] = rank_data.EnhMagSkill end
    if rank_data.ResistBind then full_stats['Resist Bind'] = rank_data.ResistBind end
    if rank_data.ResistSilence then full_stats['Resist Silence'] = rank_data.ResistSilence end

    -- Base Stats
    if rank_data.STR then full_stats['STR'] = rank_data.STR end
    if rank_data.DEX then full_stats['DEX'] = rank_data.DEX end
    if rank_data.VIT then full_stats['VIT'] = rank_data.VIT end
    if rank_data.AGI then full_stats['AGI'] = rank_data.AGI end
    if rank_data.INT then full_stats['INT'] = rank_data.INT end
    if rank_data.MND then full_stats['MND'] = rank_data.MND end
    if rank_data.CHR then full_stats['CHR'] = rank_data.CHR end

    -- "All Base Stats" or "All Attr." Expansion
    if rank_data.BaseStats then
        full_stats['STR'] = (full_stats['STR'] or 0) + rank_data.BaseStats
        full_stats['DEX'] = (full_stats['DEX'] or 0) + rank_data.BaseStats
        full_stats['VIT'] = (full_stats['VIT'] or 0) + rank_data.BaseStats
        full_stats['AGI'] = (full_stats['AGI'] or 0) + rank_data.BaseStats
        full_stats['INT'] = (full_stats['INT'] or 0) + rank_data.BaseStats
        full_stats['MND'] = (full_stats['MND'] or 0) + rank_data.BaseStats
        full_stats['CHR'] = (full_stats['CHR'] or 0) + rank_data.BaseStats
    end

    -- Pet & Avatar Stats
    if rank_data.PetAcc then full_stats['Pet: Accuracy'] = rank_data.PetAcc end
    if rank_data.PetMacc then full_stats['Pet: Mag. Acc.'] = rank_data.PetMacc end
    if rank_data.AvaAcc then full_stats['Avatar: Accuracy'] = rank_data.AvaAcc end
    if rank_data.AvaMacc then full_stats['Avatar: Mag. Acc.'] = rank_data.AvaMacc end
    if rank_data.AvaTPBonus then full_stats['Avatar: TP Bonus'] = rank_data.AvaTPBonus end
    if rank_data.AvaMBD then full_stats['Avatar: Magic Burst Bonus'] = rank_data.AvaMBD end
    if rank_data.AvaPerp then full_stats['Avatar Perpetuation Cost'] = rank_data.AvaPerp end
    if rank_data.AvaBaseStats then full_stats['Avatar: All Attr.'] = rank_data.AvaBaseStats end

    return full_stats
end

-- ==============================================================================
-- WEAPONS
-- ==============================================================================
local demers_degen = {
    ['A'] = {
        {Acc=3, Macc=3}, {Acc=6, Macc=6}, {Acc=9, Macc=9}, {Acc=12, Macc=12}, {Acc=15, Macc=15},
        {Acc=18, Macc=18, DEX=1}, {Acc=21, Macc=21, DEX=2}, {Acc=24, Macc=24, DEX=3}, {Acc=27, Macc=27, DEX=4}, {Acc=30, Macc=30, DEX=5},
        {Acc=33, Macc=33, DEX=6, SwordEnhSpellDmg=10}, {Acc=36, Macc=36, DEX=7, SwordEnhSpellDmg=20}, {Acc=39, Macc=39, DEX=8, SwordEnhSpellDmg=30}, {Acc=42, Macc=42, DEX=9, SwordEnhSpellDmg=40}, {Acc=45, Macc=45, DEX=10, SwordEnhSpellDmg=50}
    }
}
local jugo_kukri = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {DMG=13, Acc=40, Macc=40, Eva=20} }
}
local loxotic_mace = {
    ['A'] = {
        {DMG=3}, {DMG=6}, {DMG=9}, {DMG=11}, {DMG=13},
        {DMG=15, Acc=4, Macc=4}, {DMG=17, Acc=8, Macc=8}, {DMG=19, Acc=12, Macc=12}, {DMG=21, Acc=16, Macc=16}, {DMG=23, Acc=20, Macc=20},
        {DMG=25, Acc=24, Macc=24, WSD=2}, {DMG=27, Acc=28, Macc=28, WSD=4}, {DMG=29, Acc=32, Macc=32, WSD=6}, {DMG=31, Acc=36, Macc=36, WSD=8}, {DMG=33, Acc=40, Macc=40, WSD=10}
    }
}
local perun = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Ratk=45, Racc=30, Macc=30, Snapshot=5} }
}
local pukulatmuj = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {DMG=38, Acc=30, Macc=30, SwordEnhSpellDmg=150} }
}
local ternion_dagger = {
    ['A'] = {
        {DMG=2}, {DMG=4}, {DMG=5}, {DMG=6}, {DMG=7},
        {DMG=8, Acc=4, Macc=4}, {DMG=9, Acc=8, Macc=8}, {DMG=10, Acc=12, Macc=12}, {DMG=11, Acc=16, Macc=16}, {DMG=12, Acc=20, Macc=20},
        {DMG=13, Acc=24, Macc=24, WSD=1}, {DMG=14, Acc=28, Macc=28, WSD=2}, {DMG=15, Acc=32, Macc=32, WSD=3}, {DMG=16, Acc=36, Macc=36, WSD=4}, {DMG=17, Acc=40, Macc=40, WSD=5}
    }
}
local contemplator = {
    ['A'] = {
        {Macc=5}, {Macc=10}, {Macc=15}, {Macc=20}, {Macc=25},
        {Macc=30, EnfMagSkill=2}, {Macc=35, EnfMagSkill=4}, {Macc=40, EnfMagSkill=6}, {Macc=45, EnfMagSkill=8}, {Macc=50, EnfMagSkill=10},
        {Macc=54, EnfMagSkill=12, MND=2}, {Macc=58, EnfMagSkill=14, MND=4}, {Macc=62, EnfMagSkill=16, MND=6}, {Macc=64, EnfMagSkill=18, MND=8}, {Macc=70, EnfMagSkill=20, MND=10}
    }
}
local magesmasher = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {DMG=45, Acc=30, Macc=30, WSD=15} }
}
local marin_staff = {
    ['A'] = {
        {MAB=3}, {MAB=6}, {MAB=9}, {MAB=12}, {MAB=15},
        {MAB=18, Acc=4, Macc=4}, {MAB=21, Acc=8, Macc=8}, {MAB=24, Acc=12, Macc=12}, {MAB=27, Acc=16, Macc=16}, {MAB=30, Acc=20, Macc=20},
        {MAB=32, Acc=24, Macc=24, INT=2, MND=2}, {MAB=34, Acc=28, Macc=28, INT=4, MND=4}, {MAB=36, Acc=32, Macc=32, INT=6, MND=6}, {MAB=38, Acc=36, Macc=36, INT=8, MND=8}, {MAB=40, Acc=40, Macc=40, INT=10, MND=10}
    }
}
local antitail = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Meva=15, DA=3} }
}
local wingcutter = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Acc=10, Eva=10} }
}
local refined_grip = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {DEF=20, ParryingSkill=10} }
}
local ghastly_tathlum = {
    ['A'] = {
        {MDMG=1}, {MDMG=2}, {MDMG=3}, {MDMG=4}, {MDMG=5},
        {MDMG=5, INT=1}, {MDMG=6, INT=1}, {MDMG=6, INT=2}, {MDMG=7, INT=2}, {MDMG=7, INT=3},
        {MDMG=8, INT=3}, {MDMG=8, INT=4}, {MDMG=9, INT=4}, {MDMG=9, INT=5}, {MDMG=10, INT=5}
    }
}

-- ==============================================================================
-- ARMOR & ACCESSORIES
-- ==============================================================================
local blistering_sallet = {
    ['A'] = {
        {Acc=3, Macc=3}, {Acc=6, Macc=6}, {Acc=9, Macc=9}, {Acc=12, Macc=12}, {Acc=15, Macc=15},
        {Acc=18, Macc=18, Crit=1}, {Acc=21, Macc=21, Crit=2}, {Acc=24, Macc=24, Crit=3}, {Acc=27, Macc=27, Crit=4}, {Acc=30, Macc=30, Crit=5},
        {Acc=33, Macc=33, Crit=6, STR=5, DEX=5}, {Acc=36, Macc=36, Crit=7, STR=10, DEX=10}, {Acc=39, Macc=39, Crit=8, STR=15, DEX=15}, {Acc=42, Macc=42, Crit=9, STR=20, DEX=20}, {Acc=45, Macc=45, Crit=10, STR=25, DEX=25}
    }
}
local loess_barbuta = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Enmity=10, DT=-10, BaseStats=10} }
}
local emet_harness = {
    ['A'] = {
        {Eva=2}, {Eva=4}, {Eva=6}, {Eva=8}, {Eva=10},
        {Eva=12, Acc=4}, {Eva=14, Acc=8}, {Eva=16, Acc=12}, {Eva=18, Acc=16}, {Eva=20, Acc=20},
        {Eva=22, Acc=24, BaseStats=2}, {Eva=24, Acc=28, BaseStats=4}, {Eva=26, Acc=32, BaseStats=6}, {Eva=28, Acc=36, BaseStats=8}, {Eva=30, Acc=40, BaseStats=10}
    }
}
local shomonjijoe = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {AvaTPBonus=300, AvaAcc=30, AvaMacc=30, AvaBaseStats=10} }
}
local cohort_cloak = {
    ['A'] = {
        {Macc=10}, {Macc=20}, {Macc=30}, {Macc=40}, {Macc=50},
        {Macc=55, MAB=10}, {Macc=60, MAB=20}, {Macc=65, MAB=30}, {Macc=70, MAB=40}, {Macc=75, MAB=50},
        {Macc=80, MAB=60, BaseStats=4}, {Macc=85, MAB=70, BaseStats=8}, {Macc=90, MAB=80, BaseStats=12}, {Macc=95, MAB=90, BaseStats=16}, {Macc=100, MAB=100, BaseStats=20}
    }
}
local tatena_harama = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Acc=30, BaseStats=10, TA=5} }
}
local gazu_bracelets = {
    ['A'] = {
        {}, {}, {}, {}, {}, {}, {}, {}, {Acc=33, Haste=4}, {Acc=36, Haste=5},
        {Acc=39, Haste=6, BaseStats=2}, {Acc=42, Haste=7, BaseStats=4}, {Acc=45, Haste=8, BaseStats=6}, {Acc=47, Haste=9, BaseStats=8}, {Acc=50, Haste=10, BaseStats=10}
    }
}
local lamassu_mitts = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {AvaBaseStats=30, AvaAcc=40, AvaMacc=40, AvaPerp=-5} }
}
local asteria_mitts = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {MP=45, AvaAcc=40, AvaMacc=40, AvaMBD=10} }
}
local tatena_gote = {
    ['A'] = {
        {Acc=3}, {Acc=6}, {Acc=9}, {Acc=12}, {Acc=15},
        {Acc=18, BaseStats=1}, {Acc=21, BaseStats=2}, {Acc=24, BaseStats=3}, {Acc=27, BaseStats=4}, {Acc=30, BaseStats=5},
        {Acc=32, BaseStats=6, TA=1}, {Acc=34, BaseStats=7, TA=2}, {Acc=36, BaseStats=8, TA=3}, {Acc=38, BaseStats=9, TA=4}, {Acc=40, BaseStats=10, TA=4}
    }
}
local assid_pants = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {AvaAcc=35, AvaMacc=35, AvaBaseStats=20, MP=20} }
}
local tatena_haidate = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Acc=60, BaseStats=10, TA=3} }
}
local zoar_subligar = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {Acc=30, Crit=5, BaseStats=10} }
}
local hippo_socks = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {ResistBind=45, Eva=20, BaseStats=10} }
}
local hygieia_clogs = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {CurePot=15, HealMagSkill=10, BaseStats=10} }
}
local jute_boots = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {DEX=15, AGI=15, Meva=30, BaseStats=10} }
}
local regal_pumps = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {HealMagSkill=10, EnhMagSkill=10, BaseStats=10} }
}
local tatena_sune = {
    ['A'] = {
        {Acc=4}, {Acc=8}, {Acc=12}, {Acc=16}, {Acc=20},
        {Acc=24, BaseStats=1}, {Acc=28, BaseStats=2}, {Acc=32, BaseStats=3}, {Acc=36, BaseStats=4}, {Acc=40, BaseStats=5},
        {Acc=44, BaseStats=6, TA=1}, {Acc=48, BaseStats=7, TA=1}, {Acc=52, BaseStats=8, TA=2}, {Acc=56, BaseStats=9, TA=2}, {Acc=60, BaseStats=10, TA=3}
    }
}
local acuity_belt = {
    ['A'] = {
        {Macc=1}, {Macc=2}, {Macc=3}, {Macc=4}, {Macc=5},
        {Macc=6, INT=1}, {Macc=7, INT=2}, {Macc=8, INT=3}, {Macc=9, INT=4}, {Macc=10, INT=5},
        {Macc=11, INT=6}, {Macc=12, INT=7}, {Macc=13, INT=8}, {Macc=14, INT=9}, {Macc=15, INT=10}
    }
}
local apeile_ring = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {DEF=20, MDB=5} }
}
local aurists_cape = {
    ['A'] = {
        {Acc=2, Macc=2}, {Acc=4, Macc=4}, {Acc=6, Macc=6}, {Acc=8, Macc=8}, {Acc=10, Macc=10},
        {Acc=12, Macc=12, INT=3, MND=3}, {Acc=14, Macc=14, INT=6, MND=6}, {Acc=16, Macc=16, INT=9, MND=9}, {Acc=18, Macc=18, INT=12, MND=12}, {Acc=20, Macc=20, INT=15, MND=15},
        {Acc=21, Macc=21, INT=17, MND=17}, {Acc=22, Macc=22, INT=19, MND=19}, {Acc=23, Macc=23, INT=21, MND=21}, {Acc=24, Macc=24, INT=23, MND=23}, {Acc=25, Macc=25, INT=25, MND=25}
    }
}
local bathy_choker = {
    ['A'] = {
        {Eva=1}, {Eva=2}, {Eva=3}, {Eva=4}, {Eva=5},
        {Eva=6, Counter=1}, {Eva=7, Counter=2}, {Eva=8, Counter=3}, {Eva=9, Counter=4}, {Eva=10, Counter=5},
        {Eva=11, Counter=6}, {Eva=12, Counter=7}, {Eva=13, Counter=8}, {Eva=14, Counter=9}, {Eva=15, Counter=10}
    }
}
local cacoethic_ring = {
    ['A'] = {
        {DEX=1}, {DEX=2}, {DEX=3}, {DEX=4}, {DEX=5},
        {DEX=5, AGI=1}, {DEX=6, AGI=2}, {DEX=6, AGI=3}, {DEX=7, AGI=4}, {DEX=7, AGI=5},
        {DEX=8, AGI=6}, {DEX=8, AGI=7}, {DEX=9, AGI=8}, {DEX=9, AGI=9}, {DEX=10, AGI=10}
    }
}
local fi_follet_cape = {
    ['A'] = {
        {FC=1}, {FC=2}, {FC=3}, {FC=4}, {FC=5},
        {FC=5, SIRD=-1}, {FC=6, SIRD=-1}, {FC=6, SIRD=-2}, {FC=7, SIRD=-2}, {FC=7, SIRD=-3},
        {FC=8, SIRD=-3}, {FC=8, SIRD=-4}, {FC=9, SIRD=-4}, {FC=9, SIRD=-5}, {FC=10, SIRD=-5}
    }
}
local gelatinous_ring = {
    ['A'] = {
        {VIT=1}, {VIT=2}, {VIT=3}, {VIT=4}, {VIT=5},
        {VIT=6, HP=10}, {VIT=7, HP=20}, {VIT=8, HP=30}, {VIT=9, HP=40}, {VIT=10, HP=50},
        {VIT=11, HP=60}, {VIT=12, HP=70}, {VIT=13, HP=80}, {VIT=14, HP=90}, {VIT=15, HP=100}
    }
}
local handlers_earring = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {PetAcc=15, PetMacc=15, Acc=10} }
}
local kentarch_belt = {
    ['A'] = {
        {STR=1}, {STR=2}, {STR=3}, {STR=4}, {STR=5},
        {STR=5, DEX=1}, {STR=6, DEX=2}, {STR=6, DEX=3}, {STR=7, DEX=4}, {STR=7, DEX=5},
        {STR=8, DEX=6}, {STR=8, DEX=7}, {STR=9, DEX=8}, {STR=9, DEX=9}, {STR=10, DEX=10}
    }
}
local loricate_torque = {
    ['A'] = {
        {DEF=3}, {DEF=6}, {DEF=9}, {DEF=12}, {DEF=15},
        {DEF=18, SIRD=-1}, {DEF=21, SIRD=-1}, {DEF=24, SIRD=-2}, {DEF=27, SIRD=-2}, {DEF=30, SIRD=-3},
        {DEF=33, SIRD=-3}, {DEF=36, SIRD=-4}, {DEF=39, SIRD=-4}, {DEF=42, SIRD=-5}, {DEF=45, SIRD=-5}
    }
}
local lugra_earring = {
    ['A'] = {
        {DEF=1}, {DEF=2}, {DEF=3}, {DEF=4}, {DEF=5},
        {DEF=6, STR=1, DEX=1, VIT=1, INT=1}, {DEF=7, STR=2, DEX=2, VIT=2, INT=2}, {DEF=8, STR=3, DEX=3, VIT=3, INT=3}, {DEF=9, STR=4, DEX=4, VIT=4, INT=4}, {DEF=10, STR=5, DEX=5, VIT=5, INT=5},
        {DEF=12, STR=6, DEX=6, VIT=6, INT=6}, {DEF=14, STR=6, DEX=6, VIT=6, INT=6}, {DEF=16, STR=7, DEX=7, VIT=7, INT=7}, {DEF=18, STR=7, DEX=7, VIT=7, INT=7}, {DEF=20, STR=8, DEX=8, VIT=8, INT=8}
    }
}
local mephitas_ring = {
    ['A'] = {
        {ConserveMP=1}, {ConserveMP=2}, {ConserveMP=3}, {ConserveMP=4}, {ConserveMP=5},
        {ConserveMP=6, INT=1}, {ConserveMP=7, INT=1}, {ConserveMP=8, INT=2}, {ConserveMP=9, INT=2}, {ConserveMP=10, INT=3},
        {ConserveMP=11, INT=3}, {ConserveMP=12, INT=4}, {ConserveMP=13, INT=4}, {ConserveMP=14, INT=5}, {ConserveMP=15, INT=5}
    }
}
local metamor_ring = {
    ['A'] = {
        {Macc=1}, {Macc=2}, {Macc=3}, {Macc=4}, {Macc=5},
        {Macc=6, INT=1, MND=1, CHR=1}, {Macc=7, INT=2, MND=2, CHR=2}, {Macc=8, INT=3, MND=3, CHR=3}, {Macc=9, INT=4, MND=4, CHR=4}, {Macc=10, INT=5, MND=5, CHR=5},
        {Macc=10, INT=6, MND=6, CHR=6}, {Macc=10, INT=7, MND=7, CHR=7}, {Macc=10, INT=8, MND=8, CHR=8}, {Macc=10, INT=9, MND=9, CHR=9}, {Macc=10, INT=10, MND=10, CHR=10}
    }
}
local nourish_earring = {
    ['A'] = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {ResistSilence=15, SIRD=-5} }
}
local odnowa_earring = {
    ['A'] = {
        {DEF=2}, {DEF=4}, {DEF=6}, {DEF=8}, {DEF=10},
        {DEF=12, DT=-1}, {DEF=14, DT=-1}, {DEF=16, DT=-1}, {DEF=18, DT=-1}, {DEF=20, DT=-2},
        {DEF=22, DT=-2}, {DEF=24, DT=-2}, {DEF=26, DT=-3}, {DEF=28, DT=-3}, {DEF=30, DT=-3}
    }
}
local sailfi_belt = {
    ['A'] = {
        {STR=1}, {STR=2}, {STR=3}, {STR=4}, {STR=5},
        {STR=6, DA=1}, {STR=7, DA=1}, {STR=8, DA=2}, {STR=9, DA=2}, {STR=10, DA=3},
        {STR=11, DA=3}, {STR=12, DA=4}, {STR=13, DA=4}, {STR=14, DA=5}, {STR=15, DA=5}
    }
}
local shinjutsu_no_obi = {
    ['A'] = {
        {ConserveMP=1}, {ConserveMP=2}, {ConserveMP=3}, {ConserveMP=4}, {ConserveMP=5},
        {ConserveMP=6, FC=1}, {ConserveMP=7, FC=1}, {ConserveMP=8, FC=2}, {ConserveMP=9, FC=2}, {ConserveMP=10, FC=3},
        {ConserveMP=11, FC=3}, {ConserveMP=12, FC=4}, {ConserveMP=13, FC=4}, {ConserveMP=14, FC=5}, {ConserveMP=15, FC=5}
    }
}
local seeth_bomblet = {
    ['A'] = {
        {STR=1}, {STR=2}, {STR=3}, {STR=4}, {STR=5},
        {STR=5, Haste=1}, {STR=6, Haste=1}, {STR=6, Haste=2}, {STR=7, Haste=2}, {STR=7, Haste=3},
        {STR=8, Haste=3}, {STR=8, Haste=4}, {STR=9, Haste=4}, {STR=9, Haste=5}, {STR=10, Haste=5}
    }
}
local unmoving_collar = {
    ['A'] = {
        {DEF=2}, {DEF=4}, {DEF=6}, {DEF=8}, {DEF=10},
        {DEF=12, HP=20}, {DEF=14, HP=50}, {DEF=16, HP=60}, {DEF=18, HP=80}, {DEF=20, HP=100},
        {DEF=22, HP=120}, {DEF=24, HP=140}, {DEF=26, HP=160}, {DEF=28, HP=180}, {DEF=30, HP=200}
    }
}
local vim_torque = {
    ['A'] = {
        {Acc=1}, {Acc=2}, {Acc=3}, {Acc=4}, {Acc=5},
        {Acc=6, STP=1}, {Acc=7, STP=2}, {Acc=8, STP=3}, {Acc=9, STP=4}, {Acc=10, STP=5},
        {Acc=11, STP=6}, {Acc=12, STP=7}, {Acc=13, STP=8}, {Acc=14, STP=9}, {Acc=15, STP=10}
    }
}
local warders_charm = {
    ['A'] = {
        {SCDmg=1}, {SCDmg=2}, {SCDmg=3}, {SCDmg=4}, {SCDmg=5},
        {SCDmg=6, MBD=1}, {SCDmg=7, MBD=2}, {SCDmg=8, MBD=3}, {SCDmg=9, MBD=4}, {SCDmg=10, MBD=5},
        {SCDmg=11, MBD=6}, {SCDmg=12, MBD=7}, {SCDmg=13, MBD=8}, {SCDmg=14, MBD=9}, {SCDmg=15, MBD=10}
    }
}

-- ==============================================================================
-- DISTRIBUTE INTO ARRAYS (Max Rank 15 for Unity, loop capped there)
-- ==============================================================================
for r = 1, 15 do
    unity_tables[r][99999] = { ['A'] = expand_stats(demers_degen['A'][r]) } -- Demers. Degen +1
    unity_tables[r][99998] = { ['A'] = expand_stats(jugo_kukri['A'][r]) } -- Jugo Kukri +1
    unity_tables[r][99997] = { ['A'] = expand_stats(loxotic_mace['A'][r]) } -- Loxotic Mace +1
    unity_tables[r][99996] = { ['A'] = expand_stats(perun['A'][r]) } -- Perun +1
    unity_tables[r][99995] = { ['A'] = expand_stats(pukulatmuj['A'][r]) } -- Pukulatmuj +1
    unity_tables[r][99994] = { ['A'] = expand_stats(ternion_dagger['A'][r]) } -- Ternion Dagger +1
    unity_tables[r][99993] = { ['A'] = expand_stats(contemplator['A'][r]) } -- Contemplator +1
    unity_tables[r][99992] = { ['A'] = expand_stats(magesmasher['A'][r]) } -- Magesmasher +1
    unity_tables[r][99991] = { ['A'] = expand_stats(marin_staff['A'][r]) } -- Marin Staff +1
    unity_tables[r][99990] = { ['A'] = expand_stats(antitail['A'][r]) } -- Antitail +1
    unity_tables[r][99989] = { ['A'] = expand_stats(wingcutter['A'][r]) } -- Wingcutter +1
    unity_tables[r][99988] = { ['A'] = expand_stats(refined_grip['A'][r]) } -- Refined Grip +1
    unity_tables[r][99987] = { ['A'] = expand_stats(ghastly_tathlum['A'][r]) } -- Ghastly Tathlum +1
    
    unity_tables[r][99986] = { ['A'] = expand_stats(blistering_sallet['A'][r]) } -- Blistering Sallet +1
    unity_tables[r][99985] = { ['A'] = expand_stats(loess_barbuta['A'][r]) } -- Loess Barbuta +1
    unity_tables[r][99984] = { ['A'] = expand_stats(emet_harness['A'][r]) } -- Emet Harness +1
    unity_tables[r][99983] = { ['A'] = expand_stats(shomonjijoe['A'][r]) } -- Shomonjijoe +1
    unity_tables[r][99982] = { ['A'] = expand_stats(cohort_cloak['A'][r]) } -- Cohort Cloak +1
    unity_tables[r][99981] = { ['A'] = expand_stats(tatena_harama['A'][r]) } -- Tatena. Harama. +1
    unity_tables[r][99980] = { ['A'] = expand_stats(gazu_bracelets['A'][r]) } -- Gazu Bracelets +1
    unity_tables[r][99979] = { ['A'] = expand_stats(lamassu_mitts['A'][r]) } -- Lamassu Mitts +1
    unity_tables[r][99978] = { ['A'] = expand_stats(asteria_mitts['A'][r]) } -- Asteria Mitts +1
    unity_tables[r][99977] = { ['A'] = expand_stats(tatena_gote['A'][r]) } -- Tatena. Gote +1
    unity_tables[r][99976] = { ['A'] = expand_stats(assid_pants['A'][r]) } -- Assid. Pants +1
    unity_tables[r][99975] = { ['A'] = expand_stats(tatena_haidate['A'][r]) } -- Tatena. Haidate +1
    unity_tables[r][99974] = { ['A'] = expand_stats(zoar_subligar['A'][r]) } -- Zoar Subligar +1
    unity_tables[r][99973] = { ['A'] = expand_stats(hippo_socks['A'][r]) } -- Hippo. Socks +1
    unity_tables[r][99972] = { ['A'] = expand_stats(hygieia_clogs['A'][r]) } -- Hygieia Clogs +1
    unity_tables[r][99971] = { ['A'] = expand_stats(jute_boots['A'][r]) } -- Jute Boots +1
    unity_tables[r][99970] = { ['A'] = expand_stats(regal_pumps['A'][r]) } -- Regal Pumps +1
    unity_tables[r][99969] = { ['A'] = expand_stats(tatena_sune['A'][r]) } -- Tatena. Sune. +1
    
    unity_tables[r][99968] = { ['A'] = expand_stats(acuity_belt['A'][r]) } -- Acuity Belt +1
    unity_tables[r][99967] = { ['A'] = expand_stats(apeile_ring['A'][r]) } -- Apeile Ring +1
    unity_tables[r][99966] = { ['A'] = expand_stats(aurists_cape['A'][r]) } -- Aurist's Cape +1
    unity_tables[r][99965] = { ['A'] = expand_stats(bathy_choker['A'][r]) } -- Bathy Choker +1
    unity_tables[r][99964] = { ['A'] = expand_stats(cacoethic_ring['A'][r]) } -- Cacoethic Ring +1
    unity_tables[r][99963] = { ['A'] = expand_stats(fi_follet_cape['A'][r]) } -- Fi Follet Cape +1
    unity_tables[r][99962] = { ['A'] = expand_stats(gelatinous_ring['A'][r]) } -- Gelatinous Ring +1
    unity_tables[r][99961] = { ['A'] = expand_stats(handlers_earring['A'][r]) } -- Handler's Earring +1
    unity_tables[r][99960] = { ['A'] = expand_stats(kentarch_belt['A'][r]) } -- Kentarch Belt +1
    unity_tables[r][99959] = { ['A'] = expand_stats(loricate_torque['A'][r]) } -- Loricate Torque +1
    unity_tables[r][99958] = { ['A'] = expand_stats(lugra_earring['A'][r]) } -- Lugra Earring +1
    unity_tables[r][99957] = { ['A'] = expand_stats(mephitas_ring['A'][r]) } -- Mephitas's Ring +1
    unity_tables[r][99956] = { ['A'] = expand_stats(metamor_ring['A'][r]) } -- Metamor. Ring +1
    unity_tables[r][99955] = { ['A'] = expand_stats(nourish_earring['A'][r]) } -- Nourish. Earring +1
    unity_tables[r][99954] = { ['A'] = expand_stats(odnowa_earring['A'][r]) } -- Odnowa Earring +1
    unity_tables[r][99953] = { ['A'] = expand_stats(sailfi_belt['A'][r]) } -- Sailfi Belt +1
    unity_tables[r][99952] = { ['A'] = expand_stats(shinjutsu_no_obi['A'][r]) } -- Shinjutsu-no-Obi +1
    unity_tables[r][99951] = { ['A'] = expand_stats(seeth_bomblet['A'][r]) } -- Seeth. Bomblet +1
    unity_tables[r][99950] = { ['A'] = expand_stats(unmoving_collar['A'][r]) } -- Unmoving Collar +1
    unity_tables[r][99949] = { ['A'] = expand_stats(vim_torque['A'][r]) } -- Vim Torque +1
    unity_tables[r][99948] = { ['A'] = expand_stats(warders_charm['A'][r]) } -- Warder's Charm +1
end

return unity_tables