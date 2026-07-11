-- /data/odyssey.lua
-- Contains explicit path and rank data for perfect accuracy.

-- MUST BE DECLARED AT THE VERY TOP
local ody_tables = {}
for i = 1, 30 do ody_tables[i] = {} end

-- ==============================================================================
-- NYAME GEAR (IDs: 23761, 23768, 23775, 23782, 23789)
-- ==============================================================================
local nyame_helm = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1, STP=1}, {Acc=2, Racc=2, Macc=2, STP=1}, {Acc=3, Racc=3, Macc=3, STP=2}, {Acc=4, Racc=4, Macc=4, STP=2}, {Acc=5, Racc=5, Macc=5, STP=3},
        {Acc=6, Racc=6, Macc=6, STP=3}, {Acc=7, Racc=7, Macc=7, STP=4}, {Acc=8, Racc=8, Macc=8, STP=4}, {Acc=9, Racc=9, Macc=9, STP=5}, {Acc=10, Racc=10, Macc=10, STP=5},
        {Acc=11, Racc=11, Macc=11, STP=6}, {Acc=12, Racc=12, Macc=12, STP=6}, {Acc=13, Racc=13, Macc=13, STP=7}, {Acc=14, Racc=14, Macc=14, STP=7}, {Acc=15, Racc=15, Macc=15, STP=8},
        {Acc=16, Racc=16, Macc=16, STP=8, PDL=1}, {Acc=17, Racc=17, Macc=17, STP=8, PDL=1}, {Acc=18, Racc=18, Macc=18, STP=9, PDL=1}, {Acc=19, Racc=19, Macc=19, STP=9, PDL=2}, {Acc=20, Racc=20, Macc=20, STP=9, PDL=2},
        {Acc=21, Racc=21, Macc=21, STP=10, PDL=2, Crit=1}, {Acc=22, Racc=22, Macc=22, STP=10, PDL=3, Crit=2}, {Acc=23, Racc=23, Macc=23, STP=10, PDL=3, Crit=3}, {Acc=24, Racc=24, Macc=24, STP=11, PDL=3, Crit=4}, {Acc=25, Racc=25, Macc=25, STP=11, PDL=4, Crit=5},
        {Acc=26, Racc=26, Macc=26, STP=11, PDL=4, Crit=6}, {Acc=27, Racc=27, Macc=27, STP=12, PDL=4, Crit=7}, {Acc=28, Racc=28, Macc=28, STP=12, PDL=5, Crit=8}, {Acc=29, Racc=29, Macc=29, STP=12, PDL=5, Crit=9}, {Acc=30, Racc=30, Macc=30, STP=13, PDL=5, Crit=10}
    },
    ['B'] = {
        {Atk=2, Ratk=2, WSD=1}, {Atk=4, Ratk=4, WSD=1}, {Atk=6, Ratk=6, WSD=2}, {Atk=8, Ratk=8, WSD=2}, {Atk=10, Ratk=10, WSD=3},
        {Atk=11, Ratk=11, WSD=3}, {Atk=12, Ratk=12, WSD=4}, {Atk=13, Ratk=13, WSD=4}, {Atk=14, Ratk=14, WSD=4}, {Atk=15, Ratk=15, WSD=5},
        {Atk=16, Ratk=16, WSD=5}, {Atk=17, Ratk=17, WSD=5}, {Atk=18, Ratk=18, WSD=6}, {Atk=19, Ratk=19, WSD=6}, {Atk=20, Ratk=20, WSD=6},
        {Atk=21, Ratk=21, WSD=7, DA=1}, {Atk=22, Ratk=22, WSD=7, DA=1}, {Atk=23, Ratk=23, WSD=7, DA=1}, {Atk=24, Ratk=24, WSD=8, DA=2}, {Atk=25, Ratk=25, WSD=8, DA=2},
        {Atk=26, Ratk=26, WSD=8, DA=2, Acc=1, Racc=1}, {Atk=27, Ratk=27, WSD=9, DA=3, Acc=2, Racc=2}, {Atk=28, Ratk=28, WSD=9, DA=3, Acc=3, Racc=3}, {Atk=29, Ratk=29, WSD=9, DA=3, Acc=4, Racc=4}, {Atk=30, Ratk=30, WSD=10, DA=4, Acc=5, Racc=5},
        {Atk=31, Ratk=31, WSD=10, DA=4, Acc=6, Racc=6}, {Atk=32, Ratk=32, WSD=10, DA=4, Acc=7, Racc=7}, {Atk=33, Ratk=33, WSD=11, DA=5, Acc=8, Racc=8}, {Atk=34, Ratk=34, WSD=11, DA=5, Acc=9, Racc=9}, {Atk=35, Ratk=35, WSD=11, DA=5, Acc=10, Racc=10}
    },
    ['C'] = {
        {MAB=2, MDMG=1}, {MAB=4, MDMG=2}, {MAB=6, MDMG=3}, {MAB=8, MDMG=4}, {MAB=10, MDMG=5},
        {MAB=11, MDMG=6}, {MAB=12, MDMG=7}, {MAB=13, MDMG=8}, {MAB=14, MDMG=9}, {MAB=15, MDMG=10},
        {MAB=16, MDMG=11}, {MAB=17, MDMG=12}, {MAB=18, MDMG=13}, {MAB=19, MDMG=14}, {MAB=20, MDMG=15},
        {MAB=21, MDMG=16, MBD2=1}, {MAB=22, MDMG=17, MBD2=1}, {MAB=23, MDMG=18, MBD2=2}, {MAB=24, MDMG=19, MBD2=2}, {MAB=25, MDMG=20, MBD2=2},
        {MAB=26, MDMG=21, MBD2=3, Macc=1}, {MAB=27, MDMG=22, MBD2=3, Macc=2}, {MAB=28, MDMG=23, MBD2=3, Macc=3}, {MAB=29, MDMG=24, MBD2=4, Macc=4}, {MAB=30, MDMG=25, MBD2=4, Macc=5},
        {MAB=31, MDMG=26, MBD2=4, Macc=6}, {MAB=32, MDMG=27, MBD2=5, Macc=7}, {MAB=33, MDMG=28, MBD2=5, Macc=8}, {MAB=34, MDMG=29, MBD2=5, Macc=9}, {MAB=35, MDMG=30, MBD2=6, Macc=10}
    },
    ['D'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3}, {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5},
        {Acc=6, Macc=6, PetAcc=6, PetMacc=6}, {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9}, {Acc=10, Macc=10, PetAcc=10, PetMacc=10},
        {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12}, {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, PetAcc=16, PetMacc=16, PetAttr=1}, {Acc=17, Macc=17, PetAcc=17, PetMacc=17, PetAttr=2}, {Acc=18, Macc=18, PetAcc=18, PetMacc=18, PetAttr=3}, {Acc=19, Macc=19, PetAcc=19, PetMacc=19, PetAttr=4}, {Acc=20, Macc=20, PetAcc=20, PetMacc=20, PetAttr=5},
        {Acc=21, Macc=21, PetAcc=21, PetMacc=21, PetAttr=6, PetDT=-1}, {Acc=22, Macc=22, PetAcc=22, PetMacc=22, PetAttr=7, PetDT=-2}, {Acc=23, Macc=23, PetAcc=23, PetMacc=23, PetAttr=8, PetDT=-3}, {Acc=24, Macc=24, PetAcc=24, PetMacc=24, PetAttr=9, PetDT=-4}, {Acc=25, Macc=25, PetAcc=25, PetMacc=25, PetAttr=10, PetDT=-5},
        {Acc=26, Macc=26, PetAcc=26, PetMacc=26, PetAttr=11, PetDT=-6}, {Acc=27, Macc=27, PetAcc=27, PetMacc=27, PetAttr=12, PetDT=-6}, {Acc=28, Macc=28, PetAcc=28, PetMacc=28, PetAttr=13, PetDT=-7}, {Acc=29, Macc=29, PetAcc=29, PetMacc=29, PetAttr=14, PetDT=-7}, {Acc=30, Macc=30, PetAcc=30, PetMacc=30, PetAttr=15, PetDT=-8}
    }
}

local nyame_mail = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1, STP=1}, {Acc=2, Racc=2, Macc=2, STP=1}, {Acc=3, Racc=3, Macc=3, STP=2}, {Acc=4, Racc=4, Macc=4, STP=2}, {Acc=5, Racc=5, Macc=5, STP=3},
        {Acc=6, Racc=6, Macc=6, STP=3}, {Acc=7, Racc=7, Macc=7, STP=4}, {Acc=8, Racc=8, Macc=8, STP=4}, {Acc=9, Racc=9, Macc=9, STP=5}, {Acc=10, Racc=10, Macc=10, STP=5},
        {Acc=11, Racc=11, Macc=11, STP=6}, {Acc=12, Racc=12, Macc=12, STP=6}, {Acc=13, Racc=13, Macc=13, STP=7}, {Acc=14, Racc=14, Macc=14, STP=7}, {Acc=15, Racc=15, Macc=15, STP=8},
        {Acc=16, Racc=16, Macc=16, STP=8, PDL=1}, {Acc=17, Racc=17, Macc=17, STP=9, PDL=1}, {Acc=18, Racc=18, Macc=18, STP=9, PDL=2}, {Acc=19, Racc=19, Macc=19, STP=10, PDL=2}, {Acc=20, Racc=20, Macc=20, STP=10, PDL=3},
        {Acc=21, Racc=21, Macc=21, STP=11, PDL=3, DEX=1, AGI=1}, {Acc=22, Racc=22, Macc=22, STP=11, PDL=4, DEX=2, AGI=2}, {Acc=23, Racc=23, Macc=23, STP=12, PDL=4, DEX=3, AGI=3}, {Acc=24, Racc=24, Macc=24, STP=12, PDL=5, DEX=4, AGI=4}, {Acc=25, Racc=25, Macc=25, STP=13, PDL=5, DEX=5, AGI=5},
        {Acc=26, Racc=26, Macc=26, STP=13, PDL=6, DEX=6, AGI=6}, {Acc=27, Racc=27, Macc=27, STP=14, PDL=6, DEX=7, AGI=7}, {Acc=28, Racc=28, Macc=28, STP=14, PDL=7, DEX=8, AGI=8}, {Acc=29, Racc=29, Macc=29, STP=15, PDL=7, DEX=9, AGI=9}, {Acc=30, Racc=30, Macc=30, STP=15, PDL=7, DEX=10, AGI=10}
    },
    ['B'] = {
        {Atk=2, Ratk=2, WSD=1}, {Atk=4, Ratk=4, WSD=1}, {Atk=6, Ratk=6, WSD=2}, {Atk=8, Ratk=8, WSD=2}, {Atk=10, Ratk=10, WSD=3},
        {Atk=11, Ratk=11, WSD=3}, {Atk=12, Ratk=12, WSD=4}, {Atk=13, Ratk=13, WSD=4}, {Atk=14, Ratk=14, WSD=5}, {Atk=15, Ratk=15, WSD=5},
        {Atk=16, Ratk=16, WSD=6}, {Atk=17, Ratk=17, WSD=6}, {Atk=18, Ratk=18, WSD=7}, {Atk=19, Ratk=19, WSD=7}, {Atk=20, Ratk=20, WSD=8},
        {Atk=21, Ratk=21, WSD=8, DA=1}, {Atk=22, Ratk=22, WSD=9, DA=1}, {Atk=23, Ratk=23, WSD=9, DA=2}, {Atk=24, Ratk=24, WSD=10, DA=2}, {Atk=25, Ratk=25, WSD=10, DA=3},
        {Atk=26, Ratk=26, WSD=10, DA=3, STR=1, VIT=1}, {Atk=27, Ratk=27, WSD=11, DA=4, STR=2, VIT=2}, {Atk=28, Ratk=28, WSD=11, DA=4, STR=3, VIT=3}, {Atk=29, Ratk=29, WSD=11, DA=5, STR=4, VIT=4}, {Atk=30, Ratk=30, WSD=12, DA=5, STR=5, VIT=5},
        {Atk=31, Ratk=31, WSD=12, DA=6, STR=6, VIT=6}, {Atk=32, Ratk=32, WSD=12, DA=6, STR=7, VIT=7}, {Atk=33, Ratk=33, WSD=13, DA=7, STR=8, VIT=8}, {Atk=34, Ratk=34, WSD=13, DA=7, STR=9, VIT=9}, {Atk=35, Ratk=35, WSD=13, DA=7, STR=10, VIT=10}
    },
    ['C'] = {
        {MAB=2, MDMG=2}, {MAB=4, MDMG=4}, {MAB=6, MDMG=6}, {MAB=8, MDMG=8}, {MAB=10, MDMG=10},
        {MAB=11, MDMG=12}, {MAB=12, MDMG=14}, {MAB=13, MDMG=16}, {MAB=14, MDMG=18}, {MAB=15, MDMG=20},
        {MAB=16, MDMG=21}, {MAB=17, MDMG=22}, {MAB=18, MDMG=23}, {MAB=19, MDMG=24}, {MAB=20, MDMG=25},
        {MAB=21, MDMG=26, MBD2=1}, {MAB=22, MDMG=27, MBD2=1}, {MAB=23, MDMG=28, MBD2=2}, {MAB=24, MDMG=29, MBD2=2}, {MAB=25, MDMG=30, MBD2=3},
        {MAB=26, MDMG=31, MBD2=3, INT=1, MND=1, CHR=1}, {MAB=27, MDMG=32, MBD2=4, INT=2, MND=2, CHR=2}, {MAB=28, MDMG=33, MBD2=4, INT=3, MND=3, CHR=3}, {MAB=29, MDMG=34, MBD2=5, INT=4, MND=4, CHR=4}, {MAB=30, MDMG=35, MBD2=5, INT=5, MND=5, CHR=5},
        {MAB=31, MDMG=36, MBD2=6, INT=6, MND=6, CHR=6}, {MAB=32, MDMG=37, MBD2=6, INT=7, MND=7, CHR=7}, {MAB=33, MDMG=38, MBD2=7, INT=8, MND=8, CHR=8}, {MAB=34, MDMG=39, MBD2=7, INT=9, MND=9, CHR=9}, {MAB=35, MDMG=40, MBD2=7, INT=10, MND=10, CHR=10}
    },
    ['D'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3}, {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5},
        {Acc=6, Macc=6, PetAcc=6, PetMacc=6}, {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9}, {Acc=10, Macc=10, PetAcc=10, PetMacc=10},
        {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12}, {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, PetAcc=16, PetMacc=16, PetDMG=1}, {Acc=17, Macc=17, PetAcc=17, PetMacc=17, PetDMG=2}, {Acc=18, Macc=18, PetAcc=18, PetMacc=18, PetDMG=3}, {Acc=19, Macc=19, PetAcc=19, PetMacc=19, PetDMG=4}, {Acc=20, Macc=20, PetAcc=20, PetMacc=20, PetDMG=5},
        {Acc=21, Macc=21, PetAcc=21, PetMacc=21, PetDMG=6, PetDT=-1}, {Acc=22, Macc=22, PetAcc=22, PetMacc=22, PetDMG=7, PetDT=-2}, {Acc=23, Macc=23, PetAcc=23, PetMacc=23, PetDMG=7, PetDT=-3}, {Acc=24, Macc=24, PetAcc=24, PetMacc=24, PetDMG=8, PetDT=-4}, {Acc=25, Macc=25, PetAcc=25, PetMacc=25, PetDMG=8, PetDT=-5},
        {Acc=26, Macc=26, PetAcc=26, PetMacc=26, PetDMG=9, PetDT=-6}, {Acc=27, Macc=27, PetAcc=27, PetMacc=27, PetDMG=9, PetDT=-7}, {Acc=28, Macc=28, PetAcc=28, PetMacc=28, PetDMG=10, PetDT=-8}, {Acc=29, Macc=29, PetAcc=29, PetMacc=29, PetDMG=10, PetDT=-9}, {Acc=30, Macc=30, PetAcc=30, PetMacc=30, PetDMG=11, PetDT=-10}
    }
}

