--[[
================================================================================
                               GearInfo-Mod
================================================================================

Copyright © 2026 Voliathon. All rights reserved.

--------------------------------------------------------------------------------
1. TERMS OF USE
--------------------------------------------------------------------------------
Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the "Software"), to use 
and run the Software for personal, non-commercial purposes, subject to the 
following conditions:

  * No Derivatives or Redistribution: 
    The Software may not be modified, sublicensed, redistributed, or sold 
    without the express written permission of the copyright holder.

  * AI and Machine Learning Restriction: 
    The Software, its source code, documentation, and any associated data may 
    not be used, scraped, or harvested for the purposes of training, tuning, 
    or developing artificial intelligence (AI), machine learning (ML), large 
    language models (LLMs), neural networks, or any similar automated data 
    processing technologies.

  * Data Mining Restriction: 
    Automated scraping, data mining, or extraction of the source code or assets 
    for any purpose other than executing the Software as intended is strictly 
    prohibited.

--------------------------------------------------------------------------------
2. DISCLAIMER OF WARRANTY & LIMITATION OF LIABILITY
--------------------------------------------------------------------------------
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 

IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
DEALINGS IN THE SOFTWARE.
================================================================================
--]]

_addon.name = 'GearInfo-Mod'
_addon.author = 'Voliathon'
_addon.version = '1.7.0'
_addon.commands = {'gim'}

local config = require('config')
local texts = require('texts')
local stat_dict = require('data.stat_dict')
local parser = require('parser')
local ui_renderer = require('ui_renderer')
local debugger = require('debugger')

-- ==============================================================================
-- Setup Settings & State Table
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
local default_base_settings = {
    pos = { x = 200, y = 450 },
    bg = { alpha = 150, red = 0, green = 0, blue = 0, visible = true },
    flags = { draggable = true, bold = true },
    text = { size = 10, font = 'Consolas', alpha = 255, red = 255, green = 255, blue = 255 },
    layout = 'vertical'
}

local settings = config.load('data\\settings\\settings.xml', default_settings)
local log_settings = config.load('data\\settings\\log_settings.xml', default_log_settings)
local base_settings = config.load('data\\settings\\base_settings.xml', default_base_settings)

local displays = {
    main = texts.new(settings),
    log = texts.new(log_settings),
    base = texts.new(base_settings)
}

local state = {
    show_log = false,
    show_base = false,
    show_ghost = false,
    ghost_stats = {},
    ghost_char_stats = {},
    char_stats = stat_dict.char_stats,
    settings = settings
}

local equip_update_timer = 0
local pending_checkparam = 0
local hide_next_checkparam = false

local function update_ui()
    local current_stats, item_details = parser.calculate_gear_stats(stat_dict)
    ui_renderer.update(displays, state, stat_dict, current_stats, item_details)
end

-- ==============================================================================
-- Event Listeners & Timers
-- ==============================================================================
windower.register_event('incoming chunk', function(id, data, modified, injected, blocked)
    if id == 0x050 then equip_update_timer = os.clock() + 0.5 end
end)

windower.register_event('prerender', function()
    local now = os.clock()
    if equip_update_timer > 0 and now > equip_update_timer then
        equip_update_timer = 0 
        update_ui()
        pending_checkparam = now + 1.2
    end
    if pending_checkparam > 0 and now > pending_checkparam then
        pending_checkparam = 0
        hide_next_checkparam = true
        windower.send_command('checkparam <me>')
    end
end)

windower.register_event('load', 'login', 'zone change', function()
    update_ui()
    hide_next_checkparam = true
    windower.send_command('checkparam <me>')
end)

windower.register_event('incoming text', function(original, modified, original_mode, modified_mode, blocked)
    if hide_next_checkparam and original:find("You must close the currently open window") then
        pending_checkparam = os.clock() + 1.5
        return true
    end

    local is_checkparam_line = false
    local player = windower.ffxi.get_player()
    local name = player and player.name or ""

    if original:match('Primary Accuracy') or original:match('Secondary Accuracy') or 
       original:match('Ranged Accuracy') or original:match('Evasion') or 
       original:match('Average item level:') or original:match('Auxiliary Accuracy:') or
       (name ~= "" and original:match('^' .. name .. ':')) then
        is_checkparam_line = true
    end

    if is_checkparam_line then
        if original:match('Primary Accuracy') then
            local pacc, patk = original:match('Primary Accuracy[^0-9]*(%d+)[^0-9]*Primary Attack[^0-9]*(%d+)')
            if pacc and patk then state.char_stats['Primary Accuracy'] = tonumber(pacc); state.char_stats['Primary Attack'] = tonumber(patk) end
        elseif original:match('Ranged Accuracy') then
            local racc, ratk = original:match('Ranged Accuracy[^0-9]*(%d+)[^0-9]*Ranged Attack[^0-9]*(%d+)')
            if racc and ratk then state.char_stats['Ranged Accuracy'] = tonumber(racc); state.char_stats['Ranged Attack'] = tonumber(ratk) end
        elseif original:match('Evasion') then
            local eva, def = original:match('Evasion[^0-9]*(%d+)[^0-9]*Defense[^0-9]*(%d+)')
            if eva and def then state.char_stats['Evasion'] = tonumber(eva); state.char_stats['Defense'] = tonumber(def) end
            update_ui()
        end
        if hide_next_checkparam then
            if original:match('Evasion') then hide_next_checkparam = false end
            return true 
        end
    end
end)

