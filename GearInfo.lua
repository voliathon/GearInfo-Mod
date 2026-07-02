_addon.name = 'GearInfo'
_addon.author = 'Voliathon'
_addon.version = '1.0.0'
_addon.commands = {'gi', 'gearinfo'}

local extdata = require('extdata')
local res = require('resources')
local config = require('config')
local texts = require('texts')

-- ==============================================================================
-- 1. Setup UI & Per-Character Persistence
-- ==============================================================================
local default_settings = {
    pos = { x = 200, y = 200 },
    bg = { alpha = 150, red = 0, green = 0, blue = 0, visible = true },
    flags = { draggable = true, bold = true },
    text = { size = 10, font = 'Consolas', alpha = 255, red = 255, green = 255, blue = 255 }
}

local default_log_settings = {
    pos = { x = 350, y = 200 },
    bg = { alpha = 150, red = 0, green = 0, blue = 50, visible = true },
    flags = { draggable = true, bold = true },
    text = { size = 9, font = 'Consolas', alpha = 255, red = 200, green = 200, blue = 200 }
}

local default_char_settings = {
    pos = { x = 200, y = 400 },
    bg = { alpha = 150, red = 50, green = 0, blue = 0, visible = true },
    flags = { draggable = true, bold = true },
    text = { size = 10, font = 'Consolas', alpha = 255, red = 255, green = 255, blue = 255 }
}

local settings = config.load('data\\settings.xml', default_settings)
local log_settings = config.load('data\\log_settings.xml', default_log_settings)
local char_settings = config.load('data\\char_settings.xml', default_char_settings)

local display = texts.new(settings)
local log_display = texts.new(log_settings)
local char_display = texts.new(char_settings)

local show_log = false
local equip_update_timer = 0