local nyame_hands = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1, STP=1}, {Acc=2, Racc=2, Macc=2, STP=1}, {Acc=3, Racc=3, Macc=3, STP=2}, {Acc=4, Racc=4, Macc=4, STP=2}, {Acc=5, Racc=5, Macc=5, STP=3},
        {Acc=6, Racc=6, Macc=6, STP=3}, {Acc=7, Racc=7, Macc=7, STP=4}, {Acc=8, Racc=8, Macc=8, STP=4}, {Acc=9, Racc=9, Macc=9, STP=5}, {Acc=10, Racc=10, Macc=10, STP=5},
        {Acc=11, Racc=11, Macc=11, STP=6}, {Acc=12, Racc=12, Macc=12, STP=6}, {Acc=13, Racc=13, Macc=13, STP=7}, {Acc=14, Racc=14, Macc=14, STP=7}, {Acc=15, Racc=15, Macc=15, STP=8},
        {Acc=16, Racc=16, Macc=16, STP=8, PDL=1}, {Acc=17, Racc=17, Macc=17, STP=9, PDL=1}, {Acc=18, Racc=18, Macc=18, STP=9, PDL=1}, {Acc=19, Racc=19, Macc=19, STP=10, PDL=2}, {Acc=20, Racc=20, Macc=20, STP=10, PDL=2},
        {Acc=21, Racc=21, Macc=21, STP=11, PDL=2, DEX=2}, {Acc=22, Racc=22, Macc=22, STP=11, PDL=3, DEX=4}, {Acc=23, Racc=23, Macc=23, STP=12, PDL=3, DEX=6}, {Acc=24, Racc=24, Macc=24, STP=12, PDL=3, DEX=8}, {Acc=25, Racc=25, Macc=25, STP=13, PDL=4, DEX=10},
        {Acc=26, Racc=26, Macc=26, STP=13, PDL=4, DEX=11}, {Acc=27, Racc=27, Macc=27, STP=13, PDL=4, DEX=12}, {Acc=28, Racc=28, Macc=28, STP=14, PDL=5, DEX=13}, {Acc=29, Racc=29, Macc=29, STP=14, PDL=5, DEX=14}, {Acc=30, Racc=30, Macc=30, STP=14, PDL=5, DEX=15}
    },
    ['B'] = {
        {Atk=2, Ratk=2, WSD=1}, {Atk=4, Ratk=4, WSD=1}, {Atk=6, Ratk=6, WSD=2}, {Atk=8, Ratk=8, WSD=2}, {Atk=10, Ratk=10, WSD=3},
        {Atk=11, Ratk=11, WSD=3}, {Atk=12, Ratk=12, WSD=4}, {Atk=13, Ratk=13, WSD=4}, {Atk=14, Ratk=14, WSD=4}, {Atk=15, Ratk=15, WSD=5},
        {Atk=16, Ratk=16, WSD=5}, {Atk=17, Ratk=17, WSD=5}, {Atk=18, Ratk=18, WSD=6}, {Atk=19, Ratk=19, WSD=6}, {Atk=20, Ratk=20, WSD=6},
        {Atk=21, Ratk=21, WSD=7, DA=1}, {Atk=22, Ratk=22, WSD=7, DA=1}, {Atk=23, Ratk=23, WSD=7, DA=1}, {Atk=24, Ratk=24, WSD=8, DA=2}, {Atk=25, Ratk=25, WSD=8, DA=2},
        {Atk=26, Ratk=26, WSD=8, DA=2, VIT=2}, {Atk=27, Ratk=27, WSD=9, DA=3, VIT=4}, {Atk=28, Ratk=28, WSD=9, DA=3, VIT=6}, {Atk=29, Ratk=29, WSD=9, DA=3, VIT=8}, {Atk=30, Ratk=30, WSD=10, DA=4, VIT=10},
        {Atk=31, Ratk=31, WSD=10, DA=4, VIT=11}, {Atk=32, Ratk=32, WSD=10, DA=4, VIT=12}, {Atk=33, Ratk=33, WSD=11, DA=5, VIT=13}, {Atk=34, Ratk=34, WSD=11, DA=5, VIT=14}, {Atk=35, Ratk=35, WSD=11, DA=5, VIT=15}
    },
    ['C'] = {
        {MAB=2, MDMG=1}, {MAB=4, MDMG=2}, {MAB=6, MDMG=3}, {MAB=8, MDMG=4}, {MAB=10, MDMG=5},
        {MAB=11, MDMG=6}, {MAB=12, MDMG=7}, {MAB=13, MDMG=8}, {MAB=14, MDMG=9}, {MAB=15, MDMG=10},
        {MAB=16, MDMG=11}, {MAB=17, MDMG=12}, {MAB=18, MDMG=13}, {MAB=19, MDMG=14}, {MAB=20, MDMG=15},
        {MAB=21, MDMG=16, MBD2=1}, {MAB=22, MDMG=17, MBD2=1}, {MAB=23, MDMG=18, MBD2=1}, {MAB=24, MDMG=19, MBD2=2}, {MAB=25, MDMG=20, MBD2=2},
        {MAB=26, MDMG=21, MBD2=2, MND=2}, {MAB=27, MDMG=22, MBD2=3, MND=4}, {MAB=28, MDMG=23, MBD2=3, MND=6}, {MAB=29, MDMG=24, MBD2=3, MND=8}, {MAB=30, MDMG=25, MBD2=4, MND=10},
        {MAB=31, MDMG=26, MBD2=4, MND=11}, {MAB=32, MDMG=27, MBD2=4, MND=12}, {MAB=33, MDMG=28, MBD2=5, MND=13}, {MAB=34, MDMG=29, MBD2=5, MND=14}, {MAB=35, MDMG=30, MBD2=5, MND=15}
    },
    ['D'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3}, {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5},
        {Acc=6, Macc=6, PetAcc=6, PetMacc=6}, {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9}, {Acc=10, Macc=10, PetAcc=10, PetMacc=10},
        {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12}, {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, PetAcc=16, PetMacc=16, PetAttr=1}, {Acc=17, Macc=17, PetAcc=17, PetMacc=17, PetAttr=2}, {Acc=18, Macc=18, PetAcc=18, PetMacc=18, PetAttr=3}, {Acc=19, Macc=19, PetAcc=19, PetMacc=19, PetAttr=4}, {Acc=20, Macc=20, PetAcc=20, PetMacc=20, PetAttr=5},
        {Acc=21, Macc=21, PetAcc=21, PetMacc=21, PetAttr=6, PetDT=-1}, {Acc=22, Macc=22, PetAcc=22, PetMacc=22, PetAttr=7, PetDT=-2}, {Acc=23, Macc=23, PetAcc=23, PetMacc=23, PetAttr=8, PetDT=-3}, {Acc=24, Macc=24, PetAcc=24, PetMacc=24, PetAttr=9, PetDT=-4}, {Acc=25, Macc=25, PetAcc=25, PetMacc=25, PetAttr=10, PetDT=-5},
        {Acc=26, Macc=26, PetAcc=26, PetMacc=26, PetAttr=11, PetDT=-6}, {Acc=27, Macc=27, PetAcc=27, PetMacc=27, PetAttr=12, PetDT=-6}, {Acc=28, Macc=28, PetAcc=28, PetMacc=28, PetAttr=13, PetDT=-7}, {Acc=29, Macc=29, PetAcc=29, PetMacc=29, PetAttr=14, PetDT=-7}, {Acc=30, Macc=30, PetAcc=30, PetMacc=30, PetAttr=15, PetDT=-8}
    }
}

local nyame_legs = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1, STP=1}, {Acc=2, Racc=2, Macc=2, STP=1}, {Acc=3, Racc=3, Macc=3, STP=2}, {Acc=4, Racc=4, Macc=4, STP=2}, {Acc=5, Racc=5, Macc=5, STP=3},
        {Acc=6, Racc=6, Macc=6, STP=3}, {Acc=7, Racc=7, Macc=7, STP=4}, {Acc=8, Racc=8, Macc=8, STP=4}, {Acc=9, Racc=9, Macc=9, STP=5}, {Acc=10, Racc=10, Macc=10, STP=5},
        {Acc=11, Racc=11, Macc=11, STP=6}, {Acc=12, Racc=12, Macc=12, STP=6}, {Acc=13, Racc=13, Macc=13, STP=7}, {Acc=14, Racc=14, Macc=14, STP=7}, {Acc=15, Racc=15, Macc=15, STP=8},
        {Acc=16, Racc=16, Macc=16, STP=8, PDL=1}, {Acc=17, Racc=17, Macc=17, STP=8, PDL=1}, {Acc=18, Racc=18, Macc=18, STP=9, PDL=2}, {Acc=19, Racc=19, Macc=19, STP=9, PDL=2}, {Acc=20, Racc=20, Macc=20, STP=9, PDL=3},
        {Acc=21, Racc=21, Macc=21, STP=10, PDL=3, Crit=2}, {Acc=22, Racc=22, Macc=22, STP=10, PDL=4, Crit=4}, {Acc=23, Racc=23, Macc=23, STP=10, PDL=4, Crit=6}, {Acc=24, Racc=24, Macc=24, STP=11, PDL=4, Crit=7}, {Acc=25, Racc=25, Macc=25, STP=11, PDL=5, Crit=8},
        {Acc=26, Racc=26, Macc=26, STP=11, PDL=5, Crit=9}, {Acc=27, Racc=27, Macc=27, STP=12, PDL=5, Crit=10}, {Acc=28, Racc=28, Macc=28, STP=12, PDL=6, Crit=11}, {Acc=29, Racc=29, Macc=29, STP=12, PDL=6, Crit=12}, {Acc=30, Racc=30, Macc=30, STP=13, PDL=6, Crit=13}
    },
    ['B'] = {
        {Atk=2, Ratk=2, WSD=1}, {Atk=4, Ratk=4, WSD=1}, {Atk=6, Ratk=6, WSD=2}, {Atk=8, Ratk=8, WSD=2}, {Atk=10, Ratk=10, WSD=3},
        {Atk=11, Ratk=11, WSD=3}, {Atk=12, Ratk=12, WSD=4}, {Atk=13, Ratk=13, WSD=4}, {Atk=14, Ratk=14, WSD=5}, {Atk=15, Ratk=15, WSD=5},
        {Atk=16, Ratk=16, WSD=6}, {Atk=17, Ratk=17, WSD=6}, {Atk=18, Ratk=18, WSD=7}, {Atk=19, Ratk=19, WSD=7}, {Atk=20, Ratk=20, WSD=7},
        {Atk=21, Ratk=21, WSD=8, DA=1}, {Atk=22, Ratk=22, WSD=8, DA=1}, {Atk=23, Ratk=23, WSD=8, DA=2}, {Atk=24, Ratk=24, WSD=9, DA=2}, {Atk=25, Ratk=25, WSD=9, DA=3},
        {Atk=26, Ratk=26, WSD=9, DA=3, STR=2}, {Atk=27, Ratk=27, WSD=10, DA=4, STR=4}, {Atk=28, Ratk=28, WSD=10, DA=4, STR=6}, {Atk=29, Ratk=29, WSD=10, DA=4, STR=8}, {Atk=30, Ratk=30, WSD=11, DA=5, STR=10},
        {Atk=31, Ratk=31, WSD=11, DA=5, STR=11}, {Atk=32, Ratk=32, WSD=11, DA=5, STR=12}, {Atk=33, Ratk=33, WSD=12, DA=6, STR=13}, {Atk=34, Ratk=34, WSD=12, DA=6, STR=14}, {Atk=35, Ratk=35, WSD=12, DA=6, STR=15}
    },
    ['C'] = {
        {MAB=2, MDMG=2}, {MAB=4, MDMG=4}, {MAB=6, MDMG=6}, {MAB=8, MDMG=8}, {MAB=10, MDMG=10},
        {MAB=11, MDMG=11}, {MAB=12, MDMG=12}, {MAB=13, MDMG=13}, {MAB=14, MDMG=14}, {MAB=15, MDMG=15},
        {MAB=16, MDMG=16}, {MAB=17, MDMG=17}, {MAB=18, MDMG=18}, {MAB=19, MDMG=19}, {MAB=20, MDMG=20},
        {MAB=21, MDMG=21, MBD2=1}, {MAB=22, MDMG=22, MBD2=1}, {MAB=23, MDMG=23, MBD2=1}, {MAB=24, MDMG=24, MBD2=2}, {MAB=25, MDMG=25, MBD2=2},
        {MAB=26, MDMG=26, MBD2=2, INT=2}, {MAB=27, MDMG=27, MBD2=3, INT=4}, {MAB=28, MDMG=28, MBD2=3, INT=6}, {MAB=29, MDMG=29, MBD2=3, INT=8}, {MAB=30, MDMG=30, MBD2=4, INT=10},
        {MAB=31, MDMG=31, MBD2=4, INT=11}, {MAB=32, MDMG=32, MBD2=4, INT=12}, {MAB=33, MDMG=33, MBD2=5, INT=13}, {MAB=34, MDMG=34, MBD2=5, INT=14}, {MAB=35, MDMG=35, MBD2=5, INT=15}
    },
    ['D'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3}, {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5},
        {Acc=6, Macc=6, PetAcc=6, PetMacc=6}, {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9}, {Acc=10, Macc=10, PetAcc=10, PetMacc=10},
        {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12}, {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, PetAcc=16, PetMacc=16, PetDMG=1}, {Acc=17, Macc=17, PetAcc=17, PetMacc=17, PetDMG=2}, {Acc=18, Macc=18, PetAcc=18, PetMacc=18, PetDMG=3}, {Acc=19, Macc=19, PetAcc=19, PetMacc=19, PetDMG=4}, {Acc=20, Macc=20, PetAcc=20, PetMacc=20, PetDMG=5},
        {Acc=21, Macc=21, PetAcc=21, PetMacc=21, PetDMG=5, PetDT=-1}, {Acc=22, Macc=22, PetAcc=22, PetMacc=22, PetDMG=6, PetDT=-2}, {Acc=23, Macc=23, PetAcc=23, PetMacc=23, PetDMG=6, PetDT=-3}, {Acc=24, Macc=24, PetAcc=24, PetMacc=24, PetDMG=7, PetDT=-4}, {Acc=25, Macc=25, PetAcc=25, PetMacc=25, PetDMG=7, PetDT=-5},
        {Acc=26, Macc=26, PetAcc=26, PetMacc=26, PetDMG=8, PetDT=-6}, {Acc=27, Macc=27, PetAcc=27, PetMacc=27, PetDMG=8, PetDT=-7}, {Acc=28, Macc=28, PetAcc=28, PetMacc=28, PetDMG=9, PetDT=-8}, {Acc=29, Macc=29, PetAcc=29, PetMacc=29, PetDMG=9, PetDT=-8}, {Acc=30, Macc=30, PetAcc=30, PetMacc=30, PetDMG=10, PetDT=-9}
    }
}

local nyame_feet = {
    ['A'] = {
        {Acc=1, Racc=1, Macc=1, STP=1}, {Acc=2, Racc=2, Macc=2, STP=1}, {Acc=3, Racc=3, Macc=3, STP=2}, {Acc=4, Racc=4, Macc=4, STP=2}, {Acc=5, Racc=5, Macc=5, STP=3},
        {Acc=6, Racc=6, Macc=6, STP=3}, {Acc=7, Racc=7, Macc=7, STP=4}, {Acc=8, Racc=8, Macc=8, STP=4}, {Acc=9, Racc=9, Macc=9, STP=5}, {Acc=10, Racc=10, Macc=10, STP=5},
        {Acc=11, Racc=11, Macc=11, STP=6}, {Acc=12, Racc=12, Macc=12, STP=6}, {Acc=13, Racc=13, Macc=13, STP=7}, {Acc=14, Racc=14, Macc=14, STP=7}, {Acc=15, Racc=15, Macc=15, STP=8},
        {Acc=16, Racc=16, Macc=16, STP=8, PDL=1}, {Acc=17, Racc=17, Macc=17, STP=8, PDL=1}, {Acc=18, Racc=18, Macc=18, STP=9, PDL=1}, {Acc=19, Racc=19, Macc=19, STP=9, PDL=2}, {Acc=20, Racc=20, Macc=20, STP=9, PDL=2},
        {Acc=21, Racc=21, Macc=21, STP=10, PDL=2, AGI=2}, {Acc=22, Racc=22, Macc=22, STP=10, PDL=3, AGI=4}, {Acc=23, Racc=23, Macc=23, STP=10, PDL=3, AGI=6}, {Acc=24, Racc=24, Macc=24, STP=11, PDL=3, AGI=8}, {Acc=25, Racc=25, Macc=25, STP=11, PDL=4, AGI=10},
        {Acc=26, Racc=26, Macc=26, STP=11, PDL=4, AGI=11}, {Acc=27, Racc=27, Macc=27, STP=12, PDL=4, AGI=12}, {Acc=28, Racc=28, Macc=28, STP=12, PDL=5, AGI=13}, {Acc=29, Racc=29, Macc=29, STP=12, PDL=5, AGI=14}, {Acc=30, Racc=30, Macc=30, STP=13, PDL=5, AGI=15}
    },
    ['B'] = {
        {Atk=2, Ratk=2, WSD=1}, {Atk=4, Ratk=4, WSD=1}, {Atk=6, Ratk=6, WSD=2}, {Atk=8, Ratk=8, WSD=2}, {Atk=10, Ratk=10, WSD=3},
        {Atk=11, Ratk=11, WSD=3}, {Atk=12, Ratk=12, WSD=4}, {Atk=13, Ratk=13, WSD=4}, {Atk=14, Ratk=14, WSD=4}, {Atk=15, Ratk=15, WSD=5},
        {Atk=16, Ratk=16, WSD=5}, {Atk=17, Ratk=17, WSD=5}, {Atk=18, Ratk=18, WSD=6}, {Atk=19, Ratk=19, WSD=6}, {Atk=20, Ratk=20, WSD=6},
        {Atk=21, Ratk=21, WSD=7, DA=1}, {Atk=22, Ratk=22, WSD=7, DA=1}, {Atk=23, Ratk=23, WSD=7, DA=1}, {Atk=24, Ratk=24, WSD=8, DA=2}, {Atk=25, Ratk=25, WSD=8, DA=2},
        {Atk=26, Ratk=26, WSD=8, DA=2, Acc=2, Racc=2}, {Atk=27, Ratk=27, WSD=9, DA=3, Acc=4, Racc=4}, {Atk=28, Ratk=28, WSD=9, DA=3, Acc=6, Racc=6}, {Atk=29, Ratk=29, WSD=9, DA=3, Acc=7, Racc=7}, {Atk=30, Ratk=30, WSD=10, DA=4, Acc=8, Racc=8},
        {Atk=31, Ratk=31, WSD=10, DA=4, Acc=9, Racc=9}, {Atk=32, Ratk=32, WSD=10, DA=4, Acc=10, Racc=10}, {Atk=33, Ratk=33, WSD=11, DA=5, Acc=11, Racc=11}, {Atk=34, Ratk=34, WSD=11, DA=5, Acc=12, Racc=12}, {Atk=35, Ratk=35, WSD=11, DA=5, Acc=13, Racc=13}
    },
    ['C'] = {
        {MAB=2, MDMG=1}, {MAB=4, MDMG=2}, {MAB=6, MDMG=3}, {MAB=8, MDMG=4}, {MAB=10, MDMG=5},
        {MAB=11, MDMG=6}, {MAB=12, MDMG=7}, {MAB=13, MDMG=8}, {MAB=14, MDMG=9}, {MAB=15, MDMG=10},
        {MAB=16, MDMG=11}, {MAB=17, MDMG=12}, {MAB=18, MDMG=13}, {MAB=19, MDMG=14}, {MAB=20, MDMG=15},
        {MAB=21, MDMG=16, MBD2=1}, {MAB=22, MDMG=17, MBD2=1}, {MAB=23, MDMG=18, MBD2=1}, {MAB=24, MDMG=19, MBD2=2}, {MAB=25, MDMG=20, MBD2=2},
        {MAB=26, MDMG=21, MBD2=2, CHR=2}, {MAB=27, MDMG=22, MBD2=3, CHR=4}, {MAB=28, MDMG=23, MBD2=3, CHR=6}, {MAB=29, MDMG=24, MBD2=3, CHR=8}, {MAB=30, MDMG=25, MBD2=4, CHR=10},
        {MAB=31, MDMG=26, MBD2=4, CHR=11}, {MAB=32, MDMG=27, MBD2=4, CHR=12}, {MAB=33, MDMG=28, MBD2=5, CHR=13}, {MAB=34, MDMG=29, MBD2=5, CHR=14}, {MAB=35, MDMG=30, MBD2=5, CHR=15}
    },
    ['D'] = {
        {Acc=1, Macc=1, PetAcc=1, PetMacc=1}, {Acc=2, Macc=2, PetAcc=2, PetMacc=2}, {Acc=3, Macc=3, PetAcc=3, PetMacc=3}, {Acc=4, Macc=4, PetAcc=4, PetMacc=4}, {Acc=5, Macc=5, PetAcc=5, PetMacc=5},
        {Acc=6, Macc=6, PetAcc=6, PetMacc=6}, {Acc=7, Macc=7, PetAcc=7, PetMacc=7}, {Acc=8, Macc=8, PetAcc=8, PetMacc=8}, {Acc=9, Macc=9, PetAcc=9, PetMacc=9}, {Acc=10, Macc=10, PetAcc=10, PetMacc=10},
        {Acc=11, Macc=11, PetAcc=11, PetMacc=11}, {Acc=12, Macc=12, PetAcc=12, PetMacc=12}, {Acc=13, Macc=13, PetAcc=13, PetMacc=13}, {Acc=14, Macc=14, PetAcc=14, PetMacc=14}, {Acc=15, Macc=15, PetAcc=15, PetMacc=15},
        {Acc=16, Macc=16, PetAcc=16, PetMacc=16, PetAttr=1}, {Acc=17, Macc=17, PetAcc=17, PetMacc=17, PetAttr=2}, {Acc=18, Macc=18, PetAcc=18, PetMacc=18, PetAttr=3}, {Acc=19, Macc=19, PetAcc=19, PetMacc=19, PetAttr=4}, {Acc=20, Macc=20, PetAcc=20, PetMacc=20, PetAttr=5},
        {Acc=21, Macc=21, PetAcc=21, PetMacc=21, PetAttr=6, PetDT=-1}, {Acc=22, Macc=22, PetAcc=22, PetMacc=22, PetAttr=7, PetDT=-2}, {Acc=23, Macc=23, PetAcc=23, PetMacc=23, PetAttr=8, PetDT=-3}, {Acc=24, Macc=24, PetAcc=24, PetMacc=24, PetAttr=9, PetDT=-4}, {Acc=25, Macc=25, PetAcc=25, PetMacc=25, PetAttr=10, PetDT=-5},
        {Acc=26, Macc=26, PetAcc=26, PetMacc=26, PetAttr=11, PetDT=-6}, {Acc=27, Macc=27, PetAcc=27, PetMacc=27, PetAttr=12, PetDT=-6}, {Acc=28, Macc=28, PetAcc=28, PetMacc=28, PetAttr=13, PetDT=-7}, {Acc=29, Macc=29, PetAcc=29, PetMacc=29, PetAttr=14, PetDT=-7}, {Acc=30, Macc=30, PetAcc=30, PetMacc=30, PetAttr=15, PetDT=-8}
    }
}

