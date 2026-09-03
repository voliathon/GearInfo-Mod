-- GearInfo-Mod for Final Fantasy XI
-- Copyright (c) 2026 Voliathon. All rights reserved.
-- Licensed under custom terms. See LICENSE file in the root directory.
local ui = {}

local function pad_column(str, desired_width)
    local stripped = string.gsub(str, "\\cs%(%d+,%d+,%d+%)", "")
    stripped = string.gsub(stripped, "\\cr", "")
    local vis_len = string.len(stripped)
    if vis_len < desired_width then return str .. string.rep(" ", desired_width - vis_len) end
    return str
end

function ui.update(displays, state, stat_dict, current_stats, item_details)
    local ui_text = " --- Gear Statistics --- (//gim hide)\n"
    local missing_items = {}
    local has_r15_rema = false
    
    for _, slot in ipairs(stat_dict.equip_slots) do
        local detail = item_details[slot]
        if detail then
            if detail.missing then
                table.insert(missing_items, detail.name .. (detail.rank > 0 and (" (Rank " .. detail.rank .. ")") or ""))
            end
            if detail.id and stat_dict.rema_ids[detail.id] and detail.rank == 15 then has_r15_rema = true end
        end
    end

    if #missing_items > 0 then
        ui_text = ui_text .. " \\cs(255,50,50)[Warning] Missing Database Entry For:\\cr\n"
        for _, item_name in ipairs(missing_items) do ui_text = ui_text .. " \\cs(255,50,50)  - " .. item_name .. "\\cr\n" end
        ui_text = ui_text .. "\n"
    end

    if has_r15_rema then
        ui_text = ui_text .. " \\cs(255,165,0)[Note] R15 Ultimate Weapon Equipped!\\cr\n"
        ui_text = ui_text .. " \\cs(255,165,0)Weapon Skill Damage stat includes the\\cr\n"
        ui_text = ui_text .. " \\cs(255,165,0)boost for your specific REMA WS only.\\cr\n\n"
    elseif #missing_items == 0 then
        ui_text = ui_text .. "\n"
    end
    
    local function get_section_lines(stat_list)
        local lines = {}
        for _, stat in ipairs(stat_list) do
            local gear_val = current_stats[stat] or 0
            local ghost_str = ""
            local arrow_str = ""

            if state.show_ghost then
                local g_gear_val = state.ghost_stats[stat] or 0
                if stat_dict.special_stats_map[stat] then
                    local char_val = state.char_stats[stat_dict.special_stats_map[stat]] or 0
                    local g_char_val = state.ghost_char_stats[stat_dict.special_stats_map[stat]] or 0
                    local char_diff = char_val - g_char_val
                    local gear_diff = gear_val - g_gear_val
                    
                    if char_diff > 0 then arrow_str = " \\cs(0,255,0)▲\\cr"
                    elseif char_diff < 0 then arrow_str = " \\cs(255,50,50)▼\\cr"
                    elseif gear_diff > 0 then arrow_str = " \\cs(0,255,0)▲\\cr"
                    elseif gear_diff < 0 then arrow_str = " \\cs(255,50,50)▼\\cr" end
                    
                    if g_gear_val ~= 0 or g_char_val ~= 0 then ghost_str = string.format(" \\cs(150,150,150)[G: %g (%g)]\\cr", g_char_val, g_gear_val) end
                else
                    if gear_val > g_gear_val then arrow_str = " \\cs(0,255,0)▲\\cr"
                    elseif gear_val < g_gear_val then arrow_str = " \\cs(255,50,50)▼\\cr" end
                    if g_gear_val ~= 0 then ghost_str = string.format(" \\cs(150,150,150)[G: %g]\\cr", g_gear_val) end
                end
            end
            
            if stat_dict.special_stats_map[stat] then
                local char_val = state.char_stats[stat_dict.special_stats_map[stat]] or 0
                if gear_val ~= 0 or char_val ~= 0 or ghost_str ~= "" then table.insert(lines, string.format(" %s: %g \\cs(0,255,0)(%g)\\cr%s%s", stat, char_val, gear_val, ghost_str, arrow_str)) end
            else
                if gear_val ~= 0 or ghost_str ~= "" then table.insert(lines, string.format(" %s: %g%s%s", stat, gear_val, ghost_str, arrow_str)) end
            end
        end
        return lines
    end

    local lines1 = get_section_lines(stat_dict.section1_order)
    local lines2 = get_section_lines(stat_dict.section2_order)
    local lines3 = get_section_lines(stat_dict.section3_order)
    local lines4 = get_section_lines(stat_dict.section4_order)

    if state.settings.layout == 'horizontal' then
        local max_rows = math.max(#lines1, #lines2, #lines3, #lines4)
        if max_rows == 0 then ui_text = ui_text .. " No stats tracked.\n" else
            local col_widths = state.show_ghost and { 45, 52, 52, 38 } or { 32, 36, 36, 25 }
            local active_cols = {}
            if #lines1 > 0 then table.insert(active_cols, {lines=lines1, width=col_widths[1]}) end
            if #lines2 > 0 then table.insert(active_cols, {lines=lines2, width=col_widths[2]}) end
            if #lines3 > 0 then table.insert(active_cols, {lines=lines3, width=col_widths[3]}) end
            if #lines4 > 0 then table.insert(active_cols, {lines=lines4, width=col_widths[4]}) end
            
            for i = 1, max_rows do
                local row_str = ""
                for c_idx, col in ipairs(active_cols) do
                    row_str = row_str .. pad_column(col.lines[i] or "", col.width)
                    if c_idx < #active_cols then row_str = row_str .. " | " end
                end
                ui_text = ui_text .. string.gsub(row_str, " %| $", "") .. "\n"
            end
        end
    else
        local blocks = {}
        if #lines1 > 0 then table.insert(blocks, table.concat(lines1, "\n")) end
        if #lines2 > 0 then table.insert(blocks, table.concat(lines2, "\n")) end
        if #lines3 > 0 then table.insert(blocks, table.concat(lines3, "\n")) end
        if #lines4 > 0 then table.insert(blocks, table.concat(lines4, "\n")) end
        if #blocks > 0 then ui_text = ui_text .. table.concat(blocks, "\n\n") .. "\n" else ui_text = ui_text .. " No stats tracked.\n" end
    end

    displays.main:text(ui_text)

    if state.show_base then
        local base_lines = get_section_lines(stat_dict.base_stat_order)
        local base_text = " --- Base Stats --- (//gi base)\n\n"
        if #base_lines > 0 then base_text = base_text .. table.concat(base_lines, "\n") .. "\n" else base_text = base_text .. " No Base Stats Tracked.\n" end
        displays.base:text(base_text)
        displays.base:show()
    else
        displays.base:hide()
    end
    
    if state.show_log then
        local left_lines, center_lines, right_lines = {}, {}, {}
        local has_missing_data = false
        
        local function populate_lines(slot_list, line_list)
            for _, slot in ipairs(slot_list) do
                local detail = item_details[slot]
                if detail then
                    local header = string.format("[%s] %s", slot, detail.name)
                    if detail.rank and detail.rank > 0 then
                        header = header .. string.format(" (Rank %d", detail.rank)
                        if detail.path then header = header .. " Path " .. detail.path end
                        header = header .. ")"
                    end
                    if detail.missing then
                        header = "\\cs(255,50,50)" .. header .. " *MISSING DATA*\\cr"
                        has_missing_data = true
                    end
                    table.insert(line_list, header .. ":")
                    for _, s in ipairs(stat_dict.stat_sequence) do
                        if detail.stats[s.stat] then table.insert(line_list, string.format("    - %s: %d", s.stat, detail.stats[s.stat])) end
                    end
                    table.insert(line_list, "")
                end
            end
        end

        populate_lines(stat_dict.equip_slots_left, left_lines)
        populate_lines(stat_dict.equip_slots_center, center_lines)
        populate_lines(stat_dict.equip_slots_right, right_lines)

        local max_w = 40
        local all_lines = {}
        for _, l in ipairs(left_lines) do table.insert(all_lines, l) end
        for _, l in ipairs(center_lines) do table.insert(all_lines, l) end
        for _, l in ipairs(right_lines) do table.insert(all_lines, l) end
        
        for _, line in ipairs(all_lines) do
            local vis_line = string.gsub(string.gsub(line, "\\cs%(%d+,%d+,%d+%)", ""), "\\cr", "")
            if string.len(vis_line) > max_w then max_w = string.len(vis_line) + 2 end
        end

        local log_text = has_missing_data and " \\cs(255,50,50)WARNING: Items highlighted in RED have missing augment data in your database.\\cr\n\n" or ""
        log_text = log_text .. pad_column(" --- Log (Left) ---", max_w) .. " | " .. pad_column("--- Log (Center) ---", max_w) .. " | --- Log (Right) ---\n"

        local max_lines = math.max(#left_lines, #center_lines, #right_lines)
        for i = 1, max_lines do log_text = log_text .. pad_column(left_lines[i] or "", max_w) .. " | " .. pad_column(center_lines[i] or "", max_w) .. " | " .. (right_lines[i] or "") .. "\n" end
        displays.log:text(log_text)
    end
end

return ui