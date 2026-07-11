-- /data/limbus.lua
local limbus_tables = {}
for i = 1, 30 do limbus_tables[i] = {} end

-- Local expand_stats to ensure this module works completely independently
local function expand_stats(rank_data)
    if not rank_data then return {} end
    local full_stats = {}
    
    if rank_data.Acc then full_stats['Accuracy'] = rank_data.Acc end
    if rank_data.Racc then full_stats['Ranged Accuracy'] = rank_data.Racc end
    if rank_data.Macc then full_stats['Magic Accuracy'] = rank_data.Macc end
    if rank_data.Eva then full_stats['Evasion'] = rank_data.Eva end
    if rank_data.Meva then full_stats['Magic Evasion'] = rank_data.Meva end
    if rank_data.Crit then full_stats['Critical Hit Rate'] = rank_data.Crit end
    
    -- We map these directly to the player accuracy strings for the augment block, 
    -- but because they are on a "Pet:" piece of gear, the pre-processor in GearInfo 
    -- will convert them if they appear in text. However, for explicit augment injection, 
    -- we map them explicitly to the correct string names here:
    if rank_data.PetAcc then full_stats['Pet: Accuracy'] = rank_data.PetAcc end
    if rank_data.PetRacc then full_stats['Pet: Ranged Accuracy'] = rank_data.PetRacc end
    if rank_data.PetMacc then full_stats['Pet: Mag. Acc.'] = rank_data.PetMacc end

    return full_stats
end

-- ==============================================================================
-- GEAR ARRAYS
-- ==============================================================================
local murky_ring = {
    ['A'] = {
        {PetAcc=1, PetRacc=1, PetMacc=1}, 
        {PetAcc=2, PetRacc=2, PetMacc=2}, 
        {PetAcc=3, PetRacc=3, PetMacc=3}, 
        {PetAcc=4, PetRacc=4, PetMacc=4}, 
        {PetAcc=5, PetRacc=5, PetMacc=5},
        {PetAcc=6, PetRacc=6, PetMacc=6}, 
        {PetAcc=7, PetRacc=7, PetMacc=7}, 
        {PetAcc=8, PetRacc=8, PetMacc=8}, 
        {PetAcc=9, PetRacc=9, PetMacc=9}, 
        {PetAcc=10, PetRacc=10, PetMacc=10},
        {PetAcc=11, PetRacc=11, PetMacc=11}, 
        {PetAcc=12, PetRacc=12, PetMacc=12}, 
        {PetAcc=13, PetRacc=13, PetMacc=13}, 
        {PetAcc=14, PetRacc=14, PetMacc=14}, 
        {PetAcc=15, PetRacc=15, PetMacc=15},
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=1, Meva=1}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=2, Meva=2}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=3, Meva=3}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=4, Meva=4}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=5, Meva=5},
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=6, Meva=6}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=7, Meva=7}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=8, Meva=8}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=9, Meva=9}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=10, Meva=10},
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=10, Meva=10, Crit=1}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=10, Meva=10, Crit=2}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=10, Meva=10, Crit=3}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=10, Meva=10, Crit=4}, 
        {PetAcc=15, PetRacc=15, PetMacc=15, Eva=10, Meva=10, Crit=5}
    }
}

-- ==============================================================================
-- DISTRIBUTE INTO ARRAYS (Max Rank 30 for Limbus)
-- ==============================================================================
for r = 1, 30 do
    limbus_tables[r][26234] = { ['A'] = expand_stats(murky_ring['A'][r]) }
end

return limbus_tables