-- ==============================================================================
-- IKENGA GEAR (IDs: 23755, 23762, 23769, 23776, 23783) (PATH A ONLY)
-- ==============================================================================
local ikenga_hat = {
    ['A'] = {
        {Ratk=1, MAB=2}, {Ratk=2, MAB=4}, {Ratk=3, MAB=6}, {Ratk=4, MAB=8}, {Ratk=5, MAB=10}, {Ratk=6, MAB=12}, {Ratk=7, MAB=14}, {Ratk=8, MAB=16}, {Ratk=9, MAB=18}, {Ratk=10, MAB=20},
        {Ratk=11, MAB=22}, {Ratk=12, MAB=24}, {Ratk=13, MAB=26}, {Ratk=14, MAB=28}, {Ratk=15, MAB=30}, {Ratk=16, MAB=31, Racc=1, Macc=1}, {Ratk=17, MAB=32, Racc=2, Macc=2}, {Ratk=18, MAB=33, Racc=3, Macc=3}, {Ratk=19, MAB=34, Racc=4, Macc=4}, {Ratk=20, MAB=35, Racc=5, Macc=5},
        {Ratk=21, MAB=36, Racc=6, Macc=6, SB2=1}, {Ratk=22, MAB=37, Racc=7, Macc=7, SB2=1}, {Ratk=23, MAB=38, Racc=8, Macc=8, SB2=2}, {Ratk=24, MAB=39, Racc=9, Macc=9, SB2=2}, {Ratk=25, MAB=40, Racc=10, Macc=10, SB2=3},
        {Ratk=26, MAB=41, Racc=11, Macc=11, SB2=3}, {Ratk=27, MAB=42, Racc=12, Macc=12, SB2=4}, {Ratk=28, MAB=43, Racc=13, Macc=13, SB2=4}, {Ratk=29, MAB=44, Racc=14, Macc=14, SB2=5}, {Ratk=30, MAB=45, Racc=15, Macc=15, SB2=5}
    }
}
local ikenga_body = {
    ['A'] = {
        {Ratk=1, TPBonus=10}, {Ratk=2, TPBonus=20}, {Ratk=3, TPBonus=30}, {Ratk=4, TPBonus=40}, {Ratk=5, TPBonus=50}, {Ratk=6, TPBonus=60}, {Ratk=7, TPBonus=70}, {Ratk=8, TPBonus=80}, {Ratk=9, TPBonus=90}, {Ratk=10, TPBonus=100},
        {Ratk=11, TPBonus=110}, {Ratk=12, TPBonus=120}, {Ratk=13, TPBonus=130}, {Ratk=14, TPBonus=140}, {Ratk=15, TPBonus=150}, {Ratk=16, TPBonus=150, Racc=1, Macc=1}, {Ratk=17, TPBonus=160, Racc=2, Macc=2}, {Ratk=18, TPBonus=160, Racc=3, Macc=3}, {Ratk=19, TPBonus=170, Racc=4, Macc=4}, {Ratk=20, TPBonus=170, Racc=5, Macc=5},
        {Ratk=21, TPBonus=170, Racc=6, Macc=6, Crit=1}, {Ratk=22, TPBonus=180, Racc=7, Macc=7, Crit=1}, {Ratk=23, TPBonus=180, Racc=8, Macc=8, Crit=2}, {Ratk=24, TPBonus=180, Racc=9, Macc=9, Crit=2}, {Ratk=25, TPBonus=190, Racc=10, Macc=10, Crit=3},
        {Ratk=26, TPBonus=190, Racc=11, Macc=11, Crit=3}, {Ratk=27, TPBonus=190, Racc=12, Macc=12, Crit=4}, {Ratk=28, TPBonus=190, Racc=13, Macc=13, Crit=4}, {Ratk=29, TPBonus=190, Racc=14, Macc=14, Crit=5}, {Ratk=30, TPBonus=200, Racc=15, Macc=15, Crit=5}
    }
}
local ikenga_hands = {
    ['A'] = {
        {Ratk=1, SB=1}, {Ratk=2, SB=1}, {Ratk=3, SB=2}, {Ratk=4, SB=2}, {Ratk=5, SB=3}, {Ratk=6, SB=3}, {Ratk=7, SB=4}, {Ratk=8, SB=4}, {Ratk=9, SB=5}, {Ratk=10, SB=5},
        {Ratk=11, SB=6}, {Ratk=12, SB=6}, {Ratk=13, SB=7}, {Ratk=14, SB=7}, {Ratk=15, SB=8}, {Ratk=16, SB=8, Racc=1, Macc=1}, {Ratk=17, SB=9, Racc=2, Macc=2}, {Ratk=18, SB=9, Racc=3, Macc=3}, {Ratk=19, SB=10, Racc=4, Macc=4}, {Ratk=20, SB=10, Racc=5, Macc=5},
        {Ratk=21, SB=11, Racc=6, Macc=6, Recycle=1}, {Ratk=22, SB=11, Racc=7, Macc=7, Recycle=2}, {Ratk=23, SB=12, Racc=8, Macc=8, Recycle=3}, {Ratk=24, SB=12, Racc=9, Macc=9, Recycle=4}, {Ratk=25, SB=13, Racc=10, Macc=10, Recycle=5},
        {Ratk=26, SB=13, Racc=11, Macc=11, Recycle=6}, {Ratk=27, SB=14, Racc=12, Macc=12, Recycle=7}, {Ratk=28, SB=14, Racc=13, Macc=13, Recycle=8}, {Ratk=29, SB=14, Racc=14, Macc=14, Recycle=9}, {Ratk=30, SB=15, Racc=15, Macc=15, Recycle=10}
    }
}
local ikenga_legs = {
    ['A'] = {
        {Ratk=1, DT=-1}, {Ratk=2, DT=-1}, {Ratk=3, DT=-1}, {Ratk=4, DT=-2}, {Ratk=5, DT=-2}, {Ratk=6, DT=-2}, {Ratk=7, DT=-3}, {Ratk=8, DT=-3}, {Ratk=9, DT=-3}, {Ratk=10, DT=-4},
        {Ratk=11, DT=-4}, {Ratk=12, DT=-4}, {Ratk=13, DT=-5}, {Ratk=14, DT=-5}, {Ratk=15, DT=-5}, {Ratk=16, DT=-6, Racc=1, Macc=1}, {Ratk=17, DT=-6, Racc=2, Macc=2}, {Ratk=18, DT=-6, Racc=3, Macc=3}, {Ratk=19, DT=-7, Racc=4, Macc=4}, {Ratk=20, DT=-7, Racc=5, Macc=5},
        {Ratk=21, DT=-7, Racc=6, Macc=6, STR=1}, {Ratk=22, DT=-8, Racc=7, Macc=7, STR=1}, {Ratk=23, DT=-8, Racc=8, Macc=8, STR=2}, {Ratk=24, DT=-8, Racc=9, Macc=9, STR=2}, {Ratk=25, DT=-9, Racc=10, Macc=10, STR=3},
        {Ratk=26, DT=-9, Racc=11, Macc=11, STR=3}, {Ratk=27, DT=-9, Racc=12, Macc=12, STR=4}, {Ratk=28, DT=-10, Racc=13, Macc=13, STR=4}, {Ratk=29, DT=-10, Racc=14, Macc=14, STR=5}, {Ratk=30, DT=-10, Racc=15, Macc=15, STR=5}
    }
}
local ikenga_feet = {
    ['A'] = {
        {Ratk=1, TrueShot=1}, {Ratk=2, TrueShot=1}, {Ratk=3, TrueShot=1}, {Ratk=4, TrueShot=2}, {Ratk=5, TrueShot=2}, {Ratk=6, TrueShot=2}, {Ratk=7, TrueShot=3}, {Ratk=8, TrueShot=3}, {Ratk=9, TrueShot=3}, {Ratk=10, TrueShot=4},
        {Ratk=11, TrueShot=4}, {Ratk=12, TrueShot=4}, {Ratk=13, TrueShot=5}, {Ratk=14, TrueShot=5}, {Ratk=15, TrueShot=5}, {Ratk=16, TrueShot=6, Racc=1, Macc=1}, {Ratk=17, TrueShot=6, Racc=2, Macc=2}, {Ratk=18, TrueShot=6, Racc=3, Macc=3}, {Ratk=19, TrueShot=7, Racc=4, Macc=4}, {Ratk=20, TrueShot=7, Racc=5, Macc=5},
        {Ratk=21, TrueShot=7, Racc=6, Macc=6, AGI=1}, {Ratk=22, TrueShot=8, Racc=7, Macc=7, AGI=1}, {Ratk=23, TrueShot=8, Racc=8, Macc=8, AGI=2}, {Ratk=24, TrueShot=8, Racc=9, Macc=9, AGI=2}, {Ratk=25, TrueShot=9, Racc=10, Macc=10, AGI=3},
        {Ratk=26, TrueShot=9, Racc=11, Macc=11, AGI=3}, {Ratk=27, TrueShot=9, Racc=12, Macc=12, AGI=4}, {Ratk=28, TrueShot=10, Racc=13, Macc=13, AGI=4}, {Ratk=29, TrueShot=10, Racc=14, Macc=14, AGI=5}, {Ratk=30, TrueShot=10, Racc=15, Macc=15, AGI=5}
    }
}

-- ==============================================================================
-- GLETI GEAR (IDs: 23756, 23763, 23770, 23777, 23784) (PATH A ONLY)
-- ==============================================================================
local gleti_mask = {
    ['A'] = {
        {Atk=1, Counter=1}, {Atk=2, Counter=1}, {Atk=3, Counter=1}, {Atk=4, Counter=2}, {Atk=5, Counter=2}, {Atk=6, Counter=2}, {Atk=7, Counter=3}, {Atk=8, Counter=3}, {Atk=9, Counter=3}, {Atk=10, Counter=4},
        {Atk=11, Counter=4}, {Atk=12, Counter=4}, {Atk=13, Counter=5}, {Atk=14, Counter=5}, {Atk=15, Counter=5}, {Atk=16, Counter=6, Acc=1, Macc=1}, {Atk=17, Counter=6, Acc=2, Macc=2}, {Atk=18, Counter=6, Acc=3, Macc=3}, {Atk=19, Counter=7, Acc=4, Macc=4}, {Atk=20, Counter=7, Acc=5, Macc=5},
        {Atk=21, Counter=7, Acc=6, Macc=6, Regen=1}, {Atk=22, Counter=8, Acc=7, Macc=7, Regen=1}, {Atk=23, Counter=8, Acc=8, Macc=8, Regen=1}, {Atk=24, Counter=8, Acc=9, Macc=9, Regen=1}, {Atk=25, Counter=9, Acc=10, Macc=10, Regen=2},
        {Atk=26, Counter=9, Acc=11, Macc=11, Regen=2}, {Atk=27, Counter=9, Acc=12, Macc=12, Regen=2}, {Atk=28, Counter=10, Acc=13, Macc=13, Regen=2}, {Atk=29, Counter=10, Acc=14, Macc=14, Regen=2}, {Atk=30, Counter=10, Acc=15, Macc=15, Regen=3}
    }
}
local gleti_body = {
    ['A'] = {
        {Atk=1, DA=1}, {Atk=2, DA=1}, {Atk=3, DA=1}, {Atk=4, DA=2}, {Atk=5, DA=2}, {Atk=6, DA=2}, {Atk=7, DA=3}, {Atk=8, DA=3}, {Atk=9, DA=3}, {Atk=10, DA=4},
        {Atk=11, DA=4}, {Atk=12, DA=4}, {Atk=13, DA=5}, {Atk=14, DA=5}, {Atk=15, DA=5}, {Atk=16, DA=6, Acc=1, Macc=1}, {Atk=17, DA=6, Acc=2, Macc=2}, {Atk=18, DA=6, Acc=3, Macc=3}, {Atk=19, DA=7, Acc=4, Macc=4}, {Atk=20, DA=7, Acc=5, Macc=5},
        {Atk=21, DA=7, Acc=6, Macc=6, OccRes=1}, {Atk=22, DA=8, Acc=7, Macc=7, OccRes=2}, {Atk=23, DA=8, Acc=8, Macc=8, OccRes=3}, {Atk=24, DA=8, Acc=9, Macc=9, OccRes=4}, {Atk=25, DA=9, Acc=10, Macc=10, OccRes=5},
        {Atk=26, DA=9, Acc=11, Macc=11, OccRes=6}, {Atk=27, DA=9, Acc=12, Macc=12, OccRes=7}, {Atk=28, DA=10, Acc=13, Macc=13, OccRes=8}, {Atk=29, DA=10, Acc=14, Macc=14, OccRes=9}, {Atk=30, DA=10, Acc=15, Macc=15, OccRes=10}
    }
}
local gleti_hands = {
    ['A'] = {
        {Atk=1, STP=1}, {Atk=2, STP=1}, {Atk=3, STP=1}, {Atk=4, STP=1}, {Atk=5, STP=2}, {Atk=6, STP=2}, {Atk=7, STP=2}, {Atk=8, STP=2}, {Atk=9, STP=3}, {Atk=10, STP=3},
        {Atk=11, STP=3}, {Atk=12, STP=3}, {Atk=13, STP=4}, {Atk=14, STP=4}, {Atk=15, STP=4}, {Atk=16, STP=4, Acc=1, Macc=1}, {Atk=17, STP=5, Acc=2, Macc=2}, {Atk=18, STP=5, Acc=3, Macc=3}, {Atk=19, STP=5, Acc=4, Macc=4}, {Atk=20, STP=5, Acc=5, Macc=5},
        {Atk=21, STP=6, Acc=6, Macc=6, DEX=1}, {Atk=22, STP=6, Acc=7, Macc=7, DEX=1}, {Atk=23, STP=6, Acc=8, Macc=8, DEX=2}, {Atk=24, STP=6, Acc=9, Macc=9, DEX=2}, {Atk=25, STP=7, Acc=10, Macc=10, DEX=3},
        {Atk=26, STP=7, Acc=11, Macc=11, DEX=3}, {Atk=27, STP=7, Acc=12, Macc=12, DEX=4}, {Atk=28, STP=7, Acc=13, Macc=13, DEX=4}, {Atk=29, STP=8, Acc=14, Macc=14, DEX=5}, {Atk=30, STP=8, Acc=15, Macc=15, DEX=5}
    }
}
local gleti_legs = {
    ['A'] = {
        {Atk=1, SB=1}, {Atk=2, SB=1}, {Atk=3, SB=2}, {Atk=4, SB=2}, {Atk=5, SB=3}, {Atk=6, SB=3}, {Atk=7, SB=4}, {Atk=8, SB=4}, {Atk=9, SB=5}, {Atk=10, SB=5},
        {Atk=11, SB=6}, {Atk=12, SB=6}, {Atk=13, SB=7}, {Atk=14, SB=7}, {Atk=15, SB=8}, {Atk=16, SB=8, Acc=1, Macc=1}, {Atk=17, SB=9, Acc=2, Macc=2}, {Atk=18, SB=9, Acc=3, Macc=3}, {Atk=19, SB=10, Acc=4, Macc=4}, {Atk=20, SB=10, Acc=5, Macc=5},
        {Atk=21, SB=11, Acc=6, Macc=6, TA=1}, {Atk=22, SB=11, Acc=7, Macc=7, TA=1}, {Atk=23, SB=12, Acc=8, Macc=8, TA=2}, {Atk=24, SB=12, Acc=9, Macc=9, TA=2}, {Atk=25, SB=13, Acc=10, Macc=10, TA=3},
        {Atk=26, SB=13, Acc=11, Macc=11, TA=3}, {Atk=27, SB=14, Acc=12, Macc=12, TA=4}, {Atk=28, SB=14, Acc=13, Macc=13, TA=4}, {Atk=29, SB=14, Acc=14, Macc=14, TA=5}, {Atk=30, SB=15, Acc=15, Macc=15, TA=5}
    }
}
local gleti_feet = {
    ['A'] = {
        {Atk=1, Eva=1}, {Atk=2, Eva=1}, {Atk=3, Eva=2}, {Atk=4, Eva=2}, {Atk=5, Eva=3}, {Atk=6, Eva=3}, {Atk=7, Eva=4}, {Atk=8, Eva=4}, {Atk=9, Eva=5}, {Atk=10, Eva=5},
        {Atk=11, Eva=6}, {Atk=12, Eva=6}, {Atk=13, Eva=7}, {Atk=14, Eva=7}, {Atk=15, Eva=8}, {Atk=16, Eva=8, Acc=1, Macc=1}, {Atk=17, Eva=9, Acc=2, Macc=2}, {Atk=18, Eva=9, Acc=3, Macc=3}, {Atk=19, Eva=10, Acc=4, Macc=4}, {Atk=20, Eva=10, Acc=5, Macc=5},
        {Atk=21, Eva=11, Acc=6, Macc=6, STR=1}, {Atk=22, Eva=11, Acc=7, Macc=7, STR=1}, {Atk=23, Eva=12, Acc=8, Macc=8, STR=2}, {Atk=24, Eva=12, Acc=9, Macc=9, STR=2}, {Atk=25, Eva=13, Acc=10, Macc=10, STR=3},
        {Atk=26, Eva=13, Acc=11, Macc=11, STR=3}, {Atk=27, Eva=14, Acc=12, Macc=12, STR=4}, {Atk=28, Eva=14, Acc=13, Macc=13, STR=4}, {Atk=29, Eva=14, Acc=14, Macc=14, STR=5}, {Atk=30, Eva=15, Acc=15, Macc=15, STR=5}
    }
}

