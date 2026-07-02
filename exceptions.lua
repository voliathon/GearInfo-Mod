-- exceptions.lua
-- Addon exceptions for gear that uses Path/Rank extdata instead of explicit stat strings.
-- Ensure the stat names match the strings in GearInfo's stat_sequence exactly.

local exceptions = {
    -- =========================
    -- Odyssey: Nyame Set (Path B, Rank 25)
    -- =========================
    [23761] = {['Attack']=30, ['Ranged Attack']=30, ['Weapon Skill Damage']=10, ['Double Attack']=4, ['Accuracy']=5, ['Ranged Accuracy']=5}, -- Nyame Helm
    [23768] = {['Attack']=30, ['Ranged Attack']=30, ['Weapon Skill Damage']=12, ['Double Attack']=5}, -- Nyame Mail
    [23775] = {['Attack']=30, ['Ranged Attack']=30, ['Weapon Skill Damage']=10, ['Double Attack']=4}, -- Nyame Gauntlets
    [23782] = {['Attack']=30, ['Ranged Attack']=30, ['Weapon Skill Damage']=11, ['Double Attack']=5}, -- Nyame Flanchard
    [23789] = {['Attack']=30, ['Ranged Attack']=30, ['Weapon Skill Damage']=10, ['Double Attack']=4, ['Accuracy']=8, ['Ranged Accuracy']=8}, -- Nyame Sollerets

    -- =========================
    -- Odyssey: Atonement 2 (Belts & Earrings)
    -- =========================
    [26362] = {['Ranged Accuracy']=15, ['Ranged Attack']=15, ['Enmity']=-5}, -- Tellen Belt
    [26363] = {['Magic Accuracy']=15, ['Enmity']=-5}, -- Obstin. Sash
    [26116] = {['Accuracy']=15, ['Attack']=15, ['Store TP']=5}, -- Schere Earring
    [26218] = {['Attack']=15, ['Accuracy']=15}, -- Beithir Ring
    
    -- =========================
    -- Odyssey: Atonement 1
    -- =========================
    [21431] = {['Attack']=15}, -- Coiste Bodhar
}

return exceptions