-- /data/rema.lua
local rema_tables = {}
for i = 1, 30 do rema_tables[i] = {} end

-- Local expand_stats to ensure this module works completely independently
local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    -- Base & Standard Combat Stats
    if rank_data.DMG then full_stats['Damage'] = rank_data.DMG end
    if rank_data.Acc then full_stats['Accuracy'] = rank_data.Acc end
    if rank_data.Macc then full_stats['Magic Accuracy'] = rank_data.Macc end
    if rank_data.Racc then full_stats['Ranged Accuracy'] = rank_data.Racc end
    if rank_data.HP then full_stats['HP'] = rank_data.HP end
    if rank_data.MP then full_stats['MP'] = rank_data.MP end
    if rank_data.STR then full_stats['STR'] = rank_data.STR end
    if rank_data.DEX then full_stats['DEX'] = rank_data.DEX end
    if rank_data.VIT then full_stats['VIT'] = rank_data.VIT end
    if rank_data.AGI then full_stats['AGI'] = rank_data.AGI end
    if rank_data.INT then full_stats['INT'] = rank_data.INT end
    if rank_data.MND then full_stats['MND'] = rank_data.MND end
    if rank_data.CHR then full_stats['CHR'] = rank_data.CHR end

    -- Specialized Traits
    if rank_data.WSD then full_stats['Weapon Skill Damage'] = rank_data.WSD end
    if rank_data.CounterDmg then full_stats['Counter Damage'] = rank_data.CounterDmg end
    if rank_data.TADmg then full_stats['Triple Attack Damage'] = rank_data.TADmg end
    if rank_data.BlockRate then full_stats['Chance of successful block'] = rank_data.BlockRate end
    if rank_data.CritDmg then full_stats['Critical hit damage'] = rank_data.CritDmg end
    if rank_data.DADmg then full_stats['Double Attack Damage'] = rank_data.DADmg end
    if rank_data.DrainPot then full_stats['Drain potency'] = rank_data.DrainPot end
    if rank_data.JumpDmg then full_stats['All Jumps damage'] = rank_data.JumpDmg end
    if rank_data.NinCast then full_stats['Ninjutsu casting time'] = rank_data.NinCast end
    if rank_data.SCDmg then full_stats['Skillchain Damage'] = rank_data.SCDmg end
    if rank_data.CurePot then full_stats['Cure Potency'] = rank_data.CurePot end
    if rank_data.Enmity then full_stats['Enmity'] = rank_data.Enmity end
    if rank_data.CritRate then full_stats['Critical Hit Rate'] = rank_data.CritRate end
    if rank_data.STP then full_stats['Store TP'] = rank_data.STP end
    if rank_data.DaganPot then full_stats['Dagan potency'] = rank_data.DaganPot end
    if rank_data.MyrkrPot then full_stats['Myrkr potency'] = rank_data.MyrkrPot end

    -- Pet/Avatar Specific Stats
    if rank_data.PetDA then full_stats['Pet: Double Attack'] = rank_data.PetDA end
    if rank_data.AvaAcc then full_stats['Avatar: Accuracy'] = rank_data.AvaAcc end
    if rank_data.AvaMacc then full_stats['Avatar: Mag. Acc.'] = rank_data.AvaMacc end

    return full_stats
end

-- ==============================================================================
-- RELIC WEAPONS (Rank 15)
-- ==============================================================================
rema_tables[15][20509] = { ['A'] = expand_stats({DMG=24, WSD=20, CounterDmg=30}) } -- Spharai
rema_tables[15][20583] = { ['A'] = expand_stats({DMG=7, WSD=20, TADmg=10}) }       -- Mandau
rema_tables[15][20685] = { ['A'] = expand_stats({DMG=9, WSD=20, BlockRate=10}) }   -- Excalibur
rema_tables[15][21683] = { ['A'] = expand_stats({DMG=17, WSD=20, CritDmg=5}) }     -- Ragnarok
rema_tables[15][21750] = { ['A'] = expand_stats({DMG=12, WSD=20, PetDA=5}) }       -- Guttler
rema_tables[15][21756] = { ['A'] = expand_stats({DMG=20, WSD=20, DADmg=10}) }      -- Bravura
rema_tables[15][21808] = { ['A'] = expand_stats({DMG=21, WSD=20, DrainPot=10}) }   -- Apocalypse
rema_tables[15][21857] = { ['A'] = expand_stats({DMG=20, WSD=20, JumpDmg=15}) }    -- Gungnir
rema_tables[15][21906] = { ['A'] = expand_stats({DMG=8, WSD=20, NinCast=-20}) }    -- Kikoku
rema_tables[15][21954] = { ['A'] = expand_stats({DMG=18, WSD=20, SCDmg=5}) }       -- Amanomurakumo
rema_tables[15][21077] = { ['A'] = expand_stats({DMG=12, WSD=20, CurePot=30}) }    -- Mjollnir
rema_tables[15][22060] = { ['A'] = expand_stats({DMG=16, WSD=20, Enmity=-20}) }    -- Claustrum
rema_tables[15][22129] = { ['A'] = expand_stats({DMG=7, WSD=20, CritRate=5}) }     -- Yoichinoyumi
rema_tables[15][22140] = { ['A'] = expand_stats({DMG=12, WSD=20, STP=5}) }         -- Annihilator

