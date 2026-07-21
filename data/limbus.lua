-- /data/limbus.lua
-- Contains rank 1-30 augment tables for Limbus armor, weapons, and accessories.

local limbus_tables = {}
for i = 1, 30 do limbus_tables[i] = {} end

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
    if rank_data.HP then full_stats['HP'] = rank_data.HP end
    if rank_data.MDMG then full_stats['Magic Damage'] = rank_data.MDMG end
    if rank_data.MAB then full_stats['Magic Attack Bonus'] = rank_data.MAB end
    if rank_data.BPDmg then full_stats['Blood Pact Damage'] = rank_data.BPDmg end
    if rank_data.DA then full_stats['Double Attack'] = rank_data.DA end
    if rank_data.TA then full_stats['Triple Attack'] = rank_data.TA end
    if rank_data.QA then full_stats['Quadruple Attack'] = rank_data.QA end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.PDL then full_stats['Physical Damage Limit'] = rank_data.PDL end
    if rank_data.Phalanx then full_stats['Phalanx'] = rank_data.Phalanx end
    if rank_data.Enmity then full_stats['Enmity'] = rank_data.Enmity end

    -- Base Stats & Attributes
    if rank_data.STR then full_stats['STR'] = rank_data.STR end
    if rank_data.DEX then full_stats['DEX'] = rank_data.DEX end
    if rank_data.INT then full_stats['INT'] = rank_data.INT end

    -- Grouped Attributes (STR/DEX)
    if rank_data.StrDex then
        full_stats['STR'] = (full_stats['STR'] or 0) + rank_data.StrDex
        full_stats['DEX'] = (full_stats['DEX'] or 0) + rank_data.StrDex
    end

    -- "All Attr." Expansion
    if rank_data.AllAttr then
        full_stats['STR'] = (full_stats['STR'] or 0) + rank_data.AllAttr
        full_stats['DEX'] = (full_stats['DEX'] or 0) + rank_data.AllAttr
        full_stats['VIT'] = (full_stats['VIT'] or 0) + rank_data.AllAttr
        full_stats['AGI'] = (full_stats['AGI'] or 0) + rank_data.AllAttr
        full_stats['INT'] = (full_stats['INT'] or 0) + rank_data.AllAttr
        full_stats['MND'] = (full_stats['MND'] or 0) + rank_data.AllAttr
        full_stats['CHR'] = (full_stats['CHR'] or 0) + rank_data.AllAttr
    end

    -- Pet Stats
    if rank_data.PetAcc then full_stats['Pet: Accuracy'] = rank_data.PetAcc end
    if rank_data.PetMacc then full_stats['Pet: Mag. Acc.'] = rank_data.PetMacc end

    return full_stats
end

-- ==============================================================================
-- ARMOR & ACCESSORY ARRAYS
-- ==============================================================================

-- Justice / Magnificent / Duty Crown
local justice_crown = {
    ['A'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3},
        {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5}, {Acc=6, Macc=6, PetAcc=6, PetMacc=6},
        {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9},
        {Acc=10, Macc=10, PetAcc=10, PetMacc=10}, {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12},
        {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, STP=1, PetAcc=16, PetMacc=16}, {Acc=17, Macc=17, STP=2, PetAcc=17, PetMacc=17}, {Acc=18, Macc=18, STP=2, PetAcc=18, PetMacc=18},
        {Acc=19, Macc=19, STP=3, PetAcc=19, PetMacc=19}, {Acc=20, Macc=20, STP=3, TA=1, PetAcc=20, PetMacc=20}, {Acc=21, Macc=21, STP=4, TA=1, PetAcc=21, PetMacc=21},
        {Acc=22, Macc=22, STP=4, TA=1, PetAcc=22, PetMacc=22}, {Acc=23, Macc=23, STP=4, TA=1, PetAcc=23, PetMacc=23}, {Acc=24, Macc=24, STP=5, TA=2, PetAcc=24, PetMacc=24},
        {Acc=25, Macc=25, STP=5, TA=2, PetAcc=25, PetMacc=25}, {Acc=26, Macc=26, STP=5, TA=2, PetAcc=26, PetMacc=26}, {Acc=27, Macc=27, STP=6, TA=3, PetAcc=27, PetMacc=27},
        {Acc=28, Macc=28, STP=6, TA=3, PetAcc=28, PetMacc=28}, {Acc=29, Macc=29, STP=6, TA=3, PetAcc=29, PetMacc=29}, {Acc=30, Macc=30, STP=7, TA=4, PetAcc=30, PetMacc=30}
    }
}

-- Justice / Magnificent / Duty Cyclas
local justice_cyclas = {
    ['A'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3},
        {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5}, {Acc=6, Macc=6, PetAcc=6, PetMacc=6},
        {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9},
        {Acc=10, Macc=10, PetAcc=10, PetMacc=10}, {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12},
        {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, STP=1, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, STP=1, PetAcc=16, PetMacc=16}, {Acc=17, Macc=17, STP=2, PetAcc=17, PetMacc=17}, {Acc=18, Macc=18, STP=2, PetAcc=18, PetMacc=18},
        {Acc=19, Macc=19, STP=3, PetAcc=19, PetMacc=19}, {Acc=20, Macc=20, STP=3, TA=1, PetAcc=20, PetMacc=20}, {Acc=21, Macc=21, STP=4, TA=1, PetAcc=21, PetMacc=21},
        {Acc=22, Macc=22, STP=4, TA=2, PetAcc=22, PetMacc=22}, {Acc=23, Macc=23, STP=5, TA=2, PetAcc=23, PetMacc=23}, {Acc=24, Macc=24, STP=5, TA=3, PetAcc=24, PetMacc=24},
        {Acc=25, Macc=25, STP=6, TA=3, PetAcc=25, PetMacc=25}, {Acc=26, Macc=26, STP=6, TA=3, PetAcc=26, PetMacc=26}, {Acc=27, Macc=27, STP=7, TA=4, PetAcc=27, PetMacc=27},
        {Acc=28, Macc=28, STP=7, TA=4, PetAcc=28, PetMacc=28}, {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=30, Macc=30, STP=8, TA=5, PetAcc=30, PetMacc=30}
    }
}

