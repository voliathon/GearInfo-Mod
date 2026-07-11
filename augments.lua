-- augments.lua (Master Merger)
-- Loads and merges compartmentalized gear data from the /data/ folder.

local rank_tables = {}
for i = 1, 30 do rank_tables[i] = {} end

-- Add or remove files from this list as you build them!
local data_modules = {
    require('data.odyssey'),
    -- require('data.unity'),
    -- require('data.limbus'),
    -- require('data.jse'),
	-- require('data.divergence'),
}

-- Dynamically merge all loaded modules into the master rank table
for _, module_data in ipairs(data_modules) do
    if type(module_data) == 'table' then
        for current_rank = 1, 30 do
            if module_data[current_rank] then
                for item_id, paths in pairs(module_data[current_rank]) do
                    rank_tables[current_rank][item_id] = paths
                end
            end
        end
    end
end

return rank_tables