-- ==============================================================================
-- SAKPATA GEAR (IDs: 23757, 23764, 23771, 23778, 23785) (PATH A ONLY)
-- ==============================================================================
local sakpata_helm = {
    ['A'] = {
        {Atk=1, DAdmg=1}, {Atk=2, DAdmg=1}, {Atk=3, DAdmg=2}, {Atk=4, DAdmg=2}, {Atk=5, DAdmg=3},
        {Atk=6, DAdmg=3}, {Atk=7, DAdmg=4}, {Atk=8, DAdmg=4}, {Atk=9, DAdmg=5}, {Atk=10, DAdmg=5},
        {Atk=11, DAdmg=6}, {Atk=12, DAdmg=6}, {Atk=13, DAdmg=7}, {Atk=14, DAdmg=7}, {Atk=15, DAdmg=8},
        {Atk=16, DAdmg=8, Acc=1, Macc=1}, {Atk=17, DAdmg=9, Acc=2, Macc=2}, {Atk=18, DAdmg=9, Acc=3, Macc=3}, {Atk=19, DAdmg=10, Acc=4, Macc=4}, {Atk=20, DAdmg=10, Acc=5, Macc=5},
        {Atk=21, DAdmg=11, Acc=6, Macc=6, CurePot=1}, {Atk=22, DAdmg=11, Acc=7, Macc=7, CurePot=1}, {Atk=23, DAdmg=12, Acc=8, Macc=8, CurePot=2}, {Atk=24, DAdmg=12, Acc=9, Macc=9, CurePot=2}, {Atk=25, DAdmg=13, Acc=10, Macc=10, CurePot=3},
        {Atk=26, DAdmg=13, Acc=11, Macc=11, CurePot=3}, {Atk=27, DAdmg=14, Acc=12, Macc=12, CurePot=4}, {Atk=28, DAdmg=14, Acc=13, Macc=13, CurePot=4}, {Atk=29, DAdmg=14, Acc=14, Macc=14, CurePot=5}, {Atk=30, DAdmg=15, Acc=15, Macc=15, CurePot=5}
    }
}
local sakpata_body = {
    ['A'] = {
        {Atk=1, OccRes=1}, {Atk=2, OccRes=1}, {Atk=3, OccRes=2}, {Atk=4, OccRes=2}, {Atk=5, OccRes=3},
        {Atk=6, OccRes=3}, {Atk=7, OccRes=4}, {Atk=8, OccRes=4}, {Atk=9, OccRes=5}, {Atk=10, OccRes=5},
        {Atk=11, OccRes=6}, {Atk=12, OccRes=6}, {Atk=13, OccRes=7}, {Atk=14, OccRes=7}, {Atk=15, OccRes=8},
        {Atk=16, OccRes=8, Acc=1, Macc=1}, {Atk=17, OccRes=9, Acc=2, Macc=2}, {Atk=18, OccRes=9, Acc=3, Macc=3}, {Atk=19, OccRes=10, Acc=4, Macc=4}, {Atk=20, OccRes=10, Acc=5, Macc=5},
        {Atk=21, OccRes=11, Acc=6, Macc=6, Crit=1}, {Atk=22, OccRes=11, Acc=7, Macc=7, Crit=1}, {Atk=23, OccRes=12, Acc=8, Macc=8, Crit=2}, {Atk=24, OccRes=12, Acc=9, Macc=9, Crit=2}, {Atk=25, OccRes=13, Acc=10, Macc=10, Crit=3},
        {Atk=26, OccRes=13, Acc=11, Macc=11, Crit=3}, {Atk=27, OccRes=14, Acc=12, Macc=12, Crit=4}, {Atk=28, OccRes=14, Acc=13, Macc=13, Crit=4}, {Atk=29, OccRes=14, Acc=14, Macc=14, Crit=5}, {Atk=30, OccRes=15, Acc=15, Macc=15, Crit=5}
    }
}
local sakpata_hands = {
    ['A'] = {
        {Atk=1, STP=1}, {Atk=2, STP=1}, {Atk=3, STP=1}, {Atk=4, STP=1}, {Atk=5, STP=2},
        {Atk=6, STP=2}, {Atk=7, STP=2}, {Atk=8, STP=2}, {Atk=9, STP=3}, {Atk=10, STP=3},
        {Atk=11, STP=3}, {Atk=12, STP=3}, {Atk=13, STP=4}, {Atk=14, STP=4}, {Atk=15, STP=4},
        {Atk=16, STP=4, Acc=1, Macc=1}, {Atk=17, STP=5, Acc=2, Macc=2}, {Atk=18, STP=5, Acc=3, Macc=3}, {Atk=19, STP=5, Acc=4, Macc=4}, {Atk=20, STP=5, Acc=5, Macc=5},
        {Atk=21, STP=6, Acc=6, Macc=6, VIT=1}, {Atk=22, STP=6, Acc=7, Macc=7, VIT=1}, {Atk=23, STP=6, Acc=8, Macc=8, VIT=2}, {Atk=24, STP=6, Acc=9, Macc=9, VIT=2}, {Atk=25, STP=7, Acc=10, Macc=10, VIT=3},
        {Atk=26, STP=7, Acc=11, Macc=11, VIT=3}, {Atk=27, STP=7, Acc=12, Macc=12, VIT=4}, {Atk=28, STP=7, Acc=13, Macc=13, VIT=4}, {Atk=29, STP=8, Acc=14, Macc=14, VIT=5}, {Atk=30, STP=8, Acc=15, Macc=15, VIT=5}
    }
}
local sakpata_legs = {
    ['A'] = {
        {Atk=1, SCDmg=1}, {Atk=2, SCDmg=1}, {Atk=3, SCDmg=2}, {Atk=4, SCDmg=2}, {Atk=5, SCDmg=3},
        {Atk=6, SCDmg=3}, {Atk=7, SCDmg=4}, {Atk=8, SCDmg=4}, {Atk=9, SCDmg=5}, {Atk=10, SCDmg=5},
        {Atk=11, SCDmg=6}, {Atk=12, SCDmg=6}, {Atk=13, SCDmg=7}, {Atk=14, SCDmg=7}, {Atk=15, SCDmg=8},
        {Atk=16, SCDmg=8, Acc=1, Macc=1}, {Atk=17, SCDmg=9, Acc=2, Macc=2}, {Atk=18, SCDmg=9, Acc=3, Macc=3}, {Atk=19, SCDmg=10, Acc=4, Macc=4}, {Atk=20, SCDmg=10, Acc=5, Macc=5},
        {Atk=21, SCDmg=11, Acc=6, Macc=6, STR=1}, {Atk=22, SCDmg=11, Acc=7, Macc=7, STR=1}, {Atk=23, SCDmg=12, Acc=8, Macc=8, STR=2}, {Atk=24, SCDmg=12, Acc=9, Macc=9, STR=2}, {Atk=25, SCDmg=13, Acc=10, Macc=10, STR=3},
        {Atk=26, SCDmg=13, Acc=11, Macc=11, STR=3}, {Atk=27, SCDmg=14, Acc=12, Macc=12, STR=4}, {Atk=28, SCDmg=14, Acc=13, Macc=13, STR=4}, {Atk=29, SCDmg=14, Acc=14, Macc=14, STR=5}, {Atk=30, SCDmg=15, Acc=15, Macc=15, STR=5}
    }
}
local sakpata_feet = {
    ['A'] = {
        {Atk=1, SB=1}, {Atk=2, SB=1}, {Atk=3, SB=2}, {Atk=4, SB=2}, {Atk=5, SB=3},
        {Atk=6, SB=3}, {Atk=7, SB=4}, {Atk=8, SB=4}, {Atk=9, SB=5}, {Atk=10, SB=5},
        {Atk=11, SB=6}, {Atk=12, SB=6}, {Atk=13, SB=7}, {Atk=14, SB=7}, {Atk=15, SB=8},
        {Atk=16, SB=8, Acc=1, Macc=1}, {Atk=17, SB=9, Acc=2, Macc=2}, {Atk=18, SB=9, Acc=3, Macc=3}, {Atk=19, SB=10, Acc=4, Macc=4}, {Atk=20, SB=10, Acc=5, Macc=5},
        {Atk=21, SB=11, Acc=6, Macc=6, Block=1}, {Atk=22, SB=11, Acc=7, Macc=7, Block=1}, {Atk=23, SB=12, Acc=8, Macc=8, Block=2}, {Atk=24, SB=12, Acc=9, Macc=9, Block=2}, {Atk=25, SB=13, Acc=10, Macc=10, Block=3},
        {Atk=26, SB=13, Acc=11, Macc=11, Block=3}, {Atk=27, SB=14, Acc=12, Macc=12, Block=4}, {Atk=28, SB=14, Acc=13, Macc=13, Block=4}, {Atk=29, SB=14, Acc=14, Macc=14, Block=5}, {Atk=30, SB=15, Acc=15, Macc=15, Block=5}
    }
}

-- ==============================================================================
-- AGWU GEAR (IDs: 23759, 23766, 23773, 23780, 23787) (PATH A ONLY)
-- ==============================================================================
local agwu_head = {
    ['A'] = {
        {MAB=1, MDMG=1}, {MAB=2, MDMG=1}, {MAB=3, MDMG=2}, {MAB=4, MDMG=2}, {MAB=5, MDMG=3},
        {MAB=6, MDMG=3}, {MAB=7, MDMG=4}, {MAB=8, MDMG=4}, {MAB=9, MDMG=5}, {MAB=10, MDMG=5},
        {MAB=11, MDMG=6}, {MAB=12, MDMG=6}, {MAB=13, MDMG=7}, {MAB=14, MDMG=7}, {MAB=15, MDMG=8},
        {MAB=16, MDMG=8, Acc=1, Macc=1}, {MAB=17, MDMG=9, Acc=2, Macc=2}, {MAB=18, MDMG=9, Acc=3, Macc=3}, {MAB=19, MDMG=10, Acc=4, Macc=4}, {MAB=20, MDMG=10, Acc=5, Macc=5},
        {MAB=21, MDMG=11, Acc=6, Macc=6, Enmity=-1}, {MAB=21, MDMG=11, Acc=7, Macc=7, Enmity=-1}, {MAB=22, MDMG=12, Acc=8, Macc=8, Enmity=-2}, {MAB=22, MDMG=12, Acc=9, Macc=9, Enmity=-2}, {MAB=23, MDMG=13, Acc=10, Macc=10, Enmity=-3},
        {MAB=23, MDMG=13, Acc=11, Macc=11, Enmity=-3}, {MAB=24, MDMG=14, Acc=12, Macc=12, Enmity=-4}, {MAB=24, MDMG=14, Acc=13, Macc=13, Enmity=-4}, {MAB=25, MDMG=14, Acc=14, Macc=14, Enmity=-5}, {MAB=25, MDMG=15, Acc=15, Macc=15, Enmity=-5}
    }
}
local agwu_body = {
    ['A'] = {
        {MAB=1, Enmity=-1}, {MAB=2, Enmity=-1}, {MAB=3, Enmity=-1}, {MAB=4, Enmity=-1}, {MAB=5, Enmity=-2},
        {MAB=6, Enmity=-2}, {MAB=7, Enmity=-2}, {MAB=8, Enmity=-2}, {MAB=9, Enmity=-3}, {MAB=10, Enmity=-3},
        {MAB=11, Enmity=-3}, {MAB=12, Enmity=-3}, {MAB=13, Enmity=-4}, {MAB=14, Enmity=-4}, {MAB=15, Enmity=-4},
        {MAB=16, Enmity=-4, Acc=1, Macc=1}, {MAB=17, Enmity=-5, Acc=2, Macc=2}, {MAB=18, Enmity=-5, Acc=3, Macc=3}, {MAB=19, Enmity=-5, Acc=4, Macc=4}, {MAB=20, Enmity=-5, Acc=5, Macc=5},
        {MAB=21, Enmity=-6, Acc=6, Macc=6, MDMG=1}, {MAB=21, Enmity=-6, Acc=7, Macc=7, MDMG=2}, {MAB=22, Enmity=-6, Acc=8, Macc=8, MDMG=3}, {MAB=22, Enmity=-6, Acc=9, Macc=9, MDMG=4}, {MAB=23, Enmity=-7, Acc=10, Macc=10, MDMG=5},
        {MAB=23, Enmity=-7, Acc=11, Macc=11, MDMG=6}, {MAB=24, Enmity=-7, Acc=12, Macc=12, MDMG=7}, {MAB=24, Enmity=-7, Acc=13, Macc=13, MDMG=8}, {MAB=25, Enmity=-8, Acc=14, Macc=14, MDMG=9}, {MAB=25, Enmity=-8, Acc=15, Macc=15, MDMG=10}
    }
}
local agwu_hands = {
    ['A'] = {
        {MAB=1, MBD2=1}, {MAB=2, MBD2=1}, {MAB=3, MBD2=1}, {MAB=4, MBD2=1}, {MAB=5, MBD2=1},
        {MAB=6, MBD2=2}, {MAB=7, MBD2=2}, {MAB=8, MBD2=2}, {MAB=9, MBD2=2}, {MAB=10, MBD2=2},
        {MAB=11, MBD2=3}, {MAB=12, MBD2=3}, {MAB=13, MBD2=3}, {MAB=14, MBD2=3}, {MAB=15, MBD2=3},
        {MAB=16, MBD2=4, Acc=1, Macc=1}, {MAB=17, MBD2=4, Acc=2, Macc=2}, {MAB=18, MBD2=4, Acc=3, Macc=3}, {MAB=19, MBD2=4, Acc=4, Macc=4}, {MAB=20, MBD2=4, Acc=5, Macc=5},
        {MAB=21, MBD2=5, Acc=6, Macc=6, MND=1}, {MAB=21, MBD2=5, Acc=7, Macc=7, MND=1}, {MAB=22, MBD2=5, Acc=8, Macc=8, MND=2}, {MAB=22, MBD2=5, Acc=9, Macc=9, MND=2}, {MAB=23, MBD2=5, Acc=10, Macc=10, MND=3},
        {MAB=23, MBD2=6, Acc=11, Macc=11, MND=3}, {MAB=24, MBD2=6, Acc=12, Macc=12, MND=4}, {MAB=24, MBD2=6, Acc=13, Macc=13, MND=4}, {MAB=25, MBD2=6, Acc=14, Macc=14, MND=5}, {MAB=25, MBD2=6, Acc=15, Macc=15, MND=5}
    }
}
local agwu_legs = {
    ['A'] = {
        {MAB=1, DT=-1}, {MAB=2, DT=-1}, {MAB=3, DT=-1}, {MAB=4, DT=-2}, {MAB=5, DT=-2},
        {MAB=6, DT=-2}, {MAB=7, DT=-3}, {MAB=8, DT=-3}, {MAB=9, DT=-3}, {MAB=10, DT=-4},
        {MAB=11, DT=-4}, {MAB=12, DT=-4}, {MAB=13, DT=-5}, {MAB=14, DT=-5}, {MAB=15, DT=-5},
        {MAB=16, DT=-6, Acc=1, Macc=1}, {MAB=17, DT=-6, Acc=2, Macc=2}, {MAB=18, DT=-6, Acc=3, Macc=3}, {MAB=19, DT=-7, Acc=4, Macc=4}, {MAB=20, DT=-7, Acc=5, Macc=5},
        {MAB=21, DT=-7, Acc=6, Macc=6, INT=1}, {MAB=21, DT=-8, Acc=7, Macc=7, INT=1}, {MAB=22, DT=-8, Acc=8, Macc=8, INT=2}, {MAB=22, DT=-8, Acc=9, Macc=9, INT=2}, {MAB=23, DT=-9, Acc=10, Macc=10, INT=3},
        {MAB=23, DT=-9, Acc=11, Macc=11, INT=3}, {MAB=24, DT=-9, Acc=12, Macc=12, INT=4}, {MAB=24, DT=-10, Acc=13, Macc=13, INT=4}, {MAB=25, DT=-10, Acc=14, Macc=14, INT=5}, {MAB=25, DT=-10, Acc=15, Macc=15, INT=5}
    }
}
local agwu_feet = {
    ['A'] = {
        {MAB=1, DrainPot=1}, {MAB=2, DrainPot=1}, {MAB=3, DrainPot=2}, {MAB=4, DrainPot=2}, {MAB=5, DrainPot=3},
        {MAB=6, DrainPot=3}, {MAB=7, DrainPot=4}, {MAB=8, DrainPot=4}, {MAB=9, DrainPot=5}, {MAB=10, DrainPot=5},
        {MAB=11, DrainPot=6}, {MAB=12, DrainPot=6}, {MAB=13, DrainPot=7}, {MAB=14, DrainPot=7}, {MAB=15, DrainPot=8},
        {MAB=16, DrainPot=8, Acc=1, Macc=1}, {MAB=17, DrainPot=9, Acc=2, Macc=2}, {MAB=18, DrainPot=9, Acc=3, Macc=3}, {MAB=19, DrainPot=10, Acc=4, Macc=4}, {MAB=20, DrainPot=10, Acc=5, Macc=5},
        {MAB=21, DrainPot=11, Acc=6, Macc=6, SIRD=1}, {MAB=21, DrainPot=11, Acc=7, Macc=7, SIRD=2}, {MAB=22, DrainPot=12, Acc=8, Macc=8, SIRD=3}, {MAB=22, DrainPot=12, Acc=9, Macc=9, SIRD=4}, {MAB=23, DrainPot=13, Acc=10, Macc=10, SIRD=5},
        {MAB=23, DrainPot=13, Acc=11, Macc=11, SIRD=6}, {MAB=24, DrainPot=14, Acc=12, Macc=12, SIRD=7}, {MAB=24, DrainPot=14, Acc=13, Macc=13, SIRD=8}, {MAB=25, DrainPot=14, Acc=14, Macc=14, SIRD=9}, {MAB=25, DrainPot=15, Acc=15, Macc=15, SIRD=10}
    }
}