-- Justice / Magnificent / Duty Gauntlets (Rank 30 only)
local justice_gauntlets = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Macc=30, STP=6, TA=3, PetAcc=30, PetMacc=30}
    }
}

-- Justice / Magnificent / Duty Flanchard (Rank 30 only)
local justice_flanchard = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Macc=30, STP=7, TA=4, PetAcc=30, PetMacc=30}
    }
}

-- Justice / Magnificent / Duty Sollerets (Rank 30 only)
local justice_sollerets = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Macc=30, STP=6, TA=3, PetAcc=30, PetMacc=30}
    }
}

-- Hope / Perfection / Revelation Masque (Rank 30 only)
local hope_masque = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, DA=7, PDL=6}
    }
}

-- Hope / Perfection / Revelation Platemail (Rank 30 only)
local hope_platemail = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, DA=8, PDL=7}
    }
}

-- Hope / Perfection / Revelation Gauntlets (Rank 30 only)
local hope_gauntlets = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, DA=6, PDL=5}
    }
}

-- Hope / Perfection / Revelation Brais
local hope_brais = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1}, {Acc=2, Racc=2, Macc=2}, {Acc=3, Racc=3, Macc=3},
        {Acc=4, Racc=4, Macc=4}, {Acc=5, Racc=5, Macc=5}, {Acc=6, Racc=6, Macc=6},
        {Acc=7, Racc=7, Macc=7}, {Acc=8, Racc=8, Macc=8}, {Acc=9, Racc=9, Macc=9},
        {Acc=10, Racc=10, Macc=10}, {Acc=11, Racc=11, Macc=11}, {Acc=12, Racc=12, Macc=12},
        {Acc=13, Racc=13, Macc=13}, {Acc=14, Racc=14, Macc=14}, {Acc=15, Racc=15, Macc=15, DA=1},
        {Acc=16, Racc=16, Macc=16, DA=1}, {Acc=17, Racc=17, Macc=17, DA=2}, {Acc=18, Racc=18, Macc=18, DA=2},
        {Acc=19, Racc=19, Macc=19, DA=3}, {Acc=20, Racc=20, Macc=20, DA=3, PDL=1}, {Acc=21, Racc=21, Macc=21, DA=4, PDL=1},
        {Acc=22, Racc=22, Macc=22, DA=4, PDL=2}, {Acc=23, Racc=23, Macc=23, DA=4, PDL=2}, {Acc=24, Racc=24, Macc=24, DA=5, PDL=3},
        {Acc=25, Racc=25, Macc=25, DA=5, PDL=3}, {Acc=26, Racc=26, Macc=26, DA=5, PDL=4}, {Acc=27, Racc=27, Macc=27, DA=6, PDL=4},
        {Acc=28, Racc=28, Macc=28, DA=6, PDL=5}, {Acc=29, Racc=29, Macc=29, DA=6, PDL=5}, {Acc=30, Racc=30, Macc=30, DA=7, PDL=6}
    }
}

-- Hope / Perfection / Revelation Sabatons
local hope_sabatons = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1}, {Acc=2, Racc=2, Macc=2}, {Acc=3, Racc=3, Macc=3},
        {Acc=4, Racc=4, Macc=4}, {Acc=5, Racc=5, Macc=5}, {Acc=6, Racc=6, Macc=6},
        {Acc=7, Racc=7, Macc=7}, {Acc=8, Racc=8, Macc=8}, {Acc=9, Racc=9, Macc=9},
        {Acc=10, Racc=10, Macc=10}, {Acc=11, Racc=11, Macc=11}, {Acc=12, Racc=12, Macc=12},
        {Acc=13, Racc=13, Macc=13}, {Acc=14, Racc=14, Macc=14}, {Acc=15, Racc=15, Macc=15, DA=1},
        {Acc=16, Racc=16, Macc=16, DA=1}, {Acc=17, Racc=17, Macc=17, DA=1}, {Acc=18, Racc=18, Macc=18, DA=2},
        {Acc=19, Racc=19, Macc=19, DA=2}, {Acc=20, Racc=20, Macc=20, DA=2, PDL=1}, {Acc=21, Racc=21, Macc=21, DA=3, PDL=1},
        {},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, DA=6, PDL=5}
    }
}