-- ==============================================================================
-- Addon Commands & Help Menu
-- ==============================================================================
windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'
    if command == 'refresh' then update_ui(); hide_next_checkparam = true; windower.send_command('checkparam <me>')
    elseif command == 'export' then
        local current_stats, item_details = parser.calculate_gear_stats(stat_dict)
        debugger.export_gear(select(1, ...), stat_dict, current_stats, item_details, state.ghost_char_stats, state.ghost_stats)
    elseif command == 'log' then state.show_log = not state.show_log; if state.show_log then displays.log:show() else displays.log:hide() end; update_ui()
    elseif command == 'base' then state.show_base = not state.show_base; if state.show_base then displays.base:show() else displays.base:hide() end; update_ui()
    elseif command == 'hide' then displays.main:hide(); displays.log:hide(); displays.base:hide()
    elseif command == 'show' then displays.main:show(); if state.show_log then displays.log:show() end; if state.show_base then displays.base:show() end
    elseif command == 'ghost' then
        local arg = select(1, ...)
        if arg == 'save' or arg == 'set' then
            local cur, _ = parser.calculate_gear_stats(stat_dict)
            state.ghost_stats, state.ghost_char_stats = {}, {}
            for k, v in pairs(cur) do state.ghost_stats[k] = v end
            for k, v in pairs(state.char_stats) do state.ghost_char_stats[k] = v end
            state.show_ghost = true; update_ui(); windower.add_to_chat(207, 'GearInfo: Ghost Gear Snapshot Saved!')
        elseif arg == 'clear' or arg == 'remove' then
            state.show_ghost, state.ghost_stats, state.ghost_char_stats = false, {}, {}; update_ui(); windower.add_to_chat(207, 'GearInfo: Ghost Gear Cleared.')
        elseif arg == 'toggle' then state.show_ghost = not state.show_ghost; update_ui(); windower.add_to_chat(207, 'GearInfo: Ghost Gear ' .. (state.show_ghost and 'Enabled' or 'Disabled'))
        else windower.add_to_chat(207, 'GearInfo: Ghost Usage: //gim ghost [save|clear|toggle]') end
    elseif command == 'style' then
        local arg = select(1, ...)
        if arg == 'horizontal' or arg == 'vertical' then
            state.settings.layout = arg; config.save(state.settings, 'all'); update_ui(); windower.add_to_chat(207, 'GearInfo: Layout changed to ' .. arg)
        else windower.add_to_chat(207, 'GearInfo: Usage: //gim style [horizontal|vertical]') end
    elseif command == 'help' then
        local msgs = {
            ' --- GearInfo-Mod v1.7.0 Help ---',
            ' //gim refresh          : Manually refreshes UI and pulls new character stats.',
            ' //gim base             : Toggles the Base Stats (STR/DEX/etc.) UI window.',
            ' //gim ghost save       : Saves a snapshot of your current stats to compare.',
            ' //gim ghost clear      : Deletes your saved Ghost Gear snapshot.',
            ' //gim ghost toggle     : Hides or shows your Ghost Gear display.',
            ' //gim log              : Toggles the detailed item breakdown log.',
            ' //gim export           : Dumps raw item descriptions and extdata.',
            ' //gim export log       : Dumps parsed UI stats and warnings.',
            ' //gim hide/show        : Hides or shows the Gear Statistics UI completely.',
            ' //gim style [horizontal/vertical] : Changes the layout of the UI.',
            ' //gim validate         : Debug tool to scan database keys against the UI.'
        }
        for _, msg in ipairs(msgs) do windower.add_to_chat(207, msg) end
    elseif command == 'validate' then debugger.validate_stat_keys(stat_dict)
    else windower.add_to_chat(207, 'GearInfo: Unknown command. Type //gim for a list of commands.') end
end)

windower.register_event('unload', function()
    config.save(state.settings, 'all')
    config.save(log_settings, 'all')
    config.save(base_settings, 'all')
end)