-- ==============================================================================
-- BUNZI GEAR (IDs: 23760, 23767, 23774, 23781, 23788) (PATH A ONLY)
-- ==============================================================================
local bunzi_head = {
    ['A'] = {
        {Atk=1, MDMG=1, STP=1}, {Atk=2, MDMG=2, STP=1}, {Atk=3, MDMG=3, STP=1}, {Atk=4, MDMG=4, STP=1}, {Atk=5, MDMG=5, STP=2},
        {Atk=6, MDMG=6, STP=2}, {Atk=7, MDMG=7, STP=2}, {Atk=8, MDMG=8, STP=2}, {Atk=9, MDMG=9, STP=3}, {Atk=10, MDMG=10, STP=3},
        {Atk=11, MDMG=11, STP=3}, {Atk=12, MDMG=12, STP=3}, {Atk=13, MDMG=13, STP=4}, {Atk=14, MDMG=14, STP=4}, {Atk=15, MDMG=15, STP=4},
        {Atk=16, MDMG=16, STP=4, Acc=1, Macc=1}, {Atk=17, MDMG=17, STP=5, Acc=2, Macc=2}, {Atk=18, MDMG=18, STP=5, Acc=3, Macc=3}, {Atk=19, MDMG=19, STP=5, Acc=4, Macc=4}, {Atk=20, MDMG=20, STP=5, Acc=5, Macc=5},
        {Atk=21, MDMG=21, STP=6, Acc=6, Macc=6, QA=1}, {Atk=22, MDMG=22, STP=6, Acc=7, Macc=7, QA=1}, {Atk=23, MDMG=23, STP=6, Acc=8, Macc=8, QA=1}, {Atk=24, MDMG=24, STP=6, Acc=9, Macc=9, QA=1}, {Atk=25, MDMG=25, STP=7, Acc=10, Macc=10, QA=2},
        {Atk=26, MDMG=26, STP=7, Acc=11, Macc=11, QA=2}, {Atk=27, MDMG=27, STP=7, Acc=12, Macc=12, QA=2}, {Atk=28, MDMG=28, STP=7, Acc=13, Macc=13, QA=2}, {Atk=29, MDMG=29, STP=8, Acc=14, Macc=14, QA=2}, {Atk=30, MDMG=30, STP=8, Acc=15, Macc=15, QA=3}
    }
}
local bunzi_body = {
    ['A'] = {
        {Atk=1, MDMG=1, PDL=1}, {Atk=2, MDMG=2, PDL=1}, {Atk=3, MDMG=3, PDL=1}, {Atk=4, MDMG=4, PDL=1}, {Atk=5, MDMG=5, PDL=2},
        {Atk=6, MDMG=6, PDL=2}, {Atk=7, MDMG=7, PDL=2}, {Atk=8, MDMG=8, PDL=2}, {Atk=9, MDMG=9, PDL=3}, {Atk=10, MDMG=10, PDL=3},
        {Atk=11, MDMG=11, PDL=3}, {Atk=12, MDMG=12, PDL=3}, {Atk=13, MDMG=13, PDL=4}, {Atk=14, MDMG=14, PDL=4}, {Atk=15, MDMG=15, PDL=4},
        {Atk=16, MDMG=16, PDL=4, Acc=1, Macc=1}, {Atk=17, MDMG=17, PDL=5, Acc=2, Macc=2}, {Atk=18, MDMG=18, PDL=5, Acc=3, Macc=3}, {Atk=19, MDMG=19, PDL=5, Acc=4, Macc=4}, {Atk=20, MDMG=20, PDL=5, Acc=5, Macc=5},
        {Atk=21, MDMG=21, PDL=6, Acc=6, Macc=6, DEX=1}, {Atk=22, MDMG=22, PDL=6, Acc=7, Macc=7, DEX=1}, {Atk=23, MDMG=23, PDL=6, Acc=8, Macc=8, DEX=2}, {Atk=24, MDMG=24, PDL=6, Acc=9, Macc=9, DEX=2}, {Atk=25, MDMG=25, PDL=7, Acc=10, Macc=10, DEX=3},
        {Atk=26, MDMG=26, PDL=7, Acc=11, Macc=11, DEX=3}, {Atk=27, MDMG=27, PDL=7, Acc=12, Macc=12, DEX=4}, {Atk=28, MDMG=28, PDL=7, Acc=13, Macc=13, DEX=4}, {Atk=29, MDMG=29, PDL=8, Acc=14, Macc=14, DEX=5}, {Atk=30, MDMG=30, PDL=8, Acc=15, Macc=15, DEX=5}
    }
}
local bunzi_hands = {
    ['A'] = {
        {Atk=1, MDMG=1, MBD2=1}, {Atk=2, MDMG=2, MBD2=1}, {Atk=3, MDMG=3, MBD2=1}, {Atk=4, MDMG=4, MBD2=1}, {Atk=5, MDMG=5, MBD2=1},
        {Atk=6, MDMG=6, MBD2=2}, {Atk=7, MDMG=7, MBD2=2}, {Atk=8, MDMG=8, MBD2=2}, {Atk=9, MDMG=9, MBD2=2}, {Atk=10, MDMG=10, MBD2=2},
        {Atk=11, MDMG=11, MBD2=3}, {Atk=12, MDMG=12, MBD2=3}, {Atk=13, MDMG=13, MBD2=3}, {Atk=14, MDMG=14, MBD2=3}, {Atk=15, MDMG=15, MBD2=3},
        {Atk=16, MDMG=16, MBD2=4, Acc=1, Macc=1}, {Atk=17, MDMG=17, MBD2=4, Acc=2, Macc=2}, {Atk=18, MDMG=18, MBD2=4, Acc=3, Macc=3}, {Atk=19, MDMG=19, MBD2=4, Acc=4, Macc=4}, {Atk=20, MDMG=20, MBD2=4, Acc=5, Macc=5},
        {Atk=21, MDMG=21, MBD2=5, Acc=6, Macc=6, MND=1}, {Atk=22, MDMG=22, MBD2=5, Acc=7, Macc=7, MND=1}, {Atk=23, MDMG=23, MBD2=5, Acc=8, Macc=8, MND=2}, {Atk=24, MDMG=24, MBD2=5, Acc=9, Macc=9, MND=2}, {Atk=25, MDMG=25, MBD2=5, Acc=10, Macc=10, MND=3},
        {Atk=26, MDMG=26, MBD2=6, Acc=11, Macc=11, MND=3}, {Atk=27, MDMG=27, MBD2=6, Acc=12, Macc=12, MND=4}, {Atk=28, MDMG=28, MBD2=6, Acc=13, Macc=13, MND=4}, {Atk=29, MDMG=29, MBD2=6, Acc=14, Macc=14, MND=5}, {Atk=30, MDMG=30, MBD2=6, Acc=15, Macc=15, MND=5}
    }
}
local bunzi_legs = {
    ['A'] = {
        {Atk=1, MDMG=1, BPDmg=1}, {Atk=2, MDMG=2, BPDmg=1}, {Atk=3, MDMG=3, BPDmg=1}, {Atk=4, MDMG=4, BPDmg=1}, {Atk=5, MDMG=5, BPDmg=2},
        {Atk=6, MDMG=6, BPDmg=2}, {Atk=7, MDMG=7, BPDmg=2}, {Atk=8, MDMG=8, BPDmg=2}, {Atk=9, MDMG=9, BPDmg=3}, {Atk=10, MDMG=10, BPDmg=3},
        {Atk=11, MDMG=11, BPDmg=3}, {Atk=12, MDMG=12, BPDmg=3}, {Atk=13, MDMG=13, BPDmg=4}, {Atk=14, MDMG=14, BPDmg=4}, {Atk=15, MDMG=15, BPDmg=4},
        {Atk=16, MDMG=16, BPDmg=4, Acc=1, Macc=1}, {Atk=17, MDMG=17, BPDmg=5, Acc=2, Macc=2}, {Atk=18, MDMG=18, BPDmg=5, Acc=3, Macc=3}, {Atk=19, MDMG=19, BPDmg=5, Acc=4, Macc=4}, {Atk=20, MDMG=20, BPDmg=5, Acc=5, Macc=5},
        {Atk=21, MDMG=21, BPDmg=6, Acc=6, Macc=6, PetDT=-1}, {Atk=22, MDMG=22, BPDmg=6, Acc=7, Macc=7, PetDT=-1}, {Atk=23, MDMG=23, BPDmg=6, Acc=8, Macc=8, PetDT=-2}, {Atk=24, MDMG=24, BPDmg=6, Acc=9, Macc=9, PetDT=-2}, {Atk=25, MDMG=25, BPDmg=7, Acc=10, Macc=10, PetDT=-3},
        {Atk=26, MDMG=26, BPDmg=7, Acc=11, Macc=11, PetDT=-3}, {Atk=27, MDMG=27, BPDmg=7, Acc=12, Macc=12, PetDT=-4}, {Atk=28, MDMG=28, BPDmg=7, Acc=13, Macc=13, PetDT=-4}, {Atk=29, MDMG=29, BPDmg=8, Acc=14, Macc=14, PetDT=-5}, {Atk=30, MDMG=30, BPDmg=8, Acc=15, Macc=15, PetDT=-5}
    }
}
local bunzi_feet = {
    ['A'] = {
        {Atk=1, MDMG=1, RegenPot=1}, {Atk=2, MDMG=2, RegenPot=1}, {Atk=3, MDMG=3, RegenPot=1}, {Atk=4, MDMG=4, RegenPot=2}, {Atk=5, MDMG=5, RegenPot=2},
        {Atk=6, MDMG=6, RegenPot=2}, {Atk=7, MDMG=7, RegenPot=3}, {Atk=8, MDMG=8, RegenPot=3}, {Atk=9, MDMG=9, RegenPot=3}, {Atk=10, MDMG=10, RegenPot=4},
        {Atk=11, MDMG=11, RegenPot=4}, {Atk=12, MDMG=12, RegenPot=4}, {Atk=13, MDMG=13, RegenPot=5}, {Atk=14, MDMG=14, RegenPot=5}, {Atk=15, MDMG=15, RegenPot=5},
        {Atk=16, MDMG=16, RegenPot=6, Acc=1, Macc=1}, {Atk=17, MDMG=17, RegenPot=6, Acc=2, Macc=2}, {Atk=18, MDMG=18, RegenPot=6, Acc=3, Macc=3}, {Atk=19, MDMG=19, RegenPot=7, Acc=4, Macc=4}, {Atk=20, MDMG=20, RegenPot=7, Acc=5, Macc=5},
        {Atk=21, MDMG=21, RegenPot=7, Acc=6, Macc=6, AvaAttr=1}, {Atk=22, MDMG=22, RegenPot=8, Acc=7, Macc=7, AvaAttr=2}, {Atk=23, MDMG=23, RegenPot=8, Acc=8, Macc=8, AvaAttr=3}, {Atk=24, MDMG=24, RegenPot=8, Acc=9, Macc=9, AvaAttr=4}, {Atk=25, MDMG=25, RegenPot=9, Acc=10, Macc=10, AvaAttr=5},
        {Atk=26, MDMG=26, RegenPot=9, Acc=11, Macc=11, AvaAttr=6}, {Atk=27, MDMG=27, RegenPot=9, Acc=12, Macc=12, AvaAttr=7}, {Atk=28, MDMG=28, RegenPot=10, Acc=13, Macc=13, AvaAttr=8}, {Atk=29, MDMG=29, RegenPot=10, Acc=14, Macc=14, AvaAttr=9}, {Atk=30, MDMG=30, RegenPot=10, Acc=15, Macc=15, AvaAttr=10}
    }
}