-- Trust / Prestige / Sworn Crown
local trust_crown = {
    ['A'] = {
        {Acc=1, Macc=1}, {Acc=2, Macc=2}, {Acc=3, Macc=3}, {Acc=4, Macc=4}, {Acc=5, Macc=5},
        {Acc=6, Macc=6}, {Acc=7, Macc=7}, {Acc=8, Macc=8}, {Acc=9, Macc=9}, {Acc=10, Macc=10},
        {Acc=11, Macc=11}, {Acc=12, Macc=12}, {Acc=13, Macc=13}, {Acc=14, Macc=14}, {Acc=15, Macc=15, TA=1},
        {Acc=16, Macc=16, TA=1}, {Acc=17, Macc=17, TA=1}, {Acc=18, Macc=18, TA=2}, {Acc=19, Macc=19, TA=2}, {Acc=20, Macc=20, TA=2, Phalanx=1},
        {Acc=21, Macc=21, TA=3, Phalanx=1}, {Acc=22, Macc=22, TA=3, Phalanx=1}, {Acc=23, Macc=23, TA=3, Phalanx=2}, {Acc=24, Macc=24, TA=4, Phalanx=2}, {Acc=25, Macc=25, TA=4, Phalanx=2},
        {Acc=26, Macc=26, TA=4, Phalanx=2}, {Acc=27, Macc=27, TA=5, Phalanx=3}, {Acc=28, Macc=28, TA=5, Phalanx=3}, {Acc=29, Macc=29, TA=5, Phalanx=3}, {Acc=30, Macc=30, TA=6, Phalanx=4}
    }
}

-- Trust / Prestige / Sworn Platemail
local trust_platemail = {
    ['A'] = {
        {Acc=1, Macc=1}, {Acc=2, Macc=2}, {Acc=3, Macc=3}, {Acc=4, Macc=4}, {Acc=5, Macc=5},
        {Acc=6, Macc=6}, {Acc=7, Macc=7}, {Acc=8, Macc=8}, {Acc=9, Macc=9}, {Acc=10, Macc=10},
        {Acc=11, Macc=11}, {Acc=12, Macc=12}, {Acc=13, Macc=13}, {Acc=14, Macc=14}, {Acc=15, Macc=15, TA=1},
        {Acc=16, Macc=16, TA=1}, {Acc=17, Macc=17, TA=2}, {Acc=18, Macc=18, TA=2}, {Acc=19, Macc=19, TA=3}, {Acc=20, Macc=20, TA=3, Phalanx=1},
        {Acc=21, Macc=21, TA=4, Phalanx=1}, {Acc=22, Macc=22, TA=4, Phalanx=2}, {Acc=23, Macc=23, TA=5, Phalanx=2}, {Acc=24, Macc=24, TA=5, Phalanx=3}, {Acc=25, Macc=25, TA=6, Phalanx=3},
        {Acc=26, Macc=26, TA=6, Phalanx=4}, {Acc=27, Macc=27, TA=7, Phalanx=4}, {Acc=28, Macc=28, TA=7, Phalanx=5}, {Acc=29, Macc=29, TA=7, Phalanx=5}, {Acc=30, Macc=30, TA=8, Phalanx=6}
    }
}

-- Trust / Prestige / Sworn Gauntlets
local trust_gauntlets = {
    ['A'] = {
        {Acc=1, Macc=1}, {Acc=2, Macc=2}, {Acc=3, Macc=3}, {Acc=4, Macc=4}, {Acc=5, Macc=5},
        {Acc=6, Macc=6}, {Acc=7, Macc=7}, {Acc=8, Macc=8}, {Acc=9, Macc=9}, {Acc=10, Macc=10},
        {Acc=11, Macc=11}, {Acc=12, Macc=12}, {Acc=13, Macc=13}, {Acc=14, Macc=14}, {Acc=15, Macc=15, TA=1},
        {Acc=16, Macc=16, TA=1}, {Acc=17, Macc=17, TA=2}, {Acc=18, Macc=18, TA=2}, {Acc=19, Macc=19, TA=3}, {Acc=20, Macc=20, TA=3, Phalanx=1},
        {Acc=21, Macc=21, TA=4, Phalanx=1}, {Acc=22, Macc=22, TA=4, Phalanx=2}, {Acc=23, Macc=23, TA=4, Phalanx=2}, {Acc=24, Macc=24, TA=5, Phalanx=3}, {Acc=25, Macc=25, TA=5, Phalanx=3},
        {Acc=26, Macc=26, TA=5, Phalanx=3}, {Acc=27, Macc=27, TA=6, Phalanx=4}, {Acc=28, Macc=28, TA=6, Phalanx=4}, {Acc=29, Macc=29, TA=6, Phalanx=4}, {Acc=30, Macc=30, TA=7, Phalanx=5}
    }
}

-- Trust / Prestige / Sworn Brais
local trust_brais = {
    ['A'] = {
        {Acc=1, Macc=1}, {Acc=2, Macc=2}, {Acc=3, Macc=3}, {Acc=4, Macc=4}, {Acc=5, Macc=5},
        {Acc=6, Macc=6}, {Acc=7, Macc=7}, {Acc=8, Macc=8}, {Acc=9, Macc=9}, {Acc=10, Macc=10},
        {Acc=11, Macc=11}, {Acc=12, Macc=12}, {Acc=13, Macc=13}, {Acc=14, Macc=14}, {Acc=15, Macc=15, TA=1},
        {Acc=16, Macc=16, TA=1}, {Acc=17, Macc=17, TA=1}, {Acc=18, Macc=18, TA=2}, {Acc=19, Macc=19, TA=2}, {Acc=20, Macc=20, TA=2, Phalanx=1},
        {Acc=21, Macc=21, TA=3, Phalanx=1}, {Acc=22, Macc=22, TA=3, Phalanx=1}, {Acc=23, Macc=23, TA=3, Phalanx=2}, {Acc=24, Macc=24, TA=4, Phalanx=2}, {Acc=25, Macc=25, TA=4, Phalanx=2},
        {Acc=26, Macc=26, TA=4, Phalanx=2}, {Acc=27, Macc=27, TA=5, Phalanx=3}, {Acc=28, Macc=28, TA=5, Phalanx=3}, {Acc=29, Macc=29, TA=5, Phalanx=3}, {Acc=30, Macc=30, TA=6, Phalanx=4}
    }
}