-- ==============================================================================
-- 2. Ordered Stat Sequence (Specific -> Broad)
-- ==============================================================================
local stat_sequence = {
    { stat = 'Magic Burst Damage II', patterns = {'"?magic burst damage ii"?%s*%+?(%d+)%%?', '"?magic burst dmg%. ii"?%s*%+?(%d+)%%?'} },
    { stat = 'Magic Burst Damage', patterns = {'"?magic burst damage"?%s*%+?(%d+)%%?', '"?magic burst dmg%."?%s*%+?(%d+)%%?'} },
    
    { stat = 'Magic Attack Bonus', patterns = {'"?mag%.%s*atk%.%s*bns%."?%s*%+?(%d+)', '"?magic attack bonus"?%s*%+?(%d+)', '"?magic atk%. bonus"?%s*%+?(%d+)'} },
    { stat = 'Magic Def. Bonus', patterns = {'"?mag%.%s*def%.%s*bns%."?%s*%+?(%d+)', '"?magic def%. bonus"?%s*%+?(%d+)', '"?mdb"?%s*%+?(%d+)'} },
    { stat = 'Magic Accuracy', patterns = {'"?mag%.%s*acc%.?"?%s*%+?(%d+)', '"?magic accuracy"?%s*%+?(%d+)', '"?m%.acc%."?%s*%+?(%d+)'} },
    
    { stat = 'Magic Evasion', patterns = {'"?magic evasion"?%s*%+?(%d+)', '"?mag%.%s*evasion"?%s*%+?(%d+)', '"?mag%.%s*eva%."?%s*%+?(%d+)', '"?meva"?%s*%+?(%d+)'} },
    { stat = 'Magic Damage', patterns = {'"?magic damage"?%s*%+?(%d+)', '"?mag%.%s*dmg%."?%s*%+?(%d+)'} },
    
    { stat = 'Ranged Accuracy', patterns = {'"?rng%.%s*acc%.?"?%s*%+?(%d+)', '"?ranged accuracy"?%s*%+?(%d+)'} },
    { stat = 'Accuracy', patterns = {'"?accuracy"?%s*%+?(%d+)', '"?acc%."?%s*%+?(%d+)'} }, 
    
    { stat = 'Physical Damage Taken', patterns = {'"?physical damage taken"?%s*%-?(%d+)%%?', '"?phys%.%s*dmg%.%s*taken"?%s*%-?(%d+)%%?', '"?pdt"?%s*%-?(%d+)%%?'} },
    { stat = 'Magic Damage Taken', patterns = {'"?magic damage taken"?%s*%-?(%d+)%%?', '"?magic dmg%. taken"?%s*%-?(%d+)%%?', '"?mag%.%s*dmg%.%s*taken"?%s*%-?(%d+)%%?', '"?mdt"?%s*%-?(%d+)%%?'} },
    { stat = 'Damage Taken', patterns = {'"?damage taken"?%s*%-?(%d+)%%?', '"?dt"?%s*%-?(%d+)%%?'} }, 
    
    { stat = 'Evasion', patterns = {'"?evasion"?%s*%+?(%d+)', '"?eva%."?%s*%+?(%d+)'} },
    
    { stat = 'Enmity', patterns = {'"?enmity"?%s*([%+%-]%s*%d+)'} }, 
    { stat = 'Spell Interruption Rate', patterns = {'"?spell interruption rate down"?%s*%-?(%d+)%%?', '"?spell interruption rate"?%s*%-?(%d+)%%?', '"?sird"?%s*%-?(%d+)%%?'} },
    
    { stat = 'Double Attack', patterns = {'"?double attack"?%s*%+?(%d+)%%?', '"?dbl%.%s*atk%."?%s*%+?(%d+)%%?'} },
    { stat = 'Dual Wield', patterns = {'"?dual wield"?%s*%+?(%d+)'} },
    { stat = 'Haste', patterns = {'"?haste"?%s*%+?(%d+)%%?'} },
    
    { stat = 'Critical Hit Rate', patterns = {'"?critical hit rate"?%s*%+?(%d+)%%?', '"?crit%.%s*hit rate"?%s*%+?(%d+)%%?'} },
    { stat = 'Weapon Skill Damage', patterns = {'"?weapon skill damage"?%s*%+?(%d+)%%?'} },
    { stat = 'Physical Damage Limit', patterns = {'"?physical damage limit"?%s*%+?(%d+)%%?', '"?pdl"?%s*%+?(%d+)%%?'} },
    
    { stat = 'Store TP', patterns = {'"?store tp"?%s*%+?(%d+)'} },
    { stat = 'Regain', patterns = {'"?regain"?%s*%+?(%d+)'} },
    { stat = 'Phalanx', patterns = {'"?phalanx"?%s*received%s*%+?(%d+)', '"?phalanx"?%s*%+?(%d+)'} },
    { stat = 'Subtle Blow', patterns = {'"?subtle blow"?%s*%+?(%d+)'} },
    
    { stat = 'Fast Cast', patterns = {'"?fast cast"?%s*%+?(%d+)%%?'} },
    { stat = 'Refresh', patterns = {'"?refresh"?%s*%+?(%d+)'} },
    { stat = 'Cure Potency II', patterns = {'"?cure"? potency ii%s*%+?(%d+)%%?'} },
    { stat = 'Cure Potency', patterns = {'"?cure"? potency%s*%+?(%d+)%%?'} },
    
    { stat = 'Enhancing Magic Duration', patterns = {'"?enhancing magic duration"?%s*%+?(%d+)%%?', '"?enh%. mag%. eff%. dur%."?%s*%+?(%d+)'} },
    { stat = 'Conserve MP', patterns = {'"?conserve mp"?%s*%+?(%d+)'} },
    { stat = 'Cursna', patterns = {'"?cursna"?%s*%+?(%d+)'} },
    { stat = 'Occ. quickens spellcasting', patterns = {'"?occ%. quickens spellcasting"?%s*%+?(%d+)%%?'} },
    
    { stat = 'Regen Potency', patterns = {'"?regen"? potency%s*%+?(%d+)%%?'} },
    { stat = 'Regen Effect Duration', patterns = {'"?regen"? effect duration%s*%+?(%d+)', '"?regen"? duration%s*%+?(%d+)'} },
    { stat = 'Regen', patterns = {'"?regen"?%s*%+?(%d+)'} },
    
    { stat = 'Occ. inc. resist. to stat. ailments', patterns = {'"?occ%. inc%. resist%. to stat%. ailments"?%s*%+?(%d+)'} },
    { stat = 'Stoneskin', patterns = {'"?stoneskin"?%s*%+?(%d+)'} },
    
    { stat = 'Attack', patterns = {'"?attack"?%s*%+?(%d+)', '"?atk%."?%s*%+?(%d+)'} }
}

-- Splitting equipment into 3 columns
local equip_slots_left = { 'main', 'sub', 'head', 'body' }
local equip_slots_center = { 'hands', 'legs', 'feet', 'waist' }
local equip_slots_right = { 'ammo', 'range', 'neck', 'left_ear', 'right_ear', 'left_ring', 'right_ring', 'back' } 

local equip_slots = {}
for _, slot in ipairs(equip_slots_left) do table.insert(equip_slots, slot) end
for _, slot in ipairs(equip_slots_center) do table.insert(equip_slots, slot) end
for _, slot in ipairs(equip_slots_right) do table.insert(equip_slots, slot) end

local char_stats = {
    ['Primary Accuracy'] = 0, ['Primary Attack'] = 0,
    ['Secondary Accuracy'] = 0, ['Secondary Attack'] = 0,
    ['Ranged Accuracy'] = 0, ['Ranged Attack'] = 0,
    ['Evasion'] = 0, ['Defense'] = 0
}
local checkparam_active = false 

