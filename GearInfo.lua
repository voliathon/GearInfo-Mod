-- The original GearInfo was probably copyright by someone.  
-- I redid the entire addon so @Copyright Voliathon 2026
_addon.name = 'GearInfo'
_addon.author = 'Voliathon'
_addon.version = '1.0.0'
_addon.commands = {'gi', 'gearinfo'}

local extdata = require('extdata')
local res = require('resources')
local config = require('config')
local texts = require('texts')

-- Load our custom exceptions file
local exceptions = require('exceptions')

-- ==============================================================================
-- 1. Setup UI & Per-Character Persistence
-- ==============================================================================
local default_settings = {
    pos = { x = 200, y = 200 },
    bg = { alpha = 150, red = 0, green = 0, blue = 0, visible = true },
    flags = { draggable = true, bold = true },
    text = { size = 10, font = 'Consolas', alpha = 255, red = 255, green = 255, blue = 255 },
    layout = 'vertical'
}

local default_log_settings = {
    pos = { x = 350, y = 200 },
    bg = { alpha = 150, red = 0, green = 0, blue = 50, visible = true },
    flags = { draggable = true, bold = true },
    text = { size = 9, font = 'Consolas', alpha = 255, red = 200, green = 200, blue = 200 }
}

local settings = config.load('data\\settings.xml', default_settings)
local log_settings = config.load('data\\log_settings.xml', default_log_settings)

local display = texts.new(settings)
local log_display = texts.new(log_settings)

local show_log = false
local equip_update_timer = 0