-- Trust / Prestige / Sworn Sabatons
local trust_sabatons = {
    ['A'] = {
        {Acc=1, Macc=1}, {Acc=2, Macc=2}, {Acc=3, Macc=3}, {Acc=4, Macc=4}, {Acc=5, Macc=5},
        {Acc=6, Macc=6}, {Acc=7, Macc=7}, {Acc=8, Macc=8}, {Acc=9, Macc=9}, {Acc=10, Macc=10},
        {Acc=11, Macc=11}, {Acc=12, Macc=12}, {Acc=13, Macc=13}, {Acc=14, Macc=14}, {Acc=15, Macc=15, TA=1},
        {Acc=16, Macc=16, TA=1}, {Acc=17, Macc=17, TA=2}, {Acc=18, Macc=18, TA=2}, {Acc=19, Macc=19, TA=3}, {Acc=20, Macc=20, TA=3, Phalanx=1},
        {Acc=21, Macc=21, TA=4, Phalanx=1}, {Acc=22, Macc=22, TA=4, Phalanx=2}, {Acc=23, Macc=23, TA=4, Phalanx=2}, {Acc=24, Macc=24, TA=5, Phalanx=3}, {Acc=25, Macc=25, TA=5, Phalanx=3},
        {Acc=26, Macc=26, TA=5, Phalanx=3}, {Acc=27, Macc=27, TA=6, Phalanx=4}, {Acc=28, Macc=28, TA=6, Phalanx=4}, {Acc=29, Macc=29, TA=6, Phalanx=4}, {Acc=30, Macc=30, TA=7, Phalanx=5}
    }
}

-- Bravery / Intrepid / Indomitable Sets (Rank 30 only)
local bravery_petasos = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Macc=30, MAB=28, BPDmg=10, PetAcc=30, PetMacc=30}
    }
}
local bravery_coat = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Macc=30, MAB=32, BPDmg=12, PetAcc=30, PetMacc=30}
    }
}
local bravery_gloves = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Macc=30, MAB=30, BPDmg=11, PetAcc=30, PetMacc=30}
    }
}
local bravery_tonban = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Macc=30, MAB=28, BPDmg=10, PetAcc=30, PetMacc=30}
    }
}
local bravery_sabots = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Macc=30, MAB=30, BPDmg=11, PetAcc=30, PetMacc=30}
    }
}

-- Mercy / Grace / Clemency Somen
local mercy_somen = {
    ['A'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=2, Macc=2, PetAcc=3, PetMacc=3},
        {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5}, {Acc=6, Macc=6, PetAcc=6, PetMacc=6},
        {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9},
        {Acc=10, Macc=10, PetAcc=10, PetMacc=10}, {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12},
        {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, Enmity=-1, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, Enmity=-1, PetAcc=16, PetMacc=16}, {Acc=17, Macc=17, Enmity=-2, PetAcc=17, PetMacc=17}, {Acc=18, Macc=18, Enmity=-2, PetAcc=18, PetMacc=18},
        {Acc=19, Macc=19, Enmity=-3, PetAcc=19, PetMacc=19}, {Acc=20, Macc=20, Enmity=-3, QA=1, PetAcc=20, PetMacc=20}, {Acc=21, Macc=21, Enmity=-4, QA=1, PetAcc=21, PetMacc=21},
        {Acc=22, Macc=22, Enmity=-4, QA=1, PetAcc=22, PetMacc=22}, {Acc=23, Macc=23, Enmity=-5, QA=1, PetAcc=23, PetMacc=23}, {Acc=24, Macc=24, Enmity=-5, QA=2, PetAcc=24, PetMacc=24},
        {Acc=25, Macc=25, Enmity=-6, QA=2, PetAcc=25, PetMacc=25}, {Acc=26, Macc=26, Enmity=-6, QA=2, PetAcc=26, PetMacc=26}, {Acc=27, Macc=27, Enmity=-7, QA=3, PetAcc=27, PetMacc=27},
        {Acc=28, Macc=28, Enmity=-7, QA=3, PetAcc=28, PetMacc=28}, {Acc=29, Macc=29, Enmity=-8, QA=3, PetAcc=29, PetMacc=29}, {Acc=30, Macc=30, Enmity=-8, QA=4, PetAcc=30, PetMacc=30}
    }
}

-- Mercy / Grace / Clemency Haramaki (Rank 30 only)
local mercy_haramaki = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, Enmity=-10, QA=6, PetAcc=30, PetMacc=30}
    }
}

-- Mercy / Grace / Clemency Kote (Rank 30 only)
local mercy_kote = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, Enmity=-9, QA=5, PetAcc=30, PetMacc=30}
    }
}

-- Mercy / Grace / Clemency Haidate (Rank 30 only)
local mercy_haidate = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Acc=30, Racc=30, Macc=30, Enmity=-8, QA=4, PetAcc=30, PetMacc=30}
    }
}