-- ==============================================================================
-- MPACA GEAR (IDs: 23758, 23765, 23772, 23779, 23786) (PATH A ONLY)
-- ==============================================================================
local mpaca_head = {
    ['A'] = {
        {Atk=1, SCDmg=1}, {Atk=2, SCDmg=1}, {Atk=3, SCDmg=2}, {Atk=4, SCDmg=2}, {Atk=5, SCDmg=3},
        {Atk=6, SCDmg=3}, {Atk=7, SCDmg=4}, {Atk=8, SCDmg=4}, {Atk=9, SCDmg=5}, {Atk=10, SCDmg=5},
        {Atk=11, SCDmg=6}, {Atk=12, SCDmg=6}, {Atk=13, SCDmg=7}, {Atk=14, SCDmg=7}, {Atk=15, SCDmg=8},
        {Atk=16, SCDmg=8, Acc=1, Macc=1}, {Atk=17, SCDmg=9, Acc=2, Macc=2}, {Atk=18, SCDmg=9, Acc=3, Macc=3}, {Atk=19, SCDmg=10, Acc=4, Macc=4}, {Atk=20, SCDmg=10, Acc=5, Macc=5},
        {Atk=21, SCDmg=11, Acc=6, Macc=6, DA=1}, {Atk=22, SCDmg=11, Acc=7, Macc=7, DA=1}, {Atk=23, SCDmg=12, Acc=8, Macc=8, DA=2}, {Atk=24, SCDmg=12, Acc=9, Macc=9, DA=2}, {Atk=25, SCDmg=13, Acc=10, Macc=10, DA=3},
        {Atk=26, SCDmg=13, Acc=11, Macc=11, DA=3}, {Atk=27, SCDmg=14, Acc=12, Macc=12, DA=4}, {Atk=28, SCDmg=14, Acc=13, Macc=13, DA=4}, {Atk=29, SCDmg=14, Acc=14, Macc=14, DA=5}, {Atk=30, SCDmg=15, Acc=15, Macc=15, DA=5}
    }
}
local mpaca_body = {
    ['A'] = {
        {Atk=1, STP=1}, {Atk=2, STP=1}, {Atk=3, STP=1}, {Atk=4, STP=1}, {Atk=5, STP=2},
        {Atk=6, STP=2}, {Atk=7, STP=2}, {Atk=8, STP=2}, {Atk=9, STP=3}, {Atk=10, STP=3},
        {Atk=11, STP=3}, {Atk=12, STP=3}, {Atk=13, STP=4}, {Atk=14, STP=4}, {Atk=15, STP=4},
        {Atk=16, STP=4, Acc=1, Macc=1}, {Atk=17, STP=5, Acc=2, Macc=2}, {Atk=18, STP=5, Acc=3, Macc=3}, {Atk=19, STP=5, Acc=4, Macc=4}, {Atk=20, STP=5, Acc=5, Macc=5},
        {Atk=21, STP=6, Acc=6, Macc=6, Regen=1}, {Atk=22, STP=6, Acc=7, Macc=7, Regen=1}, {Atk=23, STP=6, Acc=8, Macc=8, Regen=1}, {Atk=24, STP=6, Acc=9, Macc=9, Regen=1}, {Atk=25, STP=7, Acc=10, Macc=10, Regen=2},
        {Atk=26, STP=7, Acc=11, Macc=11, Regen=2}, {Atk=27, STP=7, Acc=12, Macc=12, Regen=2}, {Atk=28, STP=7, Acc=13, Macc=13, Regen=2}, {Atk=29, STP=8, Acc=14, Macc=14, Regen=2}, {Atk=30, STP=8, Acc=15, Macc=15, Regen=3}
    }
}
local mpaca_hands = {
    ['A'] = {
        {Atk=1, TAdmg=1}, {Atk=2, TAdmg=1}, {Atk=3, TAdmg=1}, {Atk=4, TAdmg=2}, {Atk=5, TAdmg=2},
        {Atk=6, TAdmg=2}, {Atk=7, TAdmg=3}, {Atk=8, TAdmg=3}, {Atk=9, TAdmg=3}, {Atk=10, TAdmg=4},
        {Atk=11, TAdmg=4}, {Atk=12, TAdmg=4}, {Atk=13, TAdmg=5}, {Atk=14, TAdmg=5}, {Atk=15, TAdmg=5},
        {Atk=16, TAdmg=6, Acc=1, Macc=1}, {Atk=17, TAdmg=6, Acc=2, Macc=2}, {Atk=18, TAdmg=6, Acc=3, Macc=3}, {Atk=19, TAdmg=7, Acc=4, Macc=4}, {Atk=20, TAdmg=7, Acc=5, Macc=5},
        {Atk=21, TAdmg=7, Acc=6, Macc=6, DEX=1}, {Atk=22, TAdmg=8, Acc=7, Macc=7, DEX=1}, {Atk=23, TAdmg=8, Acc=8, Macc=8, DEX=2}, {Atk=24, TAdmg=8, Acc=9, Macc=9, DEX=2}, {Atk=25, TAdmg=9, Acc=10, Macc=10, DEX=3},
        {Atk=26, TAdmg=9, Acc=11, Macc=11, DEX=3}, {Atk=27, TAdmg=9, Acc=12, Macc=12, DEX=4}, {Atk=28, TAdmg=10, Acc=13, Macc=13, DEX=4}, {Atk=29, TAdmg=10, Acc=13, Macc=13, DEX=5}, {Atk=30, TAdmg=10, Acc=14, Macc=14, DEX=5}
    }
}
local mpaca_legs = {
    ['A'] = {
        {Atk=1, PDL=1}, {Atk=2, PDL=1}, {Atk=3, PDL=1}, {Atk=4, PDL=1}, {Atk=5, PDL=2},
        {Atk=6, PDL=2}, {Atk=7, PDL=2}, {Atk=8, PDL=2}, {Atk=9, PDL=3}, {Atk=10, PDL=3},
        {Atk=11, PDL=3}, {Atk=12, PDL=3}, {Atk=13, PDL=4}, {Atk=14, PDL=4}, {Atk=15, PDL=4},
        {Atk=16, PDL=4, Acc=1, Macc=1}, {Atk=17, PDL=5, Acc=2, Macc=2}, {Atk=18, PDL=5, Acc=3, Macc=3}, {Atk=19, PDL=5, Acc=4, Macc=4}, {Atk=20, PDL=5, Acc=5, Macc=5},
        {Atk=21, PDL=6, Acc=6, Macc=6, Meva=1}, {Atk=22, PDL=6, Acc=7, Macc=7, Meva=2}, {Atk=23, PDL=6, Acc=8, Macc=8, Meva=3}, {Atk=24, PDL=6, Acc=9, Macc=9, Meva=4}, {Atk=25, PDL=7, Acc=10, Macc=10, Meva=5},
        {Atk=26, PDL=7, Acc=11, Macc=11, Meva=6}, {Atk=27, PDL=7, Acc=12, Macc=12, Meva=7}, {Atk=28, PDL=7, Acc=13, Macc=13, Meva=8}, {Atk=29, PDL=8, Acc=14, Macc=14, Meva=9}, {Atk=30, PDL=8, Acc=15, Macc=15, Meva=10}
    }
}
local mpaca_boots = {
    ['A'] = {
        {Atk=1, MAB=2}, {Atk=2, MAB=4}, {Atk=3, MAB=6}, {Atk=4, MAB=8}, {Atk=5, MAB=10},
        {Atk=6, MAB=12}, {Atk=7, MAB=14}, {Atk=8, MAB=16}, {Atk=9, MAB=18}, {Atk=10, MAB=20},
        {Atk=11, MAB=22}, {Atk=12, MAB=24}, {Atk=13, MAB=26}, {Atk=14, MAB=28}, {Atk=15, MAB=30},
        {Atk=16, MAB=31, Acc=1, Macc=1}, {Atk=17, MAB=32, Acc=2, Macc=2}, {Atk=18, MAB=33, Acc=3, Macc=3}, {Atk=19, MAB=34, Acc=4, Macc=4}, {Atk=20, MAB=35, Acc=5, Macc=5},
        {Atk=21, MAB=36, Acc=6, Macc=6, AGI=1}, {Atk=22, MAB=37, Acc=7, Macc=7, AGI=1}, {Atk=23, MAB=38, Acc=8, Macc=8, AGI=2}, {Atk=24, MAB=39, Acc=9, Macc=9, AGI=2}, {Atk=25, MAB=40, Acc=10, Macc=10, AGI=3},
        {Atk=26, MAB=41, Acc=11, Macc=11, AGI=3}, {Atk=27, MAB=42, Acc=12, Macc=12, AGI=4}, {Atk=28, MAB=43, Acc=13, Macc=13, AGI=4}, {Atk=29, MAB=44, Acc=14, Macc=14, AGI=5}, {Atk=30, MAB=45, Acc=15, Macc=15, AGI=5}
    }
}

