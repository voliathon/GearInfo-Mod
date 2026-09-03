-- GearInfo-Mod for Final Fantasy XI
-- Copyright (c) 2026 Voliathon. All rights reserved.
-- Licensed under custom terms. See LICENSE file in the root directory.
local extdata = require('extdata')
local res = require('resources')
local augments = require('augments')
local hidden_stats = require('data.misc')

local parser = {}

function parser.calculate_gear_stats(stat_dict)
    local totals = {}
    local item_details = {} 
    for _, s in ipairs(stat_dict.stat_sequence) do totals[s.stat] = 0 end
    local equipment = windower.ffxi.get_items().equipment

    for _, slot_name in ipairs(stat_dict.equip_slots) do
        local item_index = equipment[slot_name]
        if item_index ~= 0 then
            local bag_id = equipment[slot_name .. '_bag']
            local item = windower.ffxi.get_items(bag_id, item_index)

            if item and item.id > 0 then
                local strings_to_parse = {}
                local current_item_stats = {}
                local item_name = "Unknown"

                local base_item = res.items[item.id]
                local base_desc = res.item_descriptions[item.id]
                if base_item then item_name = base_item.en end
                
                if base_desc and base_desc.en then
                    local flat_desc = string.gsub(base_desc.en, "[\r\n]+", " ")
                    table.insert(strings_to_parse, flat_desc)
                end

                local decoded_data = extdata.decode(item)
                local missing_data = false
                local item_rank = 0
                local item_path = 'A'

                if augments and decoded_data then
                    if decoded_data.rank and type(decoded_data.rank) == 'number' then item_rank = decoded_data.rank end
                    if decoded_data.path then
                        local path_map = {[0]='A', [1]='B', [2]='C', [3]='D'}
                        if type(decoded_data.path) == 'number' then item_path = path_map[decoded_data.path] or 'A'
                        elseif type(decoded_data.path) == 'string' then item_path = string.match(string.upper(decoded_data.path), "([A-D])") or 'A' end
                    end

                    if type(decoded_data.augments) == 'table' then
                        for _, aug in ipairs(decoded_data.augments) do
                            local aug_lower = aug:lower()
                            if item_rank == 0 then
                                local rank_match = string.match(aug_lower, "rank[^%d]*(%d+)")
                                if rank_match then item_rank = tonumber(rank_match) end
                            end
                            local path_match = string.match(aug_lower, "path[^a-d]*([a-d])") or string.match(aug_lower, "type[^a-d]*([a-d])")
                            if path_match then item_path = string.upper(path_match) end
                        end
                    end
                end

                local has_db_entry = false
                local db_stats_to_add = nil
                
                if item_rank > 0 and augments and augments[item_rank] and augments[item_rank][item.id] then
                    local targeted_rank_table = augments[item_rank]
                    local stat_source = targeted_rank_table[item.id]
                    
                    if stat_source[item_path] then db_stats_to_add = stat_source[item_path]
                    elseif stat_source['A'] then db_stats_to_add = stat_source['A'] end
                    
                    if db_stats_to_add then has_db_entry = true end
                elseif item_rank > 0 then
                    missing_data = true
                end

                if decoded_data and type(decoded_data.augments) == 'table' and not has_db_entry then
                    for _, aug in ipairs(decoded_data.augments) do table.insert(strings_to_parse, aug) end
                end

                for _, text_line in ipairs(strings_to_parse) do
                    local current_line = text_line:lower() 
                    local player_line = current_line
                    
                    player_line = player_line:gsub("weapon skill: attack bonus.-upgrades", "")
                    player_line = player_line:gsub("weapon skill %a%a%a %+%d+%%?", "")
                    player_line = player_line:gsub("converts.-damage taken.-mp", "")
                    
                    local comp_line = ""
                    local split_idx = current_line:find("pet:") or current_line:find("automaton:") or current_line:find("avatar:")
                    if split_idx then
                        player_line = current_line:sub(1, split_idx - 1)
                        comp_line = current_line:sub(split_idx)
                    end
                    
                    if comp_line:find("pet:") then
                        comp_line = comp_line:gsub("pet:%s*", "")
                        comp_line = comp_line:gsub("magic evasion", "PET_MEVA")
                        comp_line = comp_line:gsub("mag%.%s*eva%.", "PET_MEVA")
                        comp_line = comp_line:gsub("ranged accuracy", "PET_RACC")
                        comp_line = comp_line:gsub("ranged acc%.", "PET_RACC")
                        comp_line = comp_line:gsub("rng%.%s*acc%.", "PET_RACC")
                        comp_line = comp_line:gsub("magic accuracy", "PET_MACC")
                        comp_line = comp_line:gsub("magic acc%.", "PET_MACC")
                        comp_line = comp_line:gsub("ranged attack", "PET_RATK")
                        comp_line = comp_line:gsub("rng%.%s*atk%.", "PET_RATK")
                        comp_line = comp_line:gsub("accuracy", "PET_ACC")
                        comp_line = comp_line:gsub("acc%.", "PET_ACC")
                        comp_line = comp_line:gsub("attack", "PET_ATK")
                        comp_line = comp_line:gsub("atk%.", "PET_ATK")
                        comp_line = comp_line:gsub("evasion", "PET_EVA")
                        comp_line = comp_line:gsub("eva%.", "PET_EVA")
                        comp_line = comp_line:gsub("damage taken", "PET_DT")
                        comp_line = comp_line:gsub("dmg:", "PET_DMG")
                        comp_line = comp_line:gsub("all attr%.", "PET_ATTR")
                        
                        comp_line = comp_line:gsub("PET_MEVA", "pet: magic evasion")
                        comp_line = comp_line:gsub("PET_RACC", "pet: ranged accuracy")
                        comp_line = comp_line:gsub("PET_MACC", "pet: magic accuracy")
                        comp_line = comp_line:gsub("PET_RATK", "pet: ranged attack")
                        comp_line = comp_line:gsub("PET_ACC", "pet: accuracy")
                        comp_line = comp_line:gsub("PET_ATK", "pet: attack")
                        comp_line = comp_line:gsub("PET_EVA", "pet: evasion")
                        comp_line = comp_line:gsub("PET_DT", "pet: damage taken")
                        comp_line = comp_line:gsub("PET_DMG", "pet: dmg:")
                        comp_line = comp_line:gsub("PET_ATTR", "pet: all attr.")
                    elseif comp_line:find("automaton:") then
                        comp_line = comp_line:gsub("automaton:%s*", "")
                        comp_line = comp_line:gsub("magic accuracy", "AUTO_MACC")
                        comp_line = comp_line:gsub("mag%.%s*acc%.", "AUTO_MACC")
                        comp_line = comp_line:gsub("ranged accuracy", "AUTO_RACC")
                        comp_line = comp_line:gsub("r%.%s*acc%.", "AUTO_RACC")
                        comp_line = comp_line:gsub("rng%.%s*acc%.", "AUTO_RACC")
                        comp_line = comp_line:gsub("accuracy", "AUTO_ACC")
                        comp_line = comp_line:gsub("acc%.", "AUTO_ACC")
                        comp_line = comp_line:gsub("AUTO_MACC", "automaton: magic accuracy")
                        comp_line = comp_line:gsub("AUTO_RACC", "automaton: r. acc.")
                        comp_line = comp_line:gsub("AUTO_ACC", "automaton: accuracy")
                    elseif comp_line:find("avatar:") then
                        comp_line = comp_line:gsub("avatar:%s*", "")
                        comp_line = comp_line:gsub("magic accuracy", "AVA_MACC")
                        comp_line = comp_line:gsub("mag%.%s*acc%.", "AVA_MACC")
                        comp_line = comp_line:gsub("accuracy", "AVA_ACC")
                        comp_line = comp_line:gsub("acc%.", "AVA_ACC")
                        comp_line = comp_line:gsub("AVA_MACC", "avatar: magic accuracy")
                        comp_line = comp_line:gsub("AVA_ACC", "avatar: accuracy")
                    end

                    current_line = player_line .. " " .. comp_line
                    if item.id == 26234 then 
                        current_line = string.gsub(current_line, "ranged accuracy", "pet: ranged accuracy")
                        current_line = string.gsub(current_line, "magic accuracy", "pet: magic accuracy")
                    end
                    
                    for _, stat_data in ipairs(stat_dict.parse_sequence) do
                        for _, pattern in ipairs(stat_data.patterns) do
                            local match = string.match(current_line, pattern)
                            if match then
                                local val = tonumber((string.gsub(match, "%s+", "")))
                                if val then
                                    totals[stat_data.stat] = totals[stat_data.stat] + val
                                    current_item_stats[stat_data.stat] = (current_item_stats[stat_data.stat] or 0) + val
                                    current_line = string.gsub(current_line, pattern, "", 1)
                                end
                            end
                        end
                    end
                end
                
                if has_db_entry and db_stats_to_add then
                    for static_stat, static_val in pairs(db_stats_to_add) do
                        if type(static_val) == 'number' and totals[static_stat] ~= nil then
                            totals[static_stat] = totals[static_stat] + static_val
                            current_item_stats[static_stat] = (current_item_stats[static_stat] or 0) + static_val
                        end
                    end
                end
                
                if hidden_stats and hidden_stats[item.id] then
                    for h_stat, h_val in pairs(hidden_stats[item.id]) do
                        if type(h_val) == 'number' and totals[h_stat] ~= nil then
                            totals[h_stat] = totals[h_stat] + h_val
                            current_item_stats[h_stat] = (current_item_stats[h_stat] or 0) + h_val
                        end
                    end
                end
                
                if next(current_item_stats) ~= nil or missing_data then
                    item_details[slot_name] = { id = item.id, name = item_name, stats = current_item_stats, rank = item_rank, path = item_path, missing = missing_data }
                end
            end
        end
    end
    return totals, item_details
end

return parser