-- Mercy / Grace / Clemency Sune-Ate
local mercy_sune_ate = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Racc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Racc=3, Macc=3, PetAcc=3, PetMacc=3},
        {Acc=4, Racc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Racc=5, Macc=5, PetAcc=5, PetMacc=5}, {Acc=6, Racc=6, Macc=6, PetAcc=6, PetMacc=6},
        {Acc=7, Racc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Racc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Racc=9, Macc=9, PetAcc=9, PetMacc=9},
        {Acc=10, Racc=10, Macc=10, PetAcc=10, PetMacc=10}, {Acc=11, Racc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Racc=12, Macc=12, PetAcc=12, PetMacc=12},
        {Acc=13, Racc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Racc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Racc=15, Macc=15, Enmity=-1, PetAcc=15, PetMacc=15},
        {Acc=16, Racc=16, Macc=16, Enmity=-2, PetAcc=16, PetMacc=16}, {Acc=17, Racc=17, Macc=17, Enmity=-2, PetAcc=17, PetMacc=17}, {Acc=18, Racc=18, Macc=18, Enmity=-3, PetAcc=18, PetMacc=18},
        {Acc=19, Racc=19, Macc=19, Enmity=-3, PetAcc=19, PetMacc=19}, {Acc=20, Racc=20, Macc=20, Enmity=-4, QA=1, PetAcc=20, PetMacc=20}, {Acc=21, Racc=21, Macc=21, Enmity=-4, QA=1, PetAcc=21, PetMacc=21},
        {Acc=22, Racc=22, Macc=22, Enmity=-5, QA=2, PetAcc=22, PetMacc=22}, {Acc=23, Racc=23, Macc=23, Enmity=-5, QA=2, PetAcc=23, PetMacc=23}, {Acc=24, Racc=24, Macc=24, Enmity=-6, QA=3, PetAcc=24, PetMacc=24},
        {Acc=25, Racc=25, Macc=25, Enmity=-6, QA=3, PetAcc=25, PetMacc=25}, {Acc=26, Racc=26, Macc=26, Enmity=-7, QA=3, PetAcc=26, PetMacc=26}, {Acc=27, Racc=27, Macc=27, Enmity=-7, QA=4, PetAcc=27, PetMacc=27},
        {Acc=28, Racc=28, Macc=28, Enmity=-8, QA=4, PetAcc=28, PetMacc=28}, {Acc=29, Racc=29, Macc=29, Enmity=-8, QA=4, PetAcc=29, PetMacc=29}, {Acc=30, Racc=30, Macc=30, Enmity=-9, QA=5, PetAcc=30, PetMacc=30}
    }
}

-- Auge / Daduchos / Telopanos Saber (Rank 30 only)
local auge_saber = {
    ['A'] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {DMG=18, MDMG=25, HP=150}
    }
}

-- Auge / Daduchos / Telopanos Grip
local auge_grip = {
    ['A'] = {
        {Atk=1, MDMG=1, HP=4},
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
        {Atk=30, MDMG=20, HP=100}
    }
}

-- Murky Ring (Base Item gives Pet stats, Augments give Player stats)
local murky_ring = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1}, {Acc=2, Racc=2, Macc=2}, {Acc=3, Racc=3, Macc=3},
        {Acc=4, Racc=4, Macc=4}, {Acc=5, Racc=5, Macc=5}, {Acc=6, Racc=6, Macc=6},
        {Acc=7, Racc=7, Macc=7}, {Acc=8, Racc=8, Macc=8}, {Acc=9, Racc=9, Macc=9},
        {Acc=10, Racc=10, Macc=10}, {Acc=11, Racc=11, Macc=11}, {Acc=12, Racc=12, Macc=12},
        {Acc=13, Racc=13, Macc=13}, {Acc=14, Racc=14, Macc=14}, {Acc=15, Racc=15, Macc=15},
        {Acc=15, Racc=15, Macc=15, Eva=1, Meva=1}, {Acc=15, Racc=15, Macc=15, Eva=2, Meva=2}, {Acc=15, Racc=15, Macc=15, Eva=3, Meva=3},
        {Acc=15, Racc=15, Macc=15, Eva=4, Meva=4}, {Acc=15, Racc=15, Macc=15, Eva=5, Meva=5}, {Acc=15, Racc=15, Macc=15, Eva=6, Meva=6},
        {Acc=15, Racc=15, Macc=15, Eva=7, Meva=7}, {Acc=15, Racc=15, Macc=15, Eva=8, Meva=8}, {Acc=15, Racc=15, Macc=15, Eva=9, Meva=9},
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10}, {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=1}, {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=2},
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=3}, {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=4}, {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=5}
    }
}

-- Murky Mantle
local murky_mantle = {
    ['A'] = {
        {Macc=1}, {Macc=2}, {Macc=3}, {Macc=4}, {Macc=5},
        {Macc=6, MDMG=1}, {Macc=7, MDMG=2}, {Macc=8, MDMG=3}, {Macc=9, MDMG=4}, {Macc=10, MDMG=5},
        {Macc=11, MDMG=6}, {Macc=12, MDMG=7}, {Macc=13, MDMG=8}, {Macc=14, MDMG=9}, {Macc=15, MDMG=10},
        {Macc=16, MDMG=11, INT=1}, {Macc=17, MDMG=12, INT=2}, {Macc=18, MDMG=13, INT=3}, {Macc=19, MDMG=14, INT=4}, {Macc=20, MDMG=15, INT=5},
        {Macc=20, MDMG=16, INT=6, Enmity=-1}, {Macc=21, MDMG=17, INT=7, Enmity=-2}, {Macc=21, MDMG=18, INT=8, Enmity=-3}, {Macc=22, MDMG=19, INT=9, Enmity=-4}, {Macc=22, MDMG=20, INT=10, Enmity=-5},
        {Macc=23, MDMG=21, INT=11, Enmity=-6}, {Macc=23, MDMG=22, INT=12, Enmity=-7}, {Macc=24, MDMG=23, INT=13, Enmity=-8}, {Macc=24, MDMG=24, INT=14, Enmity=-9}, {Macc=25, MDMG=25, INT=15, Enmity=-10}
    }
}