-- ==============================================================================
-- EMPYREAN WEAPONS (Rank 15)
-- ==============================================================================
rema_tables[15][20512] = { ['A'] = expand_stats({DMG=20, WSD=10, STR=20, DEX=20}) }                     -- Verethragna
rema_tables[15][20587] = { ['A'] = expand_stats({DMG=4, WSD=10, DEX=20, AGI=20}) }                      -- Twashtar
rema_tables[15][20689] = { ['A'] = expand_stats({DMG=5, WSD=10, DEX=20, MND=20}) }                      -- Almace
rema_tables[15][21684] = { ['A'] = expand_stats({DMG=11, WSD=10, STR=20, VIT=20}) }                     -- Caladbolg
rema_tables[15][21752] = { ['A'] = expand_stats({DMG=6, WSD=10, STR=15, DEX=15, MND=15, CHR=15}) }      -- Farsha
rema_tables[15][21758] = { ['A'] = expand_stats({DMG=12, WSD=10, STR=20, DEX=20}) }                     -- Ukonvasara
rema_tables[15][21810] = { ['A'] = expand_stats({DMG=13, WSD=10, STR=15, DEX=15, INT=15, MND=15}) }     -- Redemption
rema_tables[15][21859] = { ['A'] = expand_stats({DMG=12, WSD=10, STR=20, VIT=20}) }                     -- Rhongomiant
rema_tables[15][21908] = { ['A'] = expand_stats({DMG=5, WSD=10, DEX=20, AGI=20}) }                      -- Kannagi
rema_tables[15][21956] = { ['A'] = expand_stats({DMG=11, WSD=10, STR=20, AGI=20}) }                     -- Masamune
rema_tables[15][21079] = { ['A'] = expand_stats({DMG=7, DaganPot=10, HP=20, MP=20, MND=20}) }           -- Gambanteinn
rema_tables[15][22064] = { ['A'] = expand_stats({DMG=10, MyrkrPot=10, MP=30}) }                         -- Hvergelmir
rema_tables[15][22130] = { ['A'] = expand_stats({DMG=7, WSD=10, STR=20, DEX=20}) }                      -- Gandiva
rema_tables[15][22142] = { ['A'] = expand_stats({DMG=8, WSD=10, STR=20, AGI=20}) }                      -- Armageddon

-- ==============================================================================
-- AEONIC WEAPONS (Rank 15)
-- ==============================================================================
rema_tables[15][20515] = { ['A'] = expand_stats({DMG=24, WSD=10, Acc=30, Macc=30}) }       -- Godhands
rema_tables[15][20594] = { ['A'] = expand_stats({DMG=6, WSD=10, Acc=30, Macc=30}) }        -- Aeneas
rema_tables[15][20695] = { ['A'] = expand_stats({DMG=8, WSD=10, Acc=30, Macc=30}) }        -- Sequence
rema_tables[15][21694] = { ['A'] = expand_stats({DMG=16, WSD=10, Acc=30, Macc=30}) }       -- Lionheart
rema_tables[15][21753] = { ['A'] = expand_stats({DMG=9, WSD=10, Acc=30, Macc=30}) }        -- Tri-edge
rema_tables[15][20843] = { ['A'] = expand_stats({DMG=16, WSD=10, Acc=30, Macc=30}) }       -- Chango
rema_tables[15][20890] = { ['A'] = expand_stats({DMG=17, WSD=10, Acc=30, Macc=30}) }       -- Anguta
rema_tables[15][20935] = { ['A'] = expand_stats({DMG=15, WSD=10, Acc=30, Macc=30}) }       -- Trishula
rema_tables[15][20977] = { ['A'] = expand_stats({DMG=7, WSD=10, Acc=30, Macc=30}) }        -- Heishi Shorinken
rema_tables[15][21025] = { ['A'] = expand_stats({DMG=15, WSD=10, Acc=30, Macc=30}) }       -- Dojikiri Yasutsuna
rema_tables[15][21082] = { ['A'] = expand_stats({DMG=8, WSD=10, Acc=30, Macc=30}) }        -- Tishtrya
rema_tables[15][21147] = { ['A'] = expand_stats({DMG=8, WSD=10, Acc=30, Macc=30}) }        -- Khatvanga
rema_tables[15][22131] = { ['A'] = expand_stats({DMG=7, WSD=10, Racc=30, Macc=30}) }       -- Fail-Not
rema_tables[15][22143] = { ['A'] = expand_stats({DMG=9, WSD=10, Racc=30, Macc=30}) }       -- Fomalhaut

