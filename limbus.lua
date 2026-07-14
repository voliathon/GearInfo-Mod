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
        {Acc=1, Racc=1, Macc=1}, 
        {Acc=2, Racc=2, Macc=2}, 
        {Acc=3, Racc=3, Macc=3}, 
        {Acc=4, Racc=4, Macc=4}, 
        {Acc=5, Racc=5, Macc=5},
        {Acc=6, Racc=6, Macc=6}, 
        {Acc=7, Racc=7, Macc=7}, 
        {Acc=8, Racc=8, Macc=8}, 
        {Acc=9, Racc=9, Macc=9}, 
        {Acc=10, Racc=10, Macc=10},
        {Acc=11, Racc=11, Macc=11}, 
        {Acc=12, Racc=12, Macc=12}, 
        {Acc=13, Racc=13, Macc=13}, 
        {Acc=14, Racc=14, Macc=14}, 
        {Acc=15, Racc=15, Macc=15},
        {Acc=15, Racc=15, Macc=15, Eva=1, Meva=1}, 
        {Acc=15, Racc=15, Macc=15, Eva=2, Meva=2}, 
        {Acc=15, Racc=15, Macc=15, Eva=3, Meva=3}, 
        {Acc=15, Racc=15, Macc=15, Eva=4, Meva=4}, 
        {Acc=15, Racc=15, Macc=15, Eva=5, Meva=5},
        {Acc=15, Racc=15, Macc=15, Eva=6, Meva=6}, 
        {Acc=15, Racc=15, Macc=15, Eva=7, Meva=7}, 
        {Acc=15, Racc=15, Macc=15, Eva=8, Meva=8}, 
        {Acc=15, Racc=15, Macc=15, Eva=9, Meva=9}, 
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10},
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=1}, 
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=2}, 
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=3}, 
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=4}, 
        {Acc=15, Racc=15, Macc=15, Eva=10, Meva=10, Crit=5}
    }
}

-- ==============================================================================
-- DISTRIBUTE INTO ARRAYS (Max Rank 30 for Limbus)
-- ==============================================================================
for r = 1, 30 do
    limbus_tables[r][26234] = { ['A'] = expand_stats(murky_ring['A'][r]) }
end

return limbus_tables