-- Alabaster Earring
local alabaster_earring = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1}, {Acc=2, Racc=2, Macc=2}, {Acc=3, Racc=3, Macc=3},
        {Acc=4, Racc=4, Macc=4}, {Acc=5, Racc=5, Macc=5}, {Acc=6, Racc=6, Macc=6},
        {Acc=7, Racc=7, Macc=7}, {Acc=8, Racc=8, Macc=8}, {Acc=9, Racc=9, Macc=9},
        {Acc=10, Racc=10, Macc=10}, {Acc=11, Racc=11, Macc=11}, {Acc=12, Racc=12, Macc=12},
        {Acc=13, Racc=13, Macc=13}, {Acc=14, Racc=14, Macc=14}, {Acc=15, Racc=15, Macc=15},
        {Acc=15, Racc=15, Macc=15, AllAttr=1}, {Acc=15, Racc=15, Macc=15, AllAttr=2}, {Acc=15, Racc=15, Macc=15, AllAttr=3},
        {Acc=15, Racc=15, Macc=15, AllAttr=4}, {Acc=15, Racc=15, Macc=15, AllAttr=5}, {Acc=15, Racc=15, Macc=15, AllAttr=6},
        {Acc=15, Racc=15, Macc=15, AllAttr=7}, {Acc=15, Racc=15, Macc=15, AllAttr=8}, {Acc=15, Racc=15, Macc=15, AllAttr=9},
        {Acc=15, Racc=15, Macc=15, AllAttr=10}, {Acc=15, Racc=15, Macc=15, AllAttr=10, STP=1}, {Acc=15, Racc=15, Macc=15, AllAttr=10, STP=2},
        {Acc=15, Racc=15, Macc=15, AllAttr=10, STP=3}, {Acc=15, Racc=15, Macc=15, AllAttr=10, STP=4}, {Acc=15, Racc=15, Macc=15, AllAttr=10, STP=5}
    }
}

-- Alabaster Mantle
local alabaster_mantle = {
    ['A'] = {
        {Acc=1, Racc=1}, {Acc=2, Racc=2}, {Acc=3, Racc=3}, {Acc=4, Racc=4}, {Acc=5, Racc=5},
        {Acc=6, Racc=6, Atk=1, Ratk=1}, {Acc=7, Racc=7, Atk=2, Ratk=2}, {Acc=8, Racc=8, Atk=3, Ratk=3}, {Acc=9, Racc=9, Atk=4, Ratk=4}, {Acc=10, Racc=10, Atk=5, Ratk=5},
        {Acc=11, Racc=11, Atk=6, Ratk=6}, {Acc=12, Racc=12, Atk=7, Ratk=7}, {Acc=13, Racc=13, Atk=8, Ratk=8}, {Acc=14, Racc=14, Atk=9, Ratk=9}, {Acc=15, Racc=15, Atk=10, Ratk=10},
        {Acc=16, Racc=16, Atk=11, Ratk=11, StrDex=1}, {Acc=17, Racc=17, Atk=12, Ratk=12, StrDex=2}, {Acc=18, Racc=18, Atk=13, Ratk=13, StrDex=3}, {Acc=19, Racc=19, Atk=14, Ratk=14, StrDex=4}, {Acc=20, Racc=20, Atk=15, Ratk=15, StrDex=5},
        {Acc=20, Racc=20, Atk=16, Ratk=16, StrDex=6, Enmity=-1}, {Acc=21, Racc=21, Atk=17, Ratk=17, StrDex=7, Enmity=-2}, {Acc=21, Racc=21, Atk=18, Ratk=18, StrDex=8, Enmity=-3}, {Acc=22, Racc=22, Atk=19, Ratk=19, StrDex=9, Enmity=-4}, {Acc=22, Racc=22, Atk=20, Ratk=20, StrDex=10, Enmity=-5},
        {Acc=23, Racc=23, Atk=21, Ratk=21, StrDex=11, Enmity=-6}, {Acc=23, Racc=23, Atk=22, Ratk=22, StrDex=12, Enmity=-7}, {Acc=24, Racc=24, Atk=23, Ratk=23, StrDex=13, Enmity=-8}, {Acc=24, Racc=24, Atk=24, Ratk=24, StrDex=14, Enmity=-9}, {Acc=25, Racc=25, Atk=25, Ratk=25, StrDex=15, Enmity=-10}
    }
}