-- ==============================================================================
-- MYTHIC / ERGON WEAPONS (Rank 15)
-- ==============================================================================
rema_tables[15][21757] = { ['A'] = expand_stats({DMG=32, WSD=15, Acc=30, Macc=30}) }       -- Conqueror
rema_tables[15][20510] = { ['A'] = expand_stats({DMG=29, WSD=15, Acc=30, Macc=30}) }       -- Glanzfaust
rema_tables[15][21078] = { ['A'] = expand_stats({DMG=17, WSD=15, Acc=30, Macc=30}) }       -- Yagrush
rema_tables[15][22062] = { ['A'] = expand_stats({DMG=26, WSD=15, Acc=30, Macc=30}) }       -- Laevateinn
rema_tables[15][20686] = { ['A'] = expand_stats({DMG=17, WSD=15, Acc=30, Macc=30}) }       -- Murgleis
rema_tables[15][20585] = { ['A'] = expand_stats({DMG=15, WSD=15, Acc=30, Macc=30}) }       -- Vajra
rema_tables[15][20687] = { ['A'] = expand_stats({DMG=20, Enmity=100, Acc=30, Macc=30}) }   -- Burtgang
rema_tables[15][21809] = { ['A'] = expand_stats({DMG=34, WSD=15, Acc=30, Macc=30}) }       -- Liberator
rema_tables[15][21751] = { ['A'] = expand_stats({DMG=20, WSD=15, Acc=30, Macc=30}) }       -- Aymur
rema_tables[15][20586] = { ['A'] = expand_stats({DMG=14, WSD=15, Acc=30, Macc=30}) }       -- Carnwenhan
rema_tables[15][22139] = { ['A'] = expand_stats({DMG=5, WSD=15, Racc=30, Macc=30}) }       -- Gastraphetes
rema_tables[15][21955] = { ['A'] = expand_stats({DMG=29, WSD=15, Acc=30, Macc=30}) }       -- Kogarasumaru
rema_tables[15][21907] = { ['A'] = expand_stats({DMG=14, WSD=15, Acc=30, Macc=30}) }       -- Nagi
rema_tables[15][21858] = { ['A'] = expand_stats({DMG=32, WSD=15, Acc=30, Macc=30}) }       -- Ryunohige
rema_tables[15][22063] = { ['A'] = expand_stats({DMG=26, WSD=15, AvaAcc=30, AvaMacc=30}) } -- Nirvana
rema_tables[15][20688] = { ['A'] = expand_stats({DMG=18, WSD=15, Acc=30, Macc=30}) }       -- Tizona
rema_tables[15][22141] = { ['A'] = expand_stats({DMG=6, WSD=15, Racc=30, Macc=30}) }       -- Death Penalty
rema_tables[15][20511] = { ['A'] = expand_stats({DMG=24, WSD=15, Acc=30, Macc=30}) }       -- Kenkonken
rema_tables[15][20584] = { ['A'] = expand_stats({DMG=16, WSD=15, Acc=30, Macc=30}) }       -- Terpsichore
rema_tables[15][22061] = { ['A'] = expand_stats({DMG=26, WSD=15, Acc=30, Macc=30}) }       -- Tupsimati
rema_tables[15][21080] = { ['A'] = expand_stats({DMG=22, WSD=15, Acc=30, Macc=30}) }       -- Idris
rema_tables[15][21685] = { ['A'] = expand_stats({DMG=39, WSD=15, Acc=30, Macc=30}) }       -- Epeolatry

return rema_tables