-- ==============================================================================
-- ODYSSEY WEAPONS AND ACCESSORIES
-- ==============================================================================
local ikenga_axe = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=6, Atk=14}, {DMG=7, Atk=16}, {DMG=7, Atk=18}, {DMG=8, Atk=20},
        {DMG=8, Atk=22}, {DMG=9, Atk=24}, {DMG=9, Atk=26}, {DMG=10, Atk=28}, {DMG=10, Atk=30},
        {DMG=10, Atk=31, Acc=1, Macc=1}, {DMG=11, Atk=32, Acc=2, Macc=2}, {DMG=11, Atk=33, Acc=3, Macc=3}, {DMG=11, Atk=34, Acc=4, Macc=4}, {DMG=12, Atk=35, Acc=5, Macc=5},
        {DMG=12, Atk=36, Acc=6, Macc=6, TPBonus=100}, {DMG=12, Atk=37, Acc=7, Macc=7, TPBonus=100}, {DMG=13, Atk=38, Acc=8, Macc=8, TPBonus=200}, {DMG=13, Atk=39, Acc=9, Macc=9, TPBonus=200}, {DMG=13, Atk=40, Acc=10, Macc=10, TPBonus=300},
        {DMG=14, Atk=41, Acc=11, Macc=11, TPBonus=300}, {DMG=14, Atk=42, Acc=12, Macc=12, TPBonus=400}, {DMG=14, Atk=43, Acc=13, Macc=13, TPBonus=400}, {DMG=14, Atk=44, Acc=14, Macc=14, TPBonus=500}, {DMG=15, Atk=45, Acc=15, Macc=15, TPBonus=500}
    }
}
local ikenga_lance = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=7, Atk=14}, {DMG=8, Atk=16}, {DMG=9, Atk=18}, {DMG=10, Atk=20},
        {DMG=11, Atk=22}, {DMG=12, Atk=24}, {DMG=13, Atk=26}, {DMG=14, Atk=28}, {DMG=15, Atk=30},
        {DMG=16, Atk=31, Acc=1, Macc=1}, {DMG=17, Atk=32, Acc=2, Macc=2}, {DMG=18, Atk=33, Acc=3, Macc=3}, {DMG=19, Atk=34, Acc=4, Macc=4}, {DMG=20, Atk=35, Acc=5, Macc=5},
        {DMG=21, Atk=36, Acc=6, Macc=6, Regen=1}, {DMG=22, Atk=37, Acc=7, Macc=7, Regen=1}, {DMG=22, Atk=38, Acc=8, Macc=8, Regen=1}, {DMG=23, Atk=39, Acc=9, Macc=9, Regen=1}, {DMG=23, Atk=40, Acc=10, Macc=10, Regen=2},
        {DMG=24, Atk=41, Acc=11, Macc=11, Regen=2}, {DMG=24, Atk=42, Acc=12, Macc=12, Regen=2}, {DMG=25, Atk=43, Acc=13, Macc=13, Regen=2}, {DMG=25, Atk=44, Acc=14, Macc=14, Regen=2}, {DMG=26, Atk=45, Acc=15, Macc=15, Regen=3}
    }
}
local kunimitsu = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=1, Atk=4}, {DMG=2, Atk=6}, {DMG=2, Atk=8}, {DMG=3, Atk=10},
        {DMG=3, Atk=12}, {DMG=4, Atk=14}, {DMG=4, Atk=16}, {DMG=5, Atk=18}, {DMG=5, Atk=20},
        {DMG=6, Atk=22}, {DMG=6, Atk=24}, {DMG=7, Atk=26}, {DMG=7, Atk=28}, {DMG=8, Atk=30},
        {DMG=8, Atk=31, Acc=1, Macc=1}, {DMG=8, Atk=32, Acc=2, Macc=2}, {DMG=9, Atk=33, Acc=3, Macc=3}, {DMG=9, Atk=34, Acc=4, Macc=4}, {DMG=9, Atk=35, Acc=5, Macc=5},
        {DMG=10, Atk=36, Acc=6, Macc=6, Daken=1}, {DMG=10, Atk=37, Acc=7, Macc=7, Daken=1}, {DMG=10, Atk=38, Acc=8, Macc=8, Daken=2}, {DMG=10, Atk=39, Acc=9, Macc=9, Daken=2}, {DMG=11, Atk=40, Acc=10, Macc=10, Daken=3},
        {DMG=11, Atk=41, Acc=11, Macc=11, Daken=3}, {DMG=11, Atk=42, Acc=12, Macc=12, Daken=4}, {DMG=11, Atk=43, Acc=13, Macc=13, Daken=4}, {DMG=11, Atk=44, Acc=14, Macc=14, Daken=5}, {DMG=12, Atk=45, Acc=15, Macc=15, Daken=5}
    }
}
local gleti_crossbow = {
    ['A'] = {
        {DMG=1, Ratk=2}, {DMG=1, Ratk=4}, {DMG=1, Ratk=6}, {DMG=2, Ratk=8}, {DMG=2, Ratk=10},
        {DMG=2, Ratk=12}, {DMG=3, Ratk=14}, {DMG=3, Ratk=16}, {DMG=3, Ratk=18}, {DMG=4, Ratk=20},
        {DMG=4, Ratk=22}, {DMG=4, Ratk=24}, {DMG=5, Ratk=26}, {DMG=5, Ratk=28}, {DMG=5, Ratk=30},
        {DMG=5, Ratk=31, Racc=1, Macc=1}, {DMG=6, Ratk=32, Racc=2, Macc=2}, {DMG=6, Ratk=33, Racc=3, Macc=3}, {DMG=6, Ratk=34, Racc=4, Macc=4}, {DMG=6, Ratk=35, Racc=5, Macc=5},
        {DMG=7, Ratk=36, Racc=6, Macc=6, Snapshot=1}, {DMG=7, Ratk=37, Racc=7, Macc=7, Snapshot=2}, {DMG=7, Ratk=38, Racc=8, Macc=8, Snapshot=3}, {DMG=7, Ratk=39, Racc=9, Macc=9, Snapshot=4}, {DMG=8, Ratk=40, Racc=10, Macc=10, Snapshot=5},
        {DMG=8, Ratk=41, Racc=11, Macc=11, Snapshot=6}, {DMG=8, Ratk=42, Racc=12, Macc=12, Snapshot=7}, {DMG=8, Ratk=43, Racc=13, Macc=13, Snapshot=8}, {DMG=8, Ratk=44, Racc=14, Macc=14, Snapshot=9}, {DMG=9, Ratk=45, Racc=15, Macc=15, Snapshot=10}
    }
}
local gleti_knife = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=1, Atk=4}, {DMG=2, Atk=6}, {DMG=2, Atk=8}, {DMG=3, Atk=10},
        {DMG=3, Atk=12}, {DMG=4, Atk=14}, {DMG=4, Atk=16}, {DMG=5, Atk=18}, {DMG=5, Atk=20},
        {DMG=6, Atk=22}, {DMG=6, Atk=24}, {DMG=7, Atk=26}, {DMG=7, Atk=28}, {DMG=8, Atk=30},
        {DMG=8, Atk=31, Acc=1, Macc=1}, {DMG=8, Atk=32, Acc=2, Macc=2}, {DMG=8, Atk=33, Acc=3, Macc=3}, {DMG=8, Atk=34, Acc=4, Macc=4}, {DMG=9, Atk=35, Acc=5, Macc=5},
        {DMG=9, Atk=36, Acc=6, Macc=6, SB2=1}, {DMG=9, Atk=37, Acc=7, Macc=7, SB2=2}, {DMG=9, Atk=38, Acc=8, Macc=8, SB2=3}, {DMG=9, Atk=39, Acc=9, Macc=9, SB2=4}, {DMG=10, Atk=40, Acc=10, Macc=10, SB2=5},
        {DMG=10, Atk=41, Acc=11, Macc=11, SB2=6}, {DMG=10, Atk=42, Acc=12, Macc=12, SB2=7}, {DMG=10, Atk=43, Acc=13, Macc=13, SB2=8}, {DMG=10, Atk=44, Acc=14, Macc=14, SB2=9}, {DMG=11, Atk=45, Acc=15, Macc=15, SB2=10}
    }
}
local gekkei = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=7, Atk=14}, {DMG=8, Atk=16}, {DMG=9, Atk=18}, {DMG=10, Atk=20},
        {DMG=11, Atk=22}, {DMG=12, Atk=24}, {DMG=13, Atk=26}, {DMG=14, Atk=28}, {DMG=15, Atk=30},
        {DMG=16, Atk=31, Acc=1, Macc=1}, {DMG=17, Atk=32, Acc=2, Macc=2}, {DMG=18, Atk=33, Acc=3, Macc=3}, {DMG=18, Atk=34, Acc=4, Macc=4}, {DMG=19, Atk=35, Acc=5, Macc=5},
        {DMG=19, Atk=36, Acc=6, Macc=6, STR=1}, {DMG=20, Atk=37, Acc=7, Macc=7, STR=1}, {DMG=20, Atk=38, Acc=8, Macc=8, STR=2}, {DMG=21, Atk=39, Acc=9, Macc=9, STR=2}, {DMG=21, Atk=40, Acc=10, Macc=10, STR=3},
        {DMG=22, Atk=41, Acc=11, Macc=11, STR=3}, {DMG=22, Atk=42, Acc=12, Macc=12, STR=4}, {DMG=23, Atk=43, Acc=13, Macc=13, STR=4}, {DMG=23, Atk=44, Acc=14, Macc=14, STR=5}, {DMG=24, Atk=45, Acc=15, Macc=15, STR=5}
    }
}
local sakpata_fists = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=7, Atk=14}, {DMG=8, Atk=16}, {DMG=9, Atk=18}, {DMG=10, Atk=20},
        {DMG=11, Atk=22}, {DMG=12, Atk=24}, {DMG=13, Atk=26}, {DMG=14, Atk=28}, {DMG=15, Atk=30},
        {DMG=15, Atk=31, Acc=1, Macc=1}, {DMG=16, Atk=32, Acc=2, Macc=2}, {DMG=16, Atk=33, Acc=3, Macc=3}, {DMG=16, Atk=34, Acc=4, Macc=4}, {DMG=17, Atk=35, Acc=5, Macc=5},
        {DMG=17, Atk=36, Acc=6, Macc=6, SCDmg=1}, {DMG=17, Atk=37, Acc=7, Macc=7, SCDmg=2}, {DMG=18, Atk=38, Acc=8, Macc=8, SCDmg=3}, {DMG=18, Atk=39, Acc=9, Macc=9, SCDmg=4}, {DMG=18, Atk=40, Acc=10, Macc=10, SCDmg=5},
        {DMG=19, Atk=41, Acc=11, Macc=11, SCDmg=6}, {DMG=19, Atk=42, Acc=12, Macc=12, SCDmg=7}, {DMG=19, Atk=43, Acc=13, Macc=13, SCDmg=8}, {DMG=19, Atk=44, Acc=14, Macc=14, SCDmg=9}, {DMG=20, Atk=45, Acc=15, Macc=15, SCDmg=10}
    }
}
local agwu_axe = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=6, Atk=14}, {DMG=7, Atk=16}, {DMG=7, Atk=18}, {DMG=8, Atk=20},
        {DMG=8, Atk=22}, {DMG=9, Atk=24}, {DMG=9, Atk=26}, {DMG=10, Atk=28}, {DMG=10, Atk=30},
        {DMG=10, Atk=31, Acc=1, Macc=1}, {DMG=11, Atk=32, Acc=2, Macc=2}, {DMG=11, Atk=33, Acc=3, Macc=3}, {DMG=11, Atk=34, Acc=4, Macc=4}, {DMG=12, Atk=35, Acc=5, Macc=5},
        {DMG=12, Atk=36, Acc=6, Macc=6, SCDmg=1}, {DMG=12, Atk=37, Acc=7, Macc=7, SCDmg=2}, {DMG=13, Atk=38, Acc=8, Macc=8, SCDmg=3}, {DMG=13, Atk=39, Acc=9, Macc=9, SCDmg=4}, {DMG=13, Atk=40, Acc=10, Macc=10, SCDmg=5},
        {DMG=14, Atk=41, Acc=11, Macc=11, SCDmg=6}, {DMG=14, Atk=42, Acc=12, Macc=12, SCDmg=7}, {DMG=14, Atk=43, Acc=13, Macc=13, SCDmg=8}, {DMG=14, Atk=44, Acc=14, Macc=14, SCDmg=9}, {DMG=15, Atk=45, Acc=15, Macc=15, SCDmg=10}
    }
}
local agwu_claymore = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=7, Atk=14}, {DMG=8, Atk=16}, {DMG=9, Atk=18}, {DMG=10, Atk=20},
        {DMG=11, Atk=22}, {DMG=12, Atk=24}, {DMG=13, Atk=26}, {DMG=14, Atk=28}, {DMG=15, Atk=30},
        {DMG=16, Atk=31, Acc=1, Macc=1}, {DMG=17, Atk=32, Acc=2, Macc=2}, {DMG=18, Atk=33, Acc=3, Macc=3}, {DMG=19, Atk=34, Acc=4, Macc=4}, {DMG=20, Atk=35, Acc=5, Macc=5},
        {DMG=21, Atk=36, Acc=6, Macc=6, Counter=1}, {DMG=22, Atk=37, Acc=7, Macc=7, Counter=2}, {DMG=22, Atk=38, Acc=8, Macc=8, Counter=3}, {DMG=23, Atk=39, Acc=9, Macc=9, Counter=4}, {DMG=23, Atk=40, Acc=10, Macc=10, Counter=5},
        {DMG=24, Atk=41, Acc=11, Macc=11, Counter=6}, {DMG=24, Atk=42, Acc=12, Macc=12, Counter=7}, {DMG=25, Atk=43, Acc=13, Macc=13, Counter=8}, {DMG=25, Atk=44, Acc=14, Macc=14, Counter=9}, {DMG=26, Atk=45, Acc=15, Macc=15, Counter=10}
    }
}
local agwu_scythe = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=7, Atk=14}, {DMG=8, Atk=16}, {DMG=9, Atk=18}, {DMG=10, Atk=20},
        {DMG=11, Atk=22}, {DMG=12, Atk=24}, {DMG=13, Atk=26}, {DMG=14, Atk=28}, {DMG=15, Atk=30},
        {DMG=16, Atk=31, Acc=1, Macc=1}, {DMG=17, Atk=32, Acc=2, Macc=2}, {DMG=18, Atk=33, Acc=3, Macc=3}, {DMG=19, Atk=34, Acc=4, Macc=4}, {DMG=20, Atk=35, Acc=5, Macc=5},
        {DMG=21, Atk=36, Acc=6, Macc=6, DT=-1}, {DMG=22, Atk=37, Acc=7, Macc=7, DT=-2}, {DMG=23, Atk=38, Acc=8, Macc=8, DT=-3}, {DMG=24, Atk=39, Acc=9, Macc=9, DT=-4}, {DMG=25, Atk=40, Acc=10, Macc=10, DT=-5},
        {DMG=26, Atk=41, Acc=11, Macc=11, DT=-6}, {DMG=26, Atk=42, Acc=12, Macc=12, DT=-7}, {DMG=27, Atk=43, Acc=13, Macc=13, DT=-8}, {DMG=27, Atk=44, Acc=14, Macc=14, DT=-9}, {DMG=28, Atk=45, Acc=15, Macc=15, DT=-10}
    }
}
local bunzi_chopper = {
    ['A'] = {
        {DMG=1, Atk=2}, {DMG=2, Atk=4}, {DMG=3, Atk=6}, {DMG=4, Atk=8}, {DMG=5, Atk=10},
        {DMG=6, Atk=12}, {DMG=7, Atk=14}, {DMG=8, Atk=16}, {DMG=9, Atk=18}, {DMG=10, Atk=20},
        {DMG=11, Atk=22}, {DMG=12, Atk=24}, {DMG=13, Atk=26}, {DMG=14, Atk=28}, {DMG=15, Atk=30},
        {DMG=16, Atk=31, Acc=1, Macc=1}, {DMG=17, Atk=32, Acc=2, Macc=2}, {DMG=18, Atk=33, Acc=3, Macc=3}, {DMG=19, Atk=34, Acc=4, Macc=4}, {DMG=20, Atk=35, Acc=5, Macc=5},
        {DMG=21, Atk=36, Acc=6, Macc=6, STR=1, VIT=1}, {DMG=22, Atk=37, Acc=7, Macc=7, STR=1, VIT=1}, {DMG=23, Atk=38, Acc=8, Macc=8, STR=2, VIT=2}, {DMG=24, Atk=39, Acc=9, Macc=9, STR=2, VIT=2}, {DMG=24, Atk=40, Acc=10, Macc=10, STR=3, VIT=3},
        {DMG=25, Atk=41, Acc=11, Macc=11, STR=3, VIT=3}, {DMG=25, Atk=42, Acc=12, Macc=12, STR=4, VIT=4}, {DMG=26, Atk=43, Acc=13, Macc=13, STR=4, VIT=4}, {DMG=26, Atk=44, Acc=14, Macc=14, STR=5, VIT=5}, {DMG=27, Atk=45, Acc=15, Macc=15, STR=5, VIT=5}
    }
}
local bunzi_rod = {
    ['A'] = {
        {DMG=1, MAB=1}, {DMG=1, MAB=2}, {DMG=2, MAB=3}, {DMG=2, MAB=4}, {DMG=3, MAB=5},
        {DMG=3, MAB=6}, {DMG=4, MAB=7}, {DMG=4, MAB=8}, {DMG=5, MAB=9}, {DMG=5, MAB=10},
        {DMG=6, MAB=11}, {DMG=6, MAB=12}, {DMG=7, MAB=13}, {DMG=7, MAB=14}, {DMG=8, MAB=15},
        {DMG=8, MAB=16, Acc=1, Macc=1}, {DMG=8, MAB=17, Acc=2, Macc=2}, {DMG=8, MAB=18, Acc=3, Macc=3}, {DMG=8, MAB=19, Acc=4, Macc=4}, {DMG=9, MAB=20, Acc=5, Macc=5},
        {DMG=9, MAB=21, Acc=6, Macc=6, Enmity=-1}, {DMG=9, MAB=22, Acc=7, Macc=7, Enmity=-1}, {DMG=9, MAB=23, Acc=8, Macc=8, Enmity=-2}, {DMG=9, MAB=24, Acc=9, Macc=9, Enmity=-2}, {DMG=10, MAB=25, Acc=10, Macc=10, Enmity=-3},
        {DMG=10, MAB=26, Acc=11, Macc=11, Enmity=-3}, {DMG=10, MAB=27, Acc=12, Macc=12, Enmity=-4}, {DMG=10, MAB=28, Acc=13, Macc=13, Enmity=-4}, {DMG=10, MAB=29, Acc=14, Macc=14, Enmity=-5}, {DMG=11, MAB=30, Acc=15, Macc=15, Enmity=-5}
    }
}
local mpaca_bow = {
    ['A'] = {
        {DMG=1, Ratk=2}, {DMG=2, Ratk=4}, {DMG=3, Ratk=6}, {DMG=4, Ratk=8}, {DMG=5, Ratk=10},
        {DMG=6, Ratk=12}, {DMG=7, Ratk=14}, {DMG=8, Ratk=16}, {DMG=9, Ratk=18}, {DMG=10, Ratk=20},
        {DMG=11, Ratk=22}, {DMG=12, Ratk=24}, {DMG=13, Ratk=26}, {DMG=14, Ratk=28}, {DMG=15, Ratk=30},
        {DMG=15, Ratk=31, Racc=1, Macc=1}, {DMG=16, Ratk=32, Racc=2, Macc=2}, {DMG=16, Ratk=33, Racc=3, Macc=3}, {DMG=17, Ratk=34, Racc=4, Macc=4}, {DMG=17, Ratk=35, Racc=5, Macc=5},
        {DMG=18, Ratk=36, Racc=6, Macc=6, Recycle=1}, {DMG=18, Ratk=37, Racc=7, Macc=7, Recycle=1}, {DMG=18, Ratk=38, Racc=8, Macc=8, Recycle=2}, {DMG=19, Ratk=39, Racc=9, Macc=9, Recycle=2}, {DMG=19, Ratk=40, Racc=10, Macc=10, Recycle=3},
        {DMG=19, Ratk=41, Racc=11, Macc=11, Recycle=3}, {DMG=20, Ratk=42, Racc=12, Macc=12, Recycle=4}, {DMG=20, Ratk=43, Racc=13, Macc=13, Recycle=4}, {DMG=20, Ratk=44, Racc=14, Macc=14, Recycle=5}, {DMG=21, Ratk=45, Racc=15, Macc=15, Recycle=5}
    }
}
local mpaca_staff = {
    ['A'] = {
        {DMG=1, MAB=1}, {DMG=2, MAB=2}, {DMG=3, MAB=3}, {DMG=4, MAB=4}, {DMG=5, MAB=5},
        {DMG=6, MAB=6}, {DMG=7, MAB=7}, {DMG=8, MAB=8}, {DMG=9, MAB=9}, {DMG=10, MAB=10},
        {DMG=11, MAB=11}, {DMG=12, MAB=12}, {DMG=13, MAB=13}, {DMG=14, MAB=14}, {DMG=15, MAB=15},
        {DMG=15, MAB=16, Acc=1, Macc=1}, {DMG=16, MAB=17, Acc=2, Macc=2}, {DMG=16, MAB=18, Acc=3, Macc=3}, {DMG=17, MAB=19, Acc=4, Macc=4}, {DMG=17, MAB=20, Acc=5, Macc=5},
        {DMG=18, MAB=21, Acc=6, Macc=6, INT=1, MND=1}, {DMG=18, MAB=22, Acc=7, Macc=7, INT=1, MND=1}, {DMG=18, MAB=23, Acc=8, Macc=8, INT=2, MND=2}, {DMG=19, MAB=24, Acc=9, Macc=9, INT=2, MND=2}, {DMG=19, MAB=25, Acc=10, Macc=10, INT=3, MND=3},
        {DMG=19, MAB=26, Acc=11, Macc=11, INT=3, MND=3}, {DMG=20, MAB=27, Acc=12, Macc=12, INT=4, MND=4}, {DMG=20, MAB=28, Acc=13, Macc=13, INT=4, MND=4}, {DMG=20, MAB=29, Acc=14, Macc=14, INT=5, MND=5}, {DMG=21, MAB=30, Acc=15, Macc=15, INT=5, MND=5}
    }
}
local hesperiidae = {
    ['A'] = {
        {PetAtk=1}, {PetAtk=2}, {PetAtk=3}, {PetAtk=4}, {PetAtk=5},
        {PetAtk=6}, {PetAtk=7}, {PetAtk=8}, {PetAtk=9}, {PetAtk=10},
        {PetAtk=11}, {PetAtk=12}, {PetAtk=13}, {PetAtk=14}, {PetAtk=15},
        {PetAtk=15, Atk=1}, {PetAtk=15, Atk=2}, {PetAtk=15, Atk=3}, {PetAtk=15, Atk=4}, {PetAtk=15, Atk=5},
        {PetAtk=15, Atk=6, PetAttr=1}, {PetAtk=15, Atk=7, PetAttr=2}, {PetAtk=15, Atk=8, PetAttr=3}, {PetAtk=15, Atk=9, PetAttr=4}, {PetAtk=15, Atk=10, PetAttr=5},
        {PetAtk=15, Atk=11, PetAttr=6}, {PetAtk=15, Atk=12, PetAttr=7}, {PetAtk=15, Atk=13, PetAttr=8}, {PetAtk=15, Atk=14, PetAttr=9}, {PetAtk=15, Atk=15, PetAttr=10}
    }
}
local epitaph = {
    ['A'] = {
        {AvaAcc=1, AvaMacc=1}, {AvaAcc=2, AvaMacc=2}, {AvaAcc=3, AvaMacc=3}, {AvaAcc=4, AvaMacc=4}, {AvaAcc=5, AvaMacc=5},
        {AvaAcc=6, AvaMacc=6}, {AvaAcc=7, AvaMacc=7}, {AvaAcc=8, AvaMacc=8}, {AvaAcc=9, AvaMacc=9}, {AvaAcc=10, AvaMacc=10},
        {AvaAcc=11, AvaMacc=11}, {AvaAcc=12, AvaMacc=12}, {AvaAcc=13, AvaMacc=13}, {AvaAcc=14, AvaMacc=14}, {AvaAcc=15, AvaMacc=15},
        {AvaAcc=16, AvaMacc=16, AvaAttr=1}, {AvaAcc=17, AvaMacc=17, AvaAttr=2}, {AvaAcc=18, AvaMacc=18, AvaAttr=3}, {AvaAcc=19, AvaMacc=19, AvaAttr=4}, {AvaAcc=20, AvaMacc=20, AvaAttr=5},
        {AvaAcc=21, AvaMacc=21, AvaAttr=6, AvaEnmity=1}, {AvaAcc=22, AvaMacc=22, AvaAttr=7, AvaEnmity=2}, {AvaAcc=23, AvaMacc=23, AvaAttr=8, AvaEnmity=3}, {AvaAcc=24, AvaMacc=24, AvaAttr=9, AvaEnmity=4}, {AvaAcc=25, AvaMacc=25, AvaAttr=10, AvaEnmity=5},
        {AvaAcc=26, AvaMacc=26, AvaAttr=11, AvaEnmity=6}, {AvaAcc=27, AvaMacc=27, AvaAttr=12, AvaEnmity=7}, {AvaAcc=28, AvaMacc=28, AvaAttr=13, AvaEnmity=8}, {AvaAcc=29, AvaMacc=29, AvaAttr=14, AvaEnmity=9}, {AvaAcc=30, AvaMacc=30, AvaAttr=15, AvaEnmity=10}
    }
}
local neo_animator = {
    ['A'] = {
        {AutoAcc=1, AutoMacc=1, AutoRacc=1}, {AutoAcc=2, AutoMacc=2, AutoRacc=2}, {AutoAcc=3, AutoMacc=3, AutoRacc=3}, {AutoAcc=4, AutoMacc=4, AutoRacc=4}, {AutoAcc=5, AutoMacc=5, AutoRacc=5},
        {AutoAcc=6, AutoMacc=6, AutoRacc=6}, {AutoAcc=7, AutoMacc=7, AutoRacc=7}, {AutoAcc=8, AutoMacc=8, AutoRacc=8}, {AutoAcc=9, AutoMacc=9, AutoRacc=9}, {AutoAcc=10, AutoMacc=10, AutoRacc=10},
        {AutoAcc=11, AutoMacc=11, AutoRacc=11}, {AutoAcc=12, AutoMacc=12, AutoRacc=12}, {AutoAcc=13, AutoMacc=13, AutoRacc=13}, {AutoAcc=14, AutoMacc=14, AutoRacc=14}, {AutoAcc=15, AutoMacc=15, AutoRacc=15},
        {AutoAcc=16, AutoMacc=16, AutoRacc=16, AutoHP=4}, {AutoAcc=17, AutoMacc=17, AutoRacc=17, AutoHP=8}, {AutoAcc=18, AutoMacc=18, AutoRacc=18, AutoHP=12}, {AutoAcc=19, AutoMacc=19, AutoRacc=19, AutoHP=16}, {AutoAcc=20, AutoMacc=20, AutoRacc=20, AutoHP=20},
        {AutoAcc=21, AutoMacc=21, AutoRacc=21, AutoHP=24, AutoSpecDmg=1}, {AutoAcc=22, AutoMacc=22, AutoRacc=22, AutoHP=28, AutoSpecDmg=1}, {AutoAcc=23, AutoMacc=23, AutoRacc=23, AutoHP=32, AutoSpecDmg=2}, {AutoAcc=24, AutoMacc=24, AutoRacc=24, AutoHP=36, AutoSpecDmg=2}, {AutoAcc=25, AutoMacc=25, AutoRacc=25, AutoHP=40, AutoSpecDmg=3},
        {AutoAcc=26, AutoMacc=26, AutoRacc=26, AutoHP=44, AutoSpecDmg=3}, {AutoAcc=27, AutoMacc=27, AutoRacc=27, AutoHP=48, AutoSpecDmg=4}, {AutoAcc=28, AutoMacc=28, AutoRacc=28, AutoHP=52, AutoSpecDmg=4}, {AutoAcc=29, AutoMacc=29, AutoRacc=29, AutoHP=56, AutoSpecDmg=5}, {AutoAcc=30, AutoMacc=30, AutoRacc=30, AutoHP=60, AutoSpecDmg=5}
    }
}
local coiste_bodhar = {
    ['A'] = {
        {Atk=1}, {Atk=2}, {Atk=3}, {Atk=4}, {Atk=5},
        {Atk=6}, {Atk=7}, {Atk=8}, {Atk=9}, {Atk=10},
        {Atk=11}, {Atk=12}, {Atk=13}, {Atk=14}, {Atk=15},
        {Atk=15, STR=1}, {Atk=15, STR=2}, {Atk=15, STR=3}, {Atk=15, STR=4}, {Atk=15, STR=5},
        {Atk=15, STR=6, DEX=1}, {Atk=15, STR=6, DEX=2}, {Atk=15, STR=7, DEX=3}, {Atk=15, STR=7, DEX=4}, {Atk=15, STR=8, DEX=5},
        {Atk=15, STR=8, DEX=6}, {Atk=15, STR=9, DEX=7}, {Atk=15, STR=9, DEX=8}, {Atk=15, STR=10, DEX=9}, {Atk=15, STR=10, DEX=10}
    }
}
local acrontica = {
    ['A'] = {
        {DEF=1}, {DEF=2}, {DEF=3}, {DEF=4}, {DEF=5},
        {DEF=6}, {DEF=7}, {DEF=8}, {DEF=9}, {DEF=10},
        {DEF=11}, {DEF=12}, {DEF=13}, {DEF=14}, {DEF=15},
        {DEF=16, WaltzPot=1}, {DEF=17, WaltzPot=2}, {DEF=18, WaltzPot=3}, {DEF=19, WaltzPot=4}, {DEF=20, WaltzPot=5},
        {DEF=21, WaltzPot=6, MDB=1}, {DEF=22, WaltzPot=6, MDB=1}, {DEF=23, WaltzPot=7, MDB=2}, {DEF=24, WaltzPot=7, MDB=2}, {DEF=25, WaltzPot=8, MDB=3},
        {DEF=26, WaltzPot=8, MDB=3}, {DEF=27, WaltzPot=9, MDB=4}, {DEF=28, WaltzPot=9, MDB=4}, {DEF=29, WaltzPot=10, MDB=5}, {DEF=30, WaltzPot=10, MDB=5}
    }
}
local beithir_ring = {
    ['A'] = {
        {WSAcc=1}, {WSAcc=2}, {WSAcc=3}, {WSAcc=4}, {WSAcc=5},
        {WSAcc=6}, {WSAcc=7}, {WSAcc=8}, {WSAcc=9}, {WSAcc=10},
        {WSAcc=11}, {WSAcc=12}, {WSAcc=13}, {WSAcc=14}, {WSAcc=15},
        {WSAcc=15, Atk=1}, {WSAcc=15, Atk=2}, {WSAcc=15, Atk=3}, {WSAcc=15, Atk=4}, {WSAcc=15, Atk=5},
        {WSAcc=15, Atk=6, SCDmg=1}, {WSAcc=15, Atk=7, SCDmg=1}, {WSAcc=15, Atk=8, SCDmg=2}, {WSAcc=15, Atk=9, SCDmg=2}, {WSAcc=15, Atk=10, SCDmg=3},
        {WSAcc=15, Atk=11, SCDmg=3}, {WSAcc=15, Atk=12, SCDmg=4}, {WSAcc=15, Atk=13, SCDmg=4}, {WSAcc=15, Atk=14, SCDmg=5}, {WSAcc=15, Atk=15, SCDmg=5}
    }
}
local tsuru = {
    ['A'] = {
        {DEF=1}, {DEF=2}, {DEF=3}, {DEF=4}, {DEF=5},
        {DEF=6}, {DEF=7}, {DEF=8}, {DEF=9}, {DEF=10},
        {DEF=11}, {DEF=12}, {DEF=13}, {DEF=14}, {DEF=15},
        {DEF=16, Daken=1}, {DEF=17, Daken=2}, {DEF=18, Daken=3}, {DEF=19, Daken=4}, {DEF=20, Daken=5},
        {DEF=21, Daken=6, Meva=1}, {DEF=22, Daken=6, Meva=2}, {DEF=23, Daken=7, Meva=3}, {DEF=24, Daken=7, Meva=4}, {DEF=25, Daken=8, Meva=5},
        {DEF=26, Daken=8, Meva=6}, {DEF=27, Daken=9, Meva=7}, {DEF=28, Daken=9, Meva=8}, {DEF=29, Daken=10, Meva=9}, {DEF=30, Daken=10, Meva=10}
    }
}
local schere_earring = {
    ['A'] = {
        {Acc=1}, {Acc=2}, {Acc=3}, {Acc=4}, {Acc=5},
        {Acc=6}, {Acc=7}, {Acc=8}, {Acc=9}, {Acc=10},
        {Acc=11}, {Acc=12}, {Acc=13}, {Acc=14}, {Acc=15},
        {Acc=15, Atk=1}, {Acc=15, Atk=2}, {Acc=15, Atk=3}, {Acc=15, Atk=4}, {Acc=15, Atk=5},
        {Acc=15, Atk=6, STP=1}, {Acc=15, Atk=7, STP=1}, {Acc=15, Atk=8, STP=2}, {Acc=15, Atk=9, STP=2}, {Acc=15, Atk=10, STP=3},
        {Acc=15, Atk=11, STP=3}, {Acc=15, Atk=12, STP=4}, {Acc=15, Atk=13, STP=4}, {Acc=15, Atk=14, STP=5}, {Acc=15, Atk=15, STP=5}
    }
}
local tellen_belt = {
    ['A'] = {
        {Racc=1}, {Racc=2}, {Racc=3}, {Racc=4}, {Racc=5},
        {Racc=6}, {Racc=7}, {Racc=8}, {Racc=9}, {Racc=10},
        {Racc=11}, {Racc=12}, {Racc=13}, {Racc=14}, {Racc=15},
        {Racc=15, Ratk=1}, {Racc=15, Ratk=2}, {Racc=15, Ratk=3}, {Racc=15, Ratk=4}, {Racc=15, Ratk=5},
        {Racc=15, Ratk=6, Enmity=-1}, {Racc=15, Ratk=7, Enmity=-1}, {Racc=15, Ratk=8, Enmity=-2}, {Racc=15, Ratk=9, Enmity=-2}, {Racc=15, Ratk=10, Enmity=-3},
        {Racc=15, Ratk=11, Enmity=-3}, {Racc=15, Ratk=12, Enmity=-4}, {Racc=15, Ratk=13, Enmity=-4}, {Racc=15, Ratk=14, Enmity=-5}, {Racc=15, Ratk=15, Enmity=-5}
    }
}
local obstin_sash = {
    ['A'] = {
        {Macc=1}, {Macc=2}, {Macc=3}, {Macc=4}, {Macc=5},
        {Macc=6}, {Macc=7}, {Macc=8}, {Macc=9}, {Macc=10},
        {Macc=11}, {Macc=12}, {Macc=13}, {Macc=14}, {Macc=15},
        {Macc=15, EnfMagSkill=1}, {Macc=15, EnfMagSkill=2}, {Macc=15, EnfMagSkill=3}, {Macc=15, EnfMagSkill=4}, {Macc=15, EnfMagSkill=5},
        {Macc=15, EnfMagSkill=6, Enmity=-1}, {Macc=15, EnfMagSkill=7, Enmity=-1}, {Macc=15, EnfMagSkill=8, Enmity=-2}, {Macc=15, EnfMagSkill=9, Enmity=-2}, {Macc=15, EnfMagSkill=10, Enmity=-3},
        {Macc=15, EnfMagSkill=11, Enmity=-3}, {Macc=15, EnfMagSkill=12, Enmity=-4}, {Macc=15, EnfMagSkill=13, Enmity=-4}, {Macc=15, EnfMagSkill=14, Enmity=-5}, {Macc=15, EnfMagSkill=15, Enmity=-5}
    }
}