-- ==============================================================================
-- 3. Core Calculators
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
                    for _, stat_data in ipairs(stat_sequence) do
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
                
                if next(current_item_stats) ~= nil then
                    item_details[slot_name] = { name = item_name, stats = current_item_stats }
                end
            end
        end
    end
    return totals, item_details
end

-- ==============================================================================
-- 4. UI Rendering
-- ==============================================================================
local function update_ui()
    local current_stats, item_details = calculate_gear_stats()
    
    local ui_text = " --- Gear Stats Only ---\n"
    for _, s in ipairs(stat_sequence) do
        if current_stats[s.stat] ~= 0 then
            ui_text = ui_text .. string.format(" %s: %d\n", s.stat, current_stats[s.stat])
        end
    end
    display:text(ui_text)
    display:show()
    
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

        -- Build the 3-column log horizontal layout
        local log_text = string.format("%-34s | %-34s | %s\n", " --- Log (Left) ---", "--- Log (Center) ---", "--- Log (Right) ---")
        local max_lines = math.max(#left_lines, #center_lines, #right_lines)
        for i = 1, max_lines do
            log_text = log_text .. string.format("%-34s | %-34s | %s\n", 
                (left_lines[i] or ""):sub(1, 33), 
                (center_lines[i] or ""):sub(1, 33), 
                (right_lines[i] or ""))
        end
        log_display:text(log_text)
        log_display:show()
    else
        log_display:hide()
    end
end

local function update_char_ui()
    local char_text = " --- True Character Totals ---\n"
    local render_order = {
        'Primary Accuracy', 'Primary Attack', 
        'Secondary Accuracy', 'Secondary Attack', 
        'Ranged Accuracy', 'Ranged Attack', 
        'Evasion', 'Defense'
    }
    
    for _, stat in ipairs(render_order) do
        if char_stats[stat] > 0 then
            char_text = char_text .. string.format(" %s: %d\n", stat, char_stats[stat])
        end
    end
    
    char_display:text(char_text)
    char_display:show()
end

local function refresh_all()
    update_ui()
    checkparam_active = true
    windower.send_command('checkparam <me>')
end

-- ==============================================================================
-- 5. Event Listeners & Timers
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

    local parsed_something = false

    local pacc, patk = original:match('Primary Accuracy:%s*(%d+)%s*Primary Attack:%s*(%d+)')
    if pacc and patk then
        char_stats['Primary Accuracy'] = tonumber(pacc); char_stats['Primary Attack'] = tonumber(patk)
        parsed_something = true
    end

    local sacc, satk = original:match('Secondary Accuracy:%s*(%d+)%s*Secondary Attack:%s*(%d+)')
    if sacc and satk then
        char_stats['Secondary Accuracy'] = tonumber(sacc); char_stats['Secondary Attack'] = tonumber(satk)
        parsed_something = true
    end

    local racc, ratk = original:match('Ranged Accuracy:%s*(%d+)%s*Ranged Attack:%s*(%d+)')
    if racc and ratk then
        char_stats['Ranged Accuracy'] = tonumber(racc); char_stats['Ranged Attack'] = tonumber(ratk)
        parsed_something = true
    end

    local eva, def = original:match('Evasion:%s*(%d+)%s*Defense:%s*(%d+)')
    if eva and def then
        char_stats['Evasion'] = tonumber(eva); char_stats['Defense'] = tonumber(def)
        parsed_something = true
        checkparam_active = false
    end

    if parsed_something then
        update_char_ui()
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
        windower.add_to_chat(207, 'GearInfo: Refreshed all stats.')
        
    elseif command == 'log' then
        show_log = not show_log
        update_ui()
        windower.add_to_chat(207, 'GearInfo: Detailed log is now ' .. (show_log and 'ON' or 'OFF'))
        
    elseif command == 'help' then
        windower.add_to_chat(207, ' --- GearInfo v1.0.0 Help ---')
        windower.add_to_chat(207, ' //gi refresh : Manually refreshes the UI and pulls new character stats.')
        windower.add_to_chat(207, ' //gi log     : Toggles the detailed item-by-item breakdown window.')
        windower.add_to_chat(207, ' //gi help    : Displays this help menu.')
        windower.add_to_chat(207, ' Note: You can click and drag the UI windows anywhere on your screen!')
        
    else
        windower.add_to_chat(207, 'GearInfo: Unknown command. Type //gi help for a list of commands.')
    end
end)

windower.register_event('unload', function()
    config.save(settings, 'all')
    config.save(log_settings, 'all')
    config.save(char_settings, 'all')
end)