-- ==============================================================================
-- DISTRIBUTE INTO RANK ARRAYS (1-30)
-- ==============================================================================
for r = 1, 30 do
    -- Crowns
    limbus_tables[r][24165] = { ['A'] = expand_stats(justice_crown['A'][r]) }     -- Justice Crown
    limbus_tables[r][24166] = { ['A'] = expand_stats(justice_crown['A'][r]) }     -- Magnificent Crown
    limbus_tables[r][24167] = { ['A'] = expand_stats(justice_crown['A'][r]) }     -- Duty Crown
    limbus_tables[r][24120] = { ['A'] = expand_stats(hope_masque['A'][r]) }       -- Hope Masque
    limbus_tables[r][24121] = { ['A'] = expand_stats(hope_masque['A'][r]) }       -- Perfection Masque
    limbus_tables[r][24122] = { ['A'] = expand_stats(hope_masque['A'][r]) }       -- Revelation Masque
    limbus_tables[r][24135] = { ['A'] = expand_stats(trust_crown['A'][r]) }       -- Trust Crown
    limbus_tables[r][24136] = { ['A'] = expand_stats(trust_crown['A'][r]) }       -- Prestige Crown
    limbus_tables[r][24137] = { ['A'] = expand_stats(trust_crown['A'][r]) }       -- Sworn Crown
    limbus_tables[r][24150] = { ['A'] = expand_stats(bravery_petasos['A'][r]) }   -- Bravery Petasos
    limbus_tables[r][24151] = { ['A'] = expand_stats(bravery_petasos['A'][r]) }   -- Intrepid Petasos
    limbus_tables[r][24152] = { ['A'] = expand_stats(bravery_petasos['A'][r]) }   -- Indomitable Petasos
    limbus_tables[r][24180] = { ['A'] = expand_stats(mercy_somen['A'][r]) }       -- Mercy Somen
    limbus_tables[r][24181] = { ['A'] = expand_stats(mercy_somen['A'][r]) }       -- Grace Somen
    limbus_tables[r][24182] = { ['A'] = expand_stats(mercy_somen['A'][r]) }       -- Clemency Somen

    -- Bodies
    limbus_tables[r][24168] = { ['A'] = expand_stats(justice_cyclas['A'][r]) }    -- Justice Cyclas
    limbus_tables[r][24169] = { ['A'] = expand_stats(justice_cyclas['A'][r]) }    -- Magnificent Cyclas
    limbus_tables[r][24170] = { ['A'] = expand_stats(justice_cyclas['A'][r]) }    -- Duty Cyclas
    limbus_tables[r][24123] = { ['A'] = expand_stats(hope_platemail['A'][r]) }    -- Hope Platemail
    limbus_tables[r][24124] = { ['A'] = expand_stats(hope_platemail['A'][r]) }    -- Perfection Platemail
    limbus_tables[r][24125] = { ['A'] = expand_stats(hope_platemail['A'][r]) }    -- Revelation Platemail
    limbus_tables[r][24138] = { ['A'] = expand_stats(trust_platemail['A'][r]) }   -- Trust Platemail
    limbus_tables[r][24139] = { ['A'] = expand_stats(trust_platemail['A'][r]) }   -- Prestige Platemail
    limbus_tables[r][24140] = { ['A'] = expand_stats(trust_platemail['A'][r]) }   -- Sworn Platemail
    limbus_tables[r][24153] = { ['A'] = expand_stats(bravery_coat['A'][r]) }      -- Bravery Coat
    limbus_tables[r][24154] = { ['A'] = expand_stats(bravery_coat['A'][r]) }      -- Intrepid Coat
    limbus_tables[r][24155] = { ['A'] = expand_stats(bravery_coat['A'][r]) }      -- Indomitable Coat
    limbus_tables[r][24183] = { ['A'] = expand_stats(mercy_haramaki['A'][r]) }    -- Mercy Haramaki
    limbus_tables[r][24184] = { ['A'] = expand_stats(mercy_haramaki['A'][r]) }    -- Grace Haramaki
    limbus_tables[r][24185] = { ['A'] = expand_stats(mercy_haramaki['A'][r]) }    -- Clemency Haramaki

    -- Hands
    limbus_tables[r][24171] = { ['A'] = expand_stats(justice_gauntlets['A'][r]) } -- Justice Gauntlets
    limbus_tables[r][24172] = { ['A'] = expand_stats(justice_gauntlets['A'][r]) } -- Magnificent Gauntlets
    limbus_tables[r][24173] = { ['A'] = expand_stats(justice_gauntlets['A'][r]) } -- Duty Gauntlets
    limbus_tables[r][24126] = { ['A'] = expand_stats(hope_gauntlets['A'][r]) }    -- Hope Gauntlets
    limbus_tables[r][24127] = { ['A'] = expand_stats(hope_gauntlets['A'][r]) }    -- Perfection Gauntlets
    limbus_tables[r][24128] = { ['A'] = expand_stats(hope_gauntlets['A'][r]) }    -- Revelation Gauntlets
    limbus_tables[r][24141] = { ['A'] = expand_stats(trust_gauntlets['A'][r]) }   -- Trust Gauntlets
    limbus_tables[r][24142] = { ['A'] = expand_stats(trust_gauntlets['A'][r]) }   -- Prestige Gauntlets
    limbus_tables[r][24143] = { ['A'] = expand_stats(trust_gauntlets['A'][r]) }   -- Sworn Gauntlets
    limbus_tables[r][24156] = { ['A'] = expand_stats(bravery_gloves['A'][r]) }    -- Bravery Gloves
    limbus_tables[r][24157] = { ['A'] = expand_stats(bravery_gloves['A'][r]) }    -- Intrepid Gloves
    limbus_tables[r][24158] = { ['A'] = expand_stats(bravery_gloves['A'][r]) }    -- Indomitable Gloves
    limbus_tables[r][24186] = { ['A'] = expand_stats(mercy_kote['A'][r]) }        -- Mercy Kote
    limbus_tables[r][24187] = { ['A'] = expand_stats(mercy_kote['A'][r]) }        -- Grace Kote
    limbus_tables[r][24188] = { ['A'] = expand_stats(mercy_kote['A'][r]) }        -- Clemency Kote

    -- Legs
    limbus_tables[r][24174] = { ['A'] = expand_stats(justice_flanchard['A'][r]) } -- Justice Flanchard
    limbus_tables[r][24175] = { ['A'] = expand_stats(justice_flanchard['A'][r]) } -- Magnificent Flanchard
    limbus_tables[r][24176] = { ['A'] = expand_stats(justice_flanchard['A'][r]) } -- Duty Flanchard
    limbus_tables[r][24129] = { ['A'] = expand_stats(hope_brais['A'][r]) }        -- Hope Brais
    limbus_tables[r][24130] = { ['A'] = expand_stats(hope_brais['A'][r]) }        -- Perfection Brais
    limbus_tables[r][24131] = { ['A'] = expand_stats(hope_brais['A'][r]) }        -- Revelation Brais
    limbus_tables[r][24144] = { ['A'] = expand_stats(trust_brais['A'][r]) }       -- Trust Brais
    limbus_tables[r][24145] = { ['A'] = expand_stats(trust_brais['A'][r]) }       -- Prestige Brais
    limbus_tables[r][24146] = { ['A'] = expand_stats(trust_brais['A'][r]) }       -- Sworn Brais
    limbus_tables[r][24159] = { ['A'] = expand_stats(bravery_tonban['A'][r]) }    -- Bravery Tonban
    limbus_tables[r][24160] = { ['A'] = expand_stats(bravery_tonban['A'][r]) }    -- Intrepid Tonban
    limbus_tables[r][24161] = { ['A'] = expand_stats(bravery_tonban['A'][r]) }    -- Indomitable Tonban
    limbus_tables[r][24189] = { ['A'] = expand_stats(mercy_haidate['A'][r]) }     -- Mercy Haidate
    limbus_tables[r][24190] = { ['A'] = expand_stats(mercy_haidate['A'][r]) }     -- Grace Haidate
    limbus_tables[r][24191] = { ['A'] = expand_stats(mercy_haidate['A'][r]) }     -- Clemency Haidate

    -- Feet
    limbus_tables[r][24177] = { ['A'] = expand_stats(justice_sollerets['A'][r]) } -- Justice Sollerets
    limbus_tables[r][24178] = { ['A'] = expand_stats(justice_sollerets['A'][r]) } -- Magnificent Sollerets
    limbus_tables[r][24179] = { ['A'] = expand_stats(justice_sollerets['A'][r]) } -- Duty Sollerets
    limbus_tables[r][24132] = { ['A'] = expand_stats(hope_sabatons['A'][r]) }     -- Hope Sabatons
    limbus_tables[r][24133] = { ['A'] = expand_stats(hope_sabatons['A'][r]) }     -- Perfection Sabatons
    limbus_tables[r][24134] = { ['A'] = expand_stats(hope_sabatons['A'][r]) }     -- Revelation Sabatons
    limbus_tables[r][24147] = { ['A'] = expand_stats(trust_sabatons['A'][r]) }    -- Trust Sabatons
    limbus_tables[r][24148] = { ['A'] = expand_stats(trust_sabatons['A'][r]) }    -- Prestige Sabatons
    limbus_tables[r][24149] = { ['A'] = expand_stats(trust_sabatons['A'][r]) }    -- Sworn Sabatons
    limbus_tables[r][24162] = { ['A'] = expand_stats(bravery_sabots['A'][r]) }    -- Bravery Sabots
    limbus_tables[r][24163] = { ['A'] = expand_stats(bravery_sabots['A'][r]) }    -- Intrepid Sabots
    limbus_tables[r][24164] = { ['A'] = expand_stats(bravery_sabots['A'][r]) }    -- Indomitable Sabots
    limbus_tables[r][24192] = { ['A'] = expand_stats(mercy_sune_ate['A'][r]) }    -- Mercy Sune-Ate
    limbus_tables[r][24193] = { ['A'] = expand_stats(mercy_sune_ate['A'][r]) }    -- Grace Sune-Ate
    limbus_tables[r][24194] = { ['A'] = expand_stats(mercy_sune_ate['A'][r]) }    -- Clemency Sune-Ate

    -- Weapons & Grips
    limbus_tables[r][22186] = { ['A'] = expand_stats(auge_saber['A'][r]) }        -- Auge Saber
    limbus_tables[r][22187] = { ['A'] = expand_stats(auge_saber['A'][r]) }        -- Daduchos Saber
    limbus_tables[r][22188] = { ['A'] = expand_stats(auge_saber['A'][r]) }        -- Telopanos Saber
    limbus_tables[r][18798] = { ['A'] = expand_stats(auge_grip['A'][r]) }         -- Auge Grip
    limbus_tables[r][18799] = { ['A'] = expand_stats(auge_grip['A'][r]) }         -- Daduchos Grip
    limbus_tables[r][18800] = { ['A'] = expand_stats(auge_grip['A'][r]) }         -- Telopanos Grip

    -- Accessories
    limbus_tables[r][26234] = { ['A'] = expand_stats(murky_ring['A'][r]) }        -- Murky Ring
    limbus_tables[r][26276] = { ['A'] = expand_stats(murky_mantle['A'][r]) }      -- Murky Mantle
    limbus_tables[r][26119] = { ['A'] = expand_stats(alabaster_earring['A'][r]) } -- Alabaster Earring
    limbus_tables[r][26275] = { ['A'] = expand_stats(alabaster_mantle['A'][r]) }  -- Alabaster Mantle
end

return limbus_tables