-- ==============================================================================
-- Map the shorthand keys to the full GearInfo string names
-- ==============================================================================
local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    -- Combat Stats
    if rank_data.Damage then full_stats['Damage'] = rank_data.Damage end
    if rank_data.DMG then full_stats['Damage'] = rank_data.DMG end
    if rank_data.Acc then full_stats['Accuracy'] = rank_data.Acc end
    if rank_data.Racc then full_stats['Ranged Accuracy'] = rank_data.Racc end
    if rank_data.Macc then full_stats['Magic Accuracy'] = rank_data.Macc end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.PDL then full_stats['Physical Damage Limit'] = rank_data.PDL end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    if rank_data.Atk then full_stats['Attack'] = rank_data.Atk end
    if rank_data.Ratk then full_stats['Ranged Attack'] = rank_data.Ratk end
    if rank_data.WSD then full_stats['Weapon Skill Damage'] = rank_data.WSD end
    if rank_data.DA then full_stats['Double Attack'] = rank_data.DA end
    if rank_data.MAB then full_stats['Magic Attack Bonus'] = rank_data.MAB end
    if rank_data.MDMG then full_stats['Magic Damage'] = rank_data.MDMG end
    if rank_data.MBD2 then full_stats['Magic Burst Damage II'] = rank_data.MBD2 end
    if rank_data.TPBonus then full_stats['TP Bonus'] = rank_data.TPBonus end
    if rank_data.SB then full_stats['Subtle Blow'] = rank_data.SB end
    if rank_data.DT then full_stats['Damage Taken'] = rank_data.DT end
    if rank_data.Counter then full_stats['Counter'] = rank_data.Counter end
    if rank_data.Regen then full_stats['Regen'] = rank_data.Regen end
    if rank_data.OccRes then full_stats['Occ. inc. resist. to stat. ailments'] = rank_data.OccRes end
    if rank_data.TA then full_stats['Triple Attack'] = rank_data.TA end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.CurePot then full_stats['Cure Potency'] = rank_data.CurePot end
    if rank_data.Enmity then full_stats['Enmity'] = rank_data.Enmity end
    if rank_data.DrainPot then full_stats['Drain and Aspir Potency'] = rank_data.DrainPot end
    if rank_data.SIRD then full_stats['Spell Interruption Rate'] = rank_data.SIRD end
    if rank_data.QA then full_stats['Quadruple Attack'] = rank_data.QA end
    if rank_data.BPDmg then full_stats['Blood Pact Damage'] = rank_data.BPDmg end
    if rank_data.RegenPot then full_stats['Regen Potency'] = rank_data.RegenPot end
    if rank_data.TAdmg then full_stats['Triple Attack Damage'] = rank_data.TAdmg end
    if rank_data.Meva then full_stats['Magic Evasion'] = rank_data.Meva end
    
    -- Specific Edge-Case Additions
    if rank_data.SCDmg then full_stats['Skillchain Damage'] = rank_data.SCDmg end
    if rank_data.SB2 then full_stats['Subtle Blow II'] = rank_data.SB2 end
    if rank_data.Recycle then full_stats['Recycle'] = rank_data.Recycle end
    if rank_data.TrueShot then full_stats['True Shot'] = rank_data.TrueShot end
    if rank_data.Block then full_stats['Chance of successful block'] = rank_data.Block end
    if rank_data.Daken then full_stats['Daken'] = rank_data.Daken end
    if rank_data.Snapshot then full_stats['Snapshot'] = rank_data.Snapshot end
    if rank_data.WSAcc then full_stats['Weapon Skill Accuracy'] = rank_data.WSAcc end
    if rank_data.EnfMagSkill then full_stats['Enfeebling Magic Skill'] = rank_data.EnfMagSkill end
    if rank_data.WaltzPot then full_stats['Waltz Potency'] = rank_data.WaltzPot end
    if rank_data.MDB then full_stats['Magic Def. Bonus'] = rank_data.MDB end
    if rank_data.DEF then full_stats['Defense'] = rank_data.DEF end
    
    -- Base Stats (STR/DEX/VIT/AGI/INT/MND/CHR)
    if rank_data.STR then full_stats['STR'] = rank_data.STR end
    if rank_data.DEX then full_stats['DEX'] = rank_data.DEX end
    if rank_data.VIT then full_stats['VIT'] = rank_data.VIT end
    if rank_data.AGI then full_stats['AGI'] = rank_data.AGI end
    if rank_data.INT then full_stats['INT'] = rank_data.INT end
    if rank_data.MND then full_stats['MND'] = rank_data.MND end
    if rank_data.CHR then full_stats['CHR'] = rank_data.CHR end

    -- Pet & Avatar/Automaton Stats
    if rank_data.PetAtk then full_stats['Pet: Attack'] = rank_data.PetAtk end
    if rank_data.PetAcc then full_stats['Pet: Accuracy'] = rank_data.PetAcc end
    if rank_data.PetMacc then full_stats['Pet: Mag. Acc.'] = rank_data.PetMacc end
    if rank_data.PetDMG then full_stats['Pet: DMG'] = rank_data.PetDMG end
    if rank_data.PetDT then full_stats['Pet: Damage Taken'] = rank_data.PetDT end
    if rank_data.PetAttr then full_stats['Pet: All Attr.'] = rank_data.PetAttr end
    if rank_data.AvaAcc then full_stats['Avatar: Accuracy'] = rank_data.AvaAcc end
    if rank_data.AvaMacc then full_stats['Avatar: Mag. Acc.'] = rank_data.AvaMacc end
    if rank_data.AvaEnmity then full_stats['Avatar: Enmity'] = rank_data.AvaEnmity end
    if rank_data.AvaAttr then full_stats['Avatar: All Attr.'] = rank_data.AvaAttr end
    if rank_data.AutoAcc then full_stats['Automaton: Accuracy'] = rank_data.AutoAcc end
    if rank_data.AutoMacc then full_stats['Automaton: Mag. Acc.'] = rank_data.AutoMacc end
    if rank_data.AutoRacc then full_stats['Automaton: R. Acc.'] = rank_data.AutoRacc end
    if rank_data.AutoHP then full_stats['Automaton: HP'] = rank_data.AutoHP end
    if rank_data.AutoSpecDmg then full_stats['Automaton: Special attack damage'] = rank_data.AutoSpecDmg end

    return full_stats
end

-- ==============================================================================
-- Distribute everything into the final array container dynamically
-- ==============================================================================
for r = 1, 30 do
    ody_tables[r][23761] = { ['A'] = expand_stats(nyame_helm['A'][r]), ['B'] = expand_stats(nyame_helm['B'][r]), ['C'] = expand_stats(nyame_helm['C'][r]), ['D'] = expand_stats(nyame_helm['D'][r]) }
    ody_tables[r][23768] = { ['A'] = expand_stats(nyame_mail['A'][r]), ['B'] = expand_stats(nyame_mail['B'][r]), ['C'] = expand_stats(nyame_mail['C'][r]), ['D'] = expand_stats(nyame_mail['D'][r]) }
    ody_tables[r][23775] = { ['A'] = expand_stats(nyame_hands['A'][r]), ['B'] = expand_stats(nyame_hands['B'][r]), ['C'] = expand_stats(nyame_hands['C'][r]), ['D'] = expand_stats(nyame_hands['D'][r]) }
    ody_tables[r][23782] = { ['A'] = expand_stats(nyame_legs['A'][r]), ['B'] = expand_stats(nyame_legs['B'][r]), ['C'] = expand_stats(nyame_legs['C'][r]), ['D'] = expand_stats(nyame_legs['D'][r]) }
    ody_tables[r][23789] = { ['A'] = expand_stats(nyame_feet['A'][r]), ['B'] = expand_stats(nyame_feet['B'][r]), ['C'] = expand_stats(nyame_feet['C'][r]), ['D'] = expand_stats(nyame_feet['D'][r]) }
    
    ody_tables[r][23755] = { ['A'] = expand_stats(ikenga_hat['A'][r]) }
    ody_tables[r][23762] = { ['A'] = expand_stats(ikenga_body['A'][r]) }
    ody_tables[r][23769] = { ['A'] = expand_stats(ikenga_hands['A'][r]) }
    ody_tables[r][23776] = { ['A'] = expand_stats(ikenga_legs['A'][r]) }
    ody_tables[r][23783] = { ['A'] = expand_stats(ikenga_feet['A'][r]) }
    
    ody_tables[r][23756] = { ['A'] = expand_stats(gleti_mask['A'][r]) }
    ody_tables[r][23763] = { ['A'] = expand_stats(gleti_body['A'][r]) }
    ody_tables[r][23770] = { ['A'] = expand_stats(gleti_hands['A'][r]) }
    ody_tables[r][23777] = { ['A'] = expand_stats(gleti_legs['A'][r]) }
    ody_tables[r][23784] = { ['A'] = expand_stats(gleti_feet['A'][r]) }

    ody_tables[r][23757] = { ['A'] = expand_stats(sakpata_helm['A'][r]) }
    ody_tables[r][23764] = { ['A'] = expand_stats(sakpata_body['A'][r]) }
    ody_tables[r][23771] = { ['A'] = expand_stats(sakpata_hands['A'][r]) }
    ody_tables[r][23778] = { ['A'] = expand_stats(sakpata_legs['A'][r]) }
    ody_tables[r][23785] = { ['A'] = expand_stats(sakpata_feet['A'][r]) }

    ody_tables[r][23759] = { ['A'] = expand_stats(agwu_head['A'][r]) }
    ody_tables[r][23766] = { ['A'] = expand_stats(agwu_body['A'][r]) }
    ody_tables[r][23773] = { ['A'] = expand_stats(agwu_hands['A'][r]) }
    ody_tables[r][23780] = { ['A'] = expand_stats(agwu_legs['A'][r]) }
    ody_tables[r][23787] = { ['A'] = expand_stats(agwu_feet['A'][r]) }

    ody_tables[r][23760] = { ['A'] = expand_stats(bunzi_head['A'][r]) }
    ody_tables[r][23767] = { ['A'] = expand_stats(bunzi_body['A'][r]) }
    ody_tables[r][23774] = { ['A'] = expand_stats(bunzi_hands['A'][r]) }
    ody_tables[r][23781] = { ['A'] = expand_stats(bunzi_legs['A'][r]) }
    ody_tables[r][23788] = { ['A'] = expand_stats(bunzi_feet['A'][r]) }

    ody_tables[r][23758] = { ['A'] = expand_stats(mpaca_head['A'][r]) }
    ody_tables[r][23765] = { ['A'] = expand_stats(mpaca_body['A'][r]) }
    ody_tables[r][23772] = { ['A'] = expand_stats(mpaca_hands['A'][r]) }
    ody_tables[r][23779] = { ['A'] = expand_stats(mpaca_legs['A'][r]) }
    ody_tables[r][23786] = { ['A'] = expand_stats(mpaca_boots['A'][r]) }

    -- Odyssey Weapons and Accessories
    ody_tables[r][21723] = { ['A'] = expand_stats(ikenga_axe['A'][r]) }
    ody_tables[r][21884] = { ['A'] = expand_stats(ikenga_lance['A'][r]) }
    ody_tables[r][21925] = { ['A'] = expand_stats(kunimitsu['A'][r]) }
    ody_tables[r][22150] = { ['A'] = expand_stats(gleti_crossbow['A'][r]) }
    ody_tables[r][21567] = { ['A'] = expand_stats(gleti_knife['A'][r]) }
    ody_tables[r][21979] = { ['A'] = expand_stats(gekkei['A'][r]) }
    
    ody_tables[r][21527] = { ['A'] = expand_stats(sakpata_fists['A'][r]) }
    ody_tables[r][21724] = { ['A'] = expand_stats(agwu_axe['A'][r]) }
    ody_tables[r][21675] = { ['A'] = expand_stats(agwu_claymore['A'][r]) }
    ody_tables[r][21832] = { ['A'] = expand_stats(agwu_scythe['A'][r]) }
    
    ody_tables[r][21780] = { ['A'] = expand_stats(bunzi_chopper['A'][r]) }
    ody_tables[r][22041] = { ['A'] = expand_stats(bunzi_rod['A'][r]) }
    ody_tables[r][22151] = { ['A'] = expand_stats(mpaca_bow['A'][r]) }
    ody_tables[r][22100] = { ['A'] = expand_stats(mpaca_staff['A'][r]) }
    
    ody_tables[r][21430] = { ['A'] = expand_stats(hesperiidae['A'][r]) }
    ody_tables[r][21432] = { ['A'] = expand_stats(epitaph['A'][r]) }
    ody_tables[r][21433] = { ['A'] = expand_stats(neo_animator['A'][r]) }
    ody_tables[r][21431] = { ['A'] = expand_stats(coiste_bodhar['A'][r]) }
    ody_tables[r][21568] = { ['A'] = expand_stats(acrontica['A'][r]) }
    ody_tables[r][26218] = { ['A'] = expand_stats(beithir_ring['A'][r]) }
    ody_tables[r][21926] = { ['A'] = expand_stats(tsuru['A'][r]) }
    ody_tables[r][26116] = { ['A'] = expand_stats(schere_earring['A'][r]) }
    ody_tables[r][26362] = { ['A'] = expand_stats(tellen_belt['A'][r]) }
    ody_tables[r][26363] = { ['A'] = expand_stats(obstin_sash['A'][r]) }
end

return ody_tables