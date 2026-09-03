-- GearInfo-Mod for Final Fantasy XI
-- Copyright (c) 2026 Voliathon. All rights reserved.
-- Licensed under custom terms. See LICENSE file in the root directory.
local extdata = require('extdata')
local res = require('resources')
local augments = require('augments')

local debugger = {}

function debugger.validate_stat_keys(stat_dict)
    local valid_stats = {}
    for _, s in ipairs(stat_dict.stat_sequence) do valid_stats[s.stat] = true end
    local flagged_mismatches, error_found = {}, false

    if augments then
        for rank = 1, 30 do
            if augments[rank] then
                for item_id, paths in pairs(augments[rank]) do
                    for path_name, stats in pairs(paths) do
                        for stat_name, stat_val in pairs(stats) do
                            if not valid_stats[stat_name] and not flagged_mismatches[stat_name] then
                                flagged_mismatches[stat_name] = true
                                error_found = true
                                windower.add_to_chat(167, "[GearInfo Debug] Unrecognized Database Key: '" .. tostring(stat_name) .. "'")
                            end
                        end
                    end
                end
            end
        end
    end
    if not error_found then windower.add_to_chat(207, "[GearInfo Debug] Validation Complete: All database stat keys match the UI successfully!") end
end

function debugger.export_gear(mode, stat_dict, current_stats, item_details, ghost_char_stats, ghost_stats)
    local file_path = 'data/logs/export.txt'
    if mode == 'log' then file_path = 'data/logs/export_log.txt' end
    if mode == 'ghost' then file_path = 'data/logs/export_ghost.txt' end
    
    local file = io.open(windower.addon_path .. file_path, 'w')
    if not file then return end
    
    if mode == 'ghost' then
        file:write("=== GHOST CHARACTER STATS (/checkparam) ===\n")
        for k, v in pairs(ghost_char_stats) do file:write("  - " .. k .. ": " .. v .. "\n") end
        file:write("\n=== GHOST GEAR STATS (Calculated) ===\n")
        for _, s in ipairs(stat_dict.stat_sequence) do if ghost_stats[s.stat] and ghost_stats[s.stat] ~= 0 then file:write("  - " .. s.stat .. ": " .. ghost_stats[s.stat] .. "\n") end end
        file:close(); windower.add_to_chat(207, 'GearInfo-Mod: Exported Ghost data to ' .. file_path); return
    end
    
    local equipment = windower.ffxi.get_items().equipment
    for _, slot in ipairs(stat_dict.equip_slots) do
        local item_index = equipment[slot]
        if item_index ~= 0 then
            local item = windower.ffxi.get_items(equipment[slot .. '_bag'], item_index)
            if item and item.id > 0 then
                file:write("Slot: " .. slot .. " | Item: " .. (res.items[item.id] and res.items[item.id].en or "Unknown") .. "\n")
                if mode == 'log' then
                    local detail = item_details[slot]
                    if detail then
                        if detail.missing then file:write("WARNING: MISSING DB DATA\n") end
                        for _, s in ipairs(stat_dict.stat_sequence) do if detail.stats[s.stat] then file:write("  - " .. s.stat .. ": " .. detail.stats[s.stat] .. "\n") end end
                    else file:write("  No tracked stats.\n") end
                else
                    local base_desc = res.item_descriptions[item.id]
                    if base_desc and base_desc.en then file:write("Flat Desc: " .. string.gsub(base_desc.en, "[\r\n]+", " ") .. "\n") end
                    local decoded = extdata.decode(item)
                    if decoded and type(decoded.augments) == 'table' then file:write("Augments: " .. table.concat(decoded.augments, ", ") .. "\n") end
                end
                file:write("----------------------------------------\n")
            end
        end
    end
    file:close()
    windower.add_to_chat(207, 'GearInfo-Mod: Exported to ' .. file_path)
end

return debugger