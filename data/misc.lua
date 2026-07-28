-- data/misc.lua
local misc = {}

-- ==============================================================================
-- Hidden/Misleading Stat Overrides
-- ==============================================================================
misc[27510] = { ['fTP Mod'] = 0.1 } -- Fotia Gorget
misc[28420] = { ['fTP Mod'] = 0.1 } -- Fotia Belt
misc[14813] = { ['Double Attack'] = 5 } -- Brutal Earring
misc[11051] = { ['All status ailment resistance'] = 5 } -- Hearty Earring
misc[14739] = { ['Dual Wield'] = 5 } -- Suppanomimi
misc[14812] = { ['Fast Cast'] = 2 } -- Loquacious Earring
misc[10826] = { ['Fast Cast'] = 3 } -- Witful Belt
misc[10394] = { ['Fast Cast'] = 5 } -- Orunmila's Torque

-- ==============================================================================
-- Cursna Enhancements
-- ==============================================================================
misc[10325] = { ['Cursna'] = 10 } -- Hieros Mittens
misc[27136] = { ['Cursna'] = 15 } -- Fanatic Gloves
misc[28092] = { ['Cursna'] = 13 } -- Theophany Pantaloons
misc[28335] = { ['Cursna'] = 5 }  -- Gendewitha Galoshes
misc[10392] = { ['Cursna'] = 10 } -- Malison Medallion
misc[10393] = { ['Cursna'] = 15 } -- Debilis Medallion
misc[10790] = { ['Cursna'] = 10 } -- Ephedra Ring
misc[10791] = { ['Cursna'] = 15 } -- Haoma's Ring
misc[28619] = { ['Cursna'] = 15 } -- Mending Cape

misc[10792] = { ['Cursna received'] = 15 } -- Saida Ring
misc[10793] = { ['Cursna received'] = 20 } -- Eshmun's Ring

-- ==============================================================================
-- Stoneskin / HP Absorbed
-- ==============================================================================
misc[13177] = { ['Stoneskin'] = 30 } -- Stone Gorget
misc[15034] = { ['Stoneskin'] = 30 } -- Stone Mufflers
misc[11949] = { ['Stoneskin'] = 20 } -- Haven Hose
misc[11037] = { ['Stoneskin'] = 10 } -- Earthcry Earring
misc[27524] = { ['Stoneskin'] = 30 } -- Nodens Gorget
misc[15960] = { ['Stoneskin'] = 20, ['Stoneskin casting time'] = -8 } -- Siegel Sash
misc[11917] = { ['Stoneskin casting time'] = -15 } -- Carapacho Cuffs

-- ==============================================================================
-- Aquaveil Interruptions
-- ==============================================================================
misc[11753] = { ['Aquaveil Interruption(s)'] = 1 } -- Emphatikos Rope
misc[10329] = { ['Stoneskin'] = 35, ['Aquaveil Interruption(s)'] = 1 } -- Shedir Seraweels
misc[21103] = { ['Aquaveil Interruption(s)'] = 1 } -- Vadose Rod
misc[25644] = { ['Aquaveil Interruption(s)'] = 1 } -- Chironic Hat
misc[25615] = { ['Aquaveil Interruption(s)'] = 1 } -- Amalric Coif
misc[25616] = { ['Aquaveil Interruption(s)'] = 2 } -- Amalric Coif +1
misc[25827] = { ['Aquaveil Interruption(s)'] = 2 } -- Regal Cuffs
misc[21699] = { ['Aquaveil Interruption(s)'] = 1 } -- Nibiru Faussar

return misc