-- ==============================================================================
-- 2. Ordered Stat Sequence & UI Layout Groups (Alphabetized)
-- ==============================================================================
local stat_sequence = {
    { stat = 'Accuracy', patterns = {'["\']?accuracy["\']?%s*%+?(%d+)', '["\']?acc%.["\']?%s*%+?(%d+)'} }, 
    { stat = 'Attack', patterns = {'["\']?attack["\']?%s*%+?(%d+)', '["\']?atk%.["\']?%s*%+?(%d+)'} },
    { stat = 'Blood Pact Damage', patterns = {'["\']?blood pact["\']? damage%s*%+?(%d+)', '["\']?blood pact dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Blue Magic Spellcasting Time', patterns = {'["\']?blue magic spellcasting time["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Conserve MP', patterns = {'["\']?conserve mp["\']?%s*%+?(%d+)'} },
    { stat = 'Counter', patterns = {'["\']?counter["\']?%s*%+?(%d+)'} },
    { stat = 'Critical Hit Rate', patterns = {'["\']?critical hit rate["\']?%s*%+?(%d+)%%?', '["\']?crit%.%s*hit rate["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Cure Potency', patterns = {'["\']?cure["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Cure Potency II', patterns = {'["\']?cure["\']? potency ii%s*%+?(%d+)%%?'} },
    { stat = 'Cure Spellcasting Time', patterns = {'["\']?cure["\']? spellcasting time%s*%-?(%d+)%%?'} },
    { stat = 'Cursna', patterns = {'["\']?cursna["\']?%s*%+?(%d+)'} },
    { stat = 'Damage Taken', patterns = {'["\']?damage taken["\']?%s*%-?(%d+)%%?', '["\']?dt["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Defense', patterns = {'["\']?defense["\']?%s*%+?(%d+)', '["\']?def%.["\']?%s*%+?(%d+)', '["\']?def["\']?%s*:%s*(%d+)', '["\']?def["\']?%s*%+?(%d+)'} }, 
    { stat = 'Double Attack', patterns = {'["\']?double attack["\']?%s*%+?(%d+)%%?', '["\']?dbl%.%s*atk%.["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Double Shot', patterns = {'["\']?double shot["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Double Shot Damage', patterns = {'["\']?double shot["\']? damage%s*%+?(%d+)', '["\']?double shot dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Drain and Aspir Potency', patterns = {'["\']?drain["\']? and ["\']?aspir["\']? potency%s*%+?(%d+)'} },
    { stat = 'Dual Wield', patterns = {'["\']?dual wield["\']?%s*%+?(%d+)'} },
    { stat = 'Elemental Magic Recast Delay', patterns = {'["\']?elemental magic recast delay["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Enemy Critical Hit Rate', patterns = {'["\']?enemy critical hit rate["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Enfeebling Magic Effect', patterns = {'["\']?enfeebling magic effect["\']?%s*%+?(%d+)'} },
    { stat = 'Enhancing Magic Duration', patterns = {'["\']?enhancing magic effect duration["\']?%s*%+?(%d+)%%?', '["\']?enhancing magic duration["\']?%s*%+?(%d+)%%?', '["\']?enh%. mag%. eff%. dur%.["\']?%s*%+?(%d+)'} },
    { stat = 'Enmity', patterns = {'["\']?enmity["\']?%s*([%+%-]%s*%d+)'} }, 
    { stat = 'Evasion', patterns = {'["\']?evasion["\']?%s*%+?(%d+)', '["\']?eva%.["\']?%s*%+?(%d+)'} },
    { stat = 'Fast Cast', patterns = {'["\']?fast cast["\']?%s*%+?(%d+)%%?'} },
    { stat = 'HP', patterns = {'["\']?hp["\']?%s*%+?(%d+)'} },
    { stat = 'Haste', patterns = {'["\']?haste["\']?%s*%+?(%d+)%%?'} },
    { stat = 'MP', patterns = {'["\']?mp["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Accuracy', patterns = {'["\']?mag%.%s*acc%.?["\']?%s*%+?(%d+)', '["\']?magic accuracy["\']?%s*%+?(%d+)', '["\']?m%.acc%.["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Attack Bonus', patterns = {'["\']?mag%.%s*atk%.%s*bns%.["\']?%s*%+?(%d+)', '["\']?magic attack bonus["\']?%s*%+?(%d+)', '["\']?magic atk%. bonus["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Burst Damage', patterns = {'["\']?magic burst damage["\']?%s*%+?(%d+)%%?', '["\']?magic burst dmg%.["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Magic Burst Damage II', patterns = {'["\']?magic burst damage ii["\']?%s*%+?(%d+)%%?', '["\']?magic burst dmg%. ii["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Magic Critical Hit Rate', patterns = {'["\']?magic critical hit rate["\']?%s*%+?(%d+)%%?', '["\']?mag%.%s*crit%.%s*hit rate["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Magic Damage', patterns = {'["\']?magic damage["\']?%s*%+?(%d+)', '["\']?mag%.%s*dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Damage Taken', patterns = {'["\']?magic damage taken["\']?%s*%-?(%d+)%%?', '["\']?magic dmg%. taken["\']?%s*%-?(%d+)%%?', '["\']?mag%.%s*dmg%.%s*taken["\']?%s*%-?(%d+)%%?', '["\']?mdt["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Magic Def. Bonus', patterns = {'["\']?mag%.%s*def%.%s*bns%.["\']?%s*%+?(%d+)', '["\']?magic def%. bonus["\']?%s*%+?(%d+)', '["\']?mdb["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Evasion', patterns = {'["\']?magic evasion["\']?%s*%+?(%d+)', '["\']?mag%.%s*evasion["\']?%s*%+?(%d+)', '["\']?mag%.%s*eva%.["\']?%s*%+?(%d+)', '["\']?meva["\']?%s*%+?(%d+)'} },
    { stat = 'Movement Speed', patterns = {'["\']?movement speed["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Occ. inc. resist. to stat. ailments', patterns = {'["\']?occ%. inc%. resist%. to stat%. ailments["\']?%s*%+?(%d+)'} },
    { stat = 'Occ. quickens spellcasting', patterns = {'["\']?occ%. quickens spellcasting["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Phalanx', patterns = {'["\']?phalanx["\']?%s*received%s*%+?(%d+)', '["\']?phalanx["\']?%s*%+?(%d+)'} },
    { stat = 'Physical Damage Limit', patterns = {'["\']?physical damage limit["\']?%s*%+?(%d+)%%?', '["\']?pdl["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Physical Damage Taken', patterns = {'["\']?physical damage taken["\']?%s*%-?(%d+)%%?', '["\']?phys%.%s*dmg%.%s*taken["\']?%s*%-?(%d+)%%?', '["\']?pdt["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Quadruple Attack', patterns = {'["\']?quadruple attack["\']?%s*%+?(%d+)%%?', '["\']?quad%.%s*atk%.["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Quick Magic', patterns = {'["\']?quick magic["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Ranged Accuracy', patterns = {'["\']?rng%.%s*acc%.?["\']?%s*%+?(%d+)', '["\']?ranged accuracy["\']?%s*%+?(%d+)'} },
    { stat = 'Ranged Attack', patterns = {'["\']?rng%.%s*atk%.?["\']?%s*%+?(%d+)', '["\']?ranged attack["\']?%s*%+?(%d+)'} },
    { stat = 'Rapid Shot', patterns = {'["\']?rapid shot["\']?%s*%+?(%d+)'} },
    { stat = 'Refresh', patterns = {'["\']?refresh["\']?%s*%+?(%d+)'} },
    { stat = 'Refresh Potency', patterns = {'["\']?refresh["\']? potency%s*%+?(%d+)'} },
    { stat = 'Regain', patterns = {'["\']?regain["\']?%s*%+?(%d+)'} },
    { stat = 'Regen', patterns = {'["\']?regen["\']?%s*%+?(%d+)'} },
    { stat = 'Regen Effect Duration', patterns = {'["\']?regen["\']? effect duration%s*%+?(%d+)', '["\']?regen["\']? duration%s*%+?(%d+)'} },
    { stat = 'Regen Potency', patterns = {'["\']?regen["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Snapshot', patterns = {'["\']?snapshot["\']?%s*%+?(%d+)'} },
    { stat = 'Song Effect Duration', patterns = {'["\']?song effect duration["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Spell Interruption Rate', patterns = {'["\']?spell interruption rate down["\']?%s*%-?(%d+)%%?', '["\']?spell interruption rate["\']?%s*%-?(%d+)%%?', '["\']?sird["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Stoneskin', patterns = {'["\']?stoneskin["\']?%s*%+?(%d+)'} },
    { stat = 'Store TP', patterns = {'["\']?store tp["\']?%s*%+?(%d+)'} },
    { stat = 'Subtle Blow', patterns = {'["\']?subtle blow["\']?%s*%+?(%d+)'} },
    { stat = 'TP Bonus', patterns = {'["\']?tp bonus["\']?%s*%+?(%d+)'} },
    { stat = 'Treasure Hunter', patterns = {'["\']?treasure hunter["\']?%s*%+?(%d+)', '["\']?th["\']?%s*%+?(%d+)'} },
    { stat = 'Triple Attack', patterns = {'["\']?triple attack["\']?%s*%+?(%d+)%%?', '["\']?tri%.%s*atk%.["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Triple Attack Damage', patterns = {'["\']?triple attack["\']? damage%s*%+?(%d+)', '["\']?triple attack dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Triple Shot', patterns = {'["\']?triple shot["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Triple Shot Damage', patterns = {'["\']?triple shot["\']? damage%s*%+?(%d+)', '["\']?triple shot dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Waltz Potency', patterns = {'["\']?waltz["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Weapon Skill Damage', patterns = {'["\']?weapon skill damage["\']?%s*%+?(%d+)%%?'} }
}

-- UI Rendering Sections (Alphabetized)
local section1_order = {
    'Accuracy', 'Attack', 'Damage Taken', 'Defense', 'Enmity', 'Evasion', 'HP', 'Haste', 
    'Magic Damage Taken', 'Magic Def. Bonus', 'Magic Evasion', 'Phalanx', 
    'Physical Damage Limit', 'Physical Damage Taken', 'Ranged Accuracy', 'Ranged Attack', 'Regain'
}

local section2_order = {
    'Fast Cast', 'MP', 'Magic Accuracy', 'Magic Attack Bonus', 'Magic Burst Damage', 
    'Magic Burst Damage II', 'Magic Critical Hit Rate', 'Magic Damage', 'Refresh', 'Refresh Potency'
}

local section4_order = { 'Movement Speed' }

-- Dynamically construct section 3 (everything else)
local section3_order = {}
local function is_in_list(val, lst)
    for _, v in ipairs(lst) do if v == val then return true end end
    return false
end

for _, s in ipairs(stat_sequence) do
    if not is_in_list(s.stat, section1_order) and not is_in_list(s.stat, section2_order) and not is_in_list(s.stat, section4_order) then
        table.insert(section3_order, s.stat)
    end
end

-- Create a background copy sorted by string length to ensure specific patterns are parsed before broad ones
local parse_sequence = {}
for _, v in ipairs(stat_sequence) do table.insert(parse_sequence, v) end
table.sort(parse_sequence, function(a, b) 
    return string.len(a.patterns[1]) > string.len(b.patterns[1]) 
end)

-- ==============================================================================
-- 3. Equipment Layout & Char Stats
-- ==============================================================================
local equip_slots_left = { 'main', 'sub', 'head', 'body' }
local equip_slots_center = { 'hands', 'legs', 'feet', 'waist' }
local equip_slots_right = { 'ammo', 'range', 'neck', 'left_ear', 'right_ear', 'left_ring', 'right_ring', 'back' } 

local equip_slots = {}
for _, slot in ipairs(equip_slots_left) do table.insert(equip_slots, slot) end
for _, slot in ipairs(equip_slots_center) do table.insert(equip_slots, slot) end
for _, slot in ipairs(equip_slots_right) do table.insert(equip_slots, slot) end

-- Map specific stats to their /checkparam equivalents
local special_stats_map = {
    ['Accuracy'] = 'Primary Accuracy',
    ['Attack'] = 'Primary Attack',
    ['Ranged Accuracy'] = 'Ranged Accuracy',
    ['Ranged Attack'] = 'Ranged Attack',
    ['Evasion'] = 'Evasion',
    ['Defense'] = 'Defense'
}

local char_stats = {
    ['Primary Accuracy'] = 0, ['Primary Attack'] = 0,
    ['Ranged Accuracy'] = 0, ['Ranged Attack'] = 0,
    ['Evasion'] = 0, ['Defense'] = 0
}
local checkparam_active = false 

-- ==============================================================================
-- 4. Core Calculators
-- ==============================================================================
local function calculate_gear_stats()
    local totals = {}
    local item_details = {} 
    
    for _, s in ipairs(stat_sequence) do totals[s.stat] = 0 end

    local equipment = windower.ffxi.get_items().equipment

    for _, slot_name in ipairs(equip_slots) do
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
                    for line in base_desc.en:gmatch("[^\r\n]+") do table.insert(strings_to_parse, line) end
                end

                local decoded_data = extdata.decode(item)
                if decoded_data and type(decoded_data.augments) == 'table' then
                    for _, aug in ipairs(decoded_data.augments) do table.insert(strings_to_parse, aug) end
                end

                for _, text_line in ipairs(strings_to_parse) do
                    local current_line = text_line:lower() 
                    
                    for _, stat_data in ipairs(parse_sequence) do
                        for _, pattern in ipairs(stat_data.patterns) do
                            local match = string.match(current_line, pattern)
                            if match then
                                local clean_match = string.gsub(match, "%s+", "")
                                local val = tonumber(clean_match)
                                
                                if val then
                                    totals[stat_data.stat] = totals[stat_data.stat] + val
                                    current_item_stats[stat_data.stat] = (current_item_stats[stat_data.stat] or 0) + val
                                    current_line = string.gsub(current_line, pattern, "", 1)
                                end
                            end
                        end
                    end
                end
                
                -- Check our exceptions dictionary for path-based items
                if exceptions[item.id] then
                    for static_stat, static_val in pairs(exceptions[item.id]) do
                        if totals[static_stat] ~= nil then
                            totals[static_stat] = totals[static_stat] + static_val
                            current_item_stats[static_stat] = (current_item_stats[static_stat] or 0) + static_val
                        end
                    end
                end
                
                if next(current_item_stats) ~= nil then
                    item_details[slot_name] = { name = item_name, stats = current_item_stats }
                end
            end
        end
    end
    return totals, item_details
end

-- Helper: Pads strings while ignoring Windower text color codes
local function pad_column(str, desired_width)
    local stripped = string.gsub(str, "\\cs%(%d+,%d+,%d+%)", "")
    stripped = string.gsub(stripped, "\\cr", "")
    local vis_len = string.len(stripped)
    
    if vis_len < desired_width then
        return str .. string.rep(" ", desired_width - vis_len)
    end
    return str
end

-- ==============================================================================
-- 5. UI Rendering
-- ==============================================================================
local function update_ui()
    local current_stats, item_details = calculate_gear_stats()
    
    local ui_text = " --- Gear Statistics --- (//gi hide)\n WIP~>Ody.& Unity Augments \n \n"
    
    local function get_section_lines(stat_list)
        local lines = {}
        for _, stat in ipairs(stat_list) do
            local gear_val = current_stats[stat] or 0
            
            if special_stats_map[stat] then
                local char_val = char_stats[special_stats_map[stat]] or 0
                if gear_val ~= 0 or char_val ~= 0 then
                    table.insert(lines, string.format(" %s: %d \\cs(0,255,0)(%d)\\cr", stat, char_val, gear_val))
                end
            else
                if gear_val ~= 0 then
                    table.insert(lines, string.format(" %s: %d", stat, gear_val))
                end
            end
        end
        return lines
    end

    local lines1 = get_section_lines(section1_order)
    local lines2 = get_section_lines(section2_order)
    local lines3 = get_section_lines(section3_order)
    local lines4 = get_section_lines(section4_order)

    if settings.layout == 'horizontal' then
        local max_rows = math.max(#lines1, #lines2, #lines3, #lines4)
        
        if max_rows == 0 then
            ui_text = ui_text .. " No stats tracked.\n"
        else
            local col_widths = { 32, 36, 36, 25 }
            local active_cols = {}
            
            if #lines1 > 0 then table.insert(active_cols, {lines=lines1, width=col_widths[1]}) end
            if #lines2 > 0 then table.insert(active_cols, {lines=lines2, width=col_widths[2]}) end
            if #lines3 > 0 then table.insert(active_cols, {lines=lines3, width=col_widths[3]}) end
            if #lines4 > 0 then table.insert(active_cols, {lines=lines4, width=col_widths[4]}) end
            
            for i = 1, max_rows do
                local row_str = ""
                for c_idx, col in ipairs(active_cols) do
                    local str = col.lines[i] or ""
                    str = pad_column(str, col.width)
                    row_str = row_str .. str
                    if c_idx < #active_cols then
                        row_str = row_str .. " | "
                    end
                end
                row_str = string.gsub(row_str, " %| $", "")
                ui_text = ui_text .. row_str .. "\n"
            end
        end
    else
        local blocks = {}
        if #lines1 > 0 then table.insert(blocks, table.concat(lines1, "\n")) end
        if #lines2 > 0 then table.insert(blocks, table.concat(lines2, "\n")) end
        if #lines3 > 0 then table.insert(blocks, table.concat(lines3, "\n")) end
        if #lines4 > 0 then table.insert(blocks, table.concat(lines4, "\n")) end

        if #blocks > 0 then
            ui_text = ui_text .. table.concat(blocks, "\n\n") .. "\n"
        else
            ui_text = ui_text .. " No stats tracked.\n"
        end
    end

    display:text(ui_text)
    
    if show_log then
        local left_lines, center_lines, right_lines = {}, {}, {}
        
        local function populate_lines(slot_list, line_list)
            for _, slot in ipairs(slot_list) do
                local detail = item_details[slot]
                if detail then
                    table.insert(line_list, string.format("[%s] %s:", slot, detail.name))
                    for _, s in ipairs(stat_sequence) do
                        if detail.stats[s.stat] then table.insert(line_list, string.format("    - %s: %d", s.stat, detail.stats[s.stat])) end
                    end
                    table.insert(line_list, "")
                end
            end
        end

        populate_lines(equip_slots_left, left_lines)
        populate_lines(equip_slots_center, center_lines)
        populate_lines(equip_slots_right, right_lines)

        local log_text = string.format("%-34s | %-34s | %s\n", " --- Log (Left) ---", "--- Log (Center) ---", "--- Log (Right) ---")
        local max_lines = math.max(#left_lines, #center_lines, #right_lines)
        for i = 1, max_lines do
            log_text = log_text .. string.format("%-34s | %-34s | %s\n", 
                (left_lines[i] or ""):sub(1, 33), 
                (center_lines[i] or ""):sub(1, 33), 
                (right_lines[i] or ""))
        end
        log_display:text(log_text)
    end
end

local function refresh_all()
    update_ui()
    checkparam_active = true
    windower.send_command('checkparam <me>')
end

-- ==============================================================================
-- 6. Event Listeners & Timers
-- ==============================================================================
windower.register_event('incoming chunk', function(id, data, modified, injected, blocked)
    if id == 0x050 then
        equip_update_timer = os.clock() + 0.5
    end
end)

windower.register_event('prerender', function()
    if equip_update_timer > 0 and os.clock() > equip_update_timer then
        equip_update_timer = 0 
        refresh_all()          
    end
end)

windower.register_event('load', 'login', 'zone change', refresh_all)

windower.register_event('incoming text', function(original, modified, original_mode, modified_mode, blocked)
    if not checkparam_active then return end
    
    local player = windower.ffxi.get_player()
    local name = player and player.name or ""

    if original:match('Average item level:') then return true 
    elseif original:match('Auxiliary Accuracy:') then return true 
    elseif name ~= "" and original:match('^' .. name .. ':') then return true end

    if original:match('Primary Accuracy') then
        local pacc, patk = original:match('Primary Accuracy[^0-9]*(%d+)[^0-9]*Primary Attack[^0-9]*(%d+)')
        if pacc and patk then
            char_stats['Primary Accuracy'] = tonumber(pacc)
            char_stats['Primary Attack'] = tonumber(patk)
        end
        return true 
        
    elseif original:match('Secondary Accuracy') then
        return true 
        
    elseif original:match('Ranged Accuracy') then
        local racc, ratk = original:match('Ranged Accuracy[^0-9]*(%d+)[^0-9]*Ranged Attack[^0-9]*(%d+)')
        if racc and ratk then 
            char_stats['Ranged Accuracy'] = tonumber(racc)
            char_stats['Ranged Attack'] = tonumber(ratk)
        end
        return true
        
    elseif original:match('Evasion') then
        local eva, def = original:match('Evasion[^0-9]*(%d+)[^0-9]*Defense[^0-9]*(%d+)')
        if eva and def then 
            char_stats['Evasion'] = tonumber(eva)
            char_stats['Defense'] = tonumber(def)
        end
        
        checkparam_active = false
        update_ui()
        return true
    end
end)

-- ==============================================================================
-- Addon Commands & Help Menu
-- ==============================================================================
windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'
    
    if command == 'refresh' then
        refresh_all()
    elseif command == 'log' then
        show_log = not show_log
        if show_log then log_display:show() else log_display:hide() end
        update_ui()
    elseif command == 'hide' then
        display:hide()
        log_display:hide()
    elseif command == 'show' then
        display:show()
        if show_log then log_display:show() end
    elseif command == 'style' then
        local arg = select(1, ...)
        if arg == 'horizontal' or arg == 'vertical' then
            settings.layout = arg
            config.save(settings, 'all')
            update_ui()
            windower.add_to_chat(207, 'GearInfo: Layout changed to ' .. arg)
        else
            windower.add_to_chat(207, 'GearInfo: Usage: //gi style [horizontal|vertical]')
        end
    elseif command == 'help' then
        windower.add_to_chat(207, ' --- GearInfo v1.0.0 Help ---')
        windower.add_to_chat(207, ' //gi refresh          : Manually refreshes UI and pulls new character stats.')
        windower.add_to_chat(207, ' //gi log              : Toggles the detailed item breakdown log.')
        windower.add_to_chat(207, ' //gi hide             : Hides the Gear Statistics UI completely.')
        windower.add_to_chat(207, ' //gi show             : Shows the Gear Statistics UI.')
        windower.add_to_chat(207, ' //gi style horizontal : Changes the UI to a side-by-side layout.')
        windower.add_to_chat(207, ' //gi style vertical   : Changes the UI back to a stacked layout.')
        windower.add_to_chat(207, ' //gi help             : Displays this help menu.')
        windower.add_to_chat(207, ' Note: You can click and drag the UI windows anywhere on your screen!')
    else
        windower.add_to_chat(207, 'GearInfo: Unknown command. Type //gi help for a list of commands.')
    end
end)

windower.register_event('unload', function()
    config.save(settings, 'all')
    config.save(log_settings, 'all')
end)