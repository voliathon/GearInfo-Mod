-- GearInfo-Mod for Final Fantasy XI
-- Copyright (c) 2026 Voliathon. All rights reserved.
-- Licensed under custom terms. See LICENSE file in the root directory.
local stat_sequence = {
    { stat = 'Accuracy', patterns = {'["\']?accuracy["\']?%s*%+?(%d+)', '["\']?acc%.["\']?%s*%+?(%d+)'} },
    { stat = 'Additional ammo accuracy', patterns = {'additional ammo accuracy%s*%+?(%d+)'} },
    { stat = 'Additional ammo damage', patterns = {'additional ammo damage:%s*%+?(%d+)%%?'} },
    { stat = 'Afflatus Misery stored', patterns = {'["\']?afflatus misery["\']? stored%s*%+?(%d+)%%?'} },
    { stat = 'AGI', patterns = {'["\']?agi["\']?%s*%+?(%d+)'} },
    { stat = 'Ailment Resistance Magic effect', patterns = {'ailment resistance magic effect%s*%+?(%d+)'} },
    { stat = 'All Jumps damage', patterns = {'all jumps damage%s*%+?(%d+)%%?'} },
    { stat = 'All resistances', patterns = {'all resistances%s*%+?(%d+)', 'res%. all ele%.%s*%+?(%d+)'} },
    { stat = 'All songs', patterns = {'all songs%s*%+?(%d+)'} },
    { stat = 'All status ailment resistance', patterns = {'all status ailment resistance%s*%+?(%d+)', 'resistance to all status ailments%s*%+?(%d+)', '["\']?occ%. inc%. resist%. to stat%. ailments["\']?%s*%+?(%d+)'} },
    { stat = 'Aquaveil Interruption(s)', patterns = {'aquaveil%s*interruption%(s%)%s*%+?(%d+)', 'aquaveil%s*%+?(%d+)%s*interruption'} },
    { stat = 'Attack', patterns = {'["\']?attack["\']?%s*%+?(%d+)', '["\']?atk%.["\']?%s*%+?(%d+)'} },
    { stat = 'Automaton: Accuracy', patterns = {'automaton:%s*accuracy%s*%+?(%d+)', 'automaton:%s*acc%.%s*%+?(%d+)'} },
    { stat = 'Automaton: Cure Potency', patterns = {'automaton:%s*["\']?cure["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Automaton: Fast Cast', patterns = {'automaton:%s*["\']?fast cast["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Automaton: HP', patterns = {'automaton:%s*hp%s*%+?(%d+)'} },
    { stat = 'Automaton: Mag. Acc.', patterns = {'automaton:%s*mag%.%s*acc%.%s*%+?(%d+)', 'automaton:%s*magic accuracy%s*%+?(%d+)'} },
    { stat = 'Automaton: Magic Attack Bonus', patterns = {'automaton:%s*["\']?mag%. atk%. bns%.["\']?%s*%+?(%d+)', 'automaton:%s*["\']?magic attack bonus["\']?%s*%+?(%d+)'} },
    { stat = 'Automaton Magic Skill', patterns = {'automaton magic skill%s*%+?(%d+)'} },
    { stat = 'Automaton Melee Skill', patterns = {'automaton melee skill%s*%+?(%d+)'} },
    { stat = 'Automaton: R. Acc.', patterns = {'automaton:%s*r%.%s*acc%.%s*%+?(%d+)', 'automaton:%s*rng%.%s*acc%.%s*%+?(%d+)'} },
    { stat = 'Automaton Ranged Skill', patterns = {'automaton ranged skill%s*%+?(%d+)'} },
    { stat = 'Automaton: Special attack damage', patterns = {'automaton:%s*special attack damage%s*%+?(%d+)%%?'} },
    { stat = 'Avatar Perpetuation Cost', patterns = {'avatar perpetuation cost%s*([%+%-]?%d+)'} },
    { stat = 'Avatar: Accuracy', patterns = {'avatar:%s*accuracy%s*%+?(%d+)', 'avatar:%s*acc%.%s*%+?(%d+)'} },
    { stat = 'Avatar: All Attr.', patterns = {'avatar:%s*all attr%.%s*%+?(%d+)'} },
    { stat = 'Avatar: Enmity', patterns = {'avatar:%s*enmity%s*([%+%-]%s*%d+)'} },
    { stat = 'Avatar: Mag. Acc.', patterns = {'avatar:%s*mag%.%s*acc%.%s*%+?(%d+)', 'avatar:%s*magic accuracy%s*%+?(%d+)'} },
    { stat = 'Avatar: Magic Burst Bonus', patterns = {'avatar:%s*magic burst bonus%s*%+?(%d+)%%?'} },
    { stat = 'Avatar: TP Bonus', patterns = {'avatar:%s*tp bonus%s*%+?(%d+)'} },
    { stat = 'Blood Boon', patterns = {'["\']?blood boon["\']?%s*%+?(%d+)'} },
    { stat = 'Blood Pact ability delay', patterns = {'["\']?blood pact["\']? ability delay%s*%-?(%d+)'} },
    { stat = 'Blood Pact Damage', patterns = {'["\']?blood pact["\']? damage%s*%+?(%d+)', '["\']?blood pact dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Blue Magic Spellcasting Time', patterns = {'["\']?blue magic spellcasting time["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Blue Magic Skill', patterns = {'["\']?blue magic skill["\']?%s*%+?(%d+)'} },
    { stat = 'Burst Affinity recast time', patterns = {'["\']?burst affinity["\']? recast time%s*%-?(%d+)%%?'} },
    { stat = 'Chain Affinity recast time', patterns = {'["\']?chain affinity["\']? recast time%s*%-?(%d+)%%?'} },
    { stat = 'Chakra', patterns = {'["\']?chakra["\']?%s*%+?(%d+)'} },
    { stat = 'Chance of double damage', patterns = {'chance of double damage%s*%+?(%d+)%%?'} },
    { stat = 'Chance of doubling Blood Pact status', patterns = {'chance of doubling ["\']?blood pact["\']? status%s*%+?(%d+)%%?'} },
    { stat = 'Chance of follow-up attack', patterns = {'chance of follow%-up attack%s*%+?(%d+)%%?'} },
    { stat = 'Chance of successful block', patterns = {'chance of successful block%s*%+?(%d+)'} },
    { stat = 'CHR', patterns = {'["\']?chr["\']?%s*%+?(%d+)'} },
    { stat = 'Conserve MP', patterns = {'["\']?conserve mp["\']?%s*%+?(%d+)'} },
    { stat = 'Counter', patterns = {'["\']?counter["\']?%s*%+?(%d+)'} },
    { stat = 'Counter Damage', patterns = {'["\']?counter["\']? damage%s*%+?(%d+)%%?'} },    
    { stat = 'Critical hit damage', patterns = {'critical hit damage%s*%+?(%d+)%%?'} },
    { stat = 'Critical Hit Rate', patterns = {'["\']?critical hit rate["\']?%s*%+?(%d+)%%?', '["\']?crit%.%s*hit rate["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Cure effect received', patterns = {'["\']?cure["\']? effect received%s*%+?(%d+)%%?'} },
    { stat = 'Cure Potency', patterns = {'["\']?cure["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Cure Potency II', patterns = {'["\']?cure["\']? potency ii%s*%+?(%d+)%%?'} },
    { stat = 'Cure Spellcasting Time', patterns = {'["\']?cure["\']? spellcasting time%s*%-?(%d+)%%?'} },
    { stat = 'Cursna', patterns = {'["\']?cursna["\']?%s*%+?(%d+)'} },
    { stat = 'Cursna received', patterns = {'potency of %p?cursna%p? effects? received%s*%+?(%d+)', '%p?cursna%p? effects? received%s*%+?(%d+)', '%p?cursna%p? received%s*%+?(%d+)'} },
    { stat = 'Dagan potency', patterns = {'["\']?dagan["\']? potency%s*%+?(%d+)%%?'} },    
    { stat = 'Daken', patterns = {'["\']?daken["\']?%s*%+?(%d+)'} },
    { stat = 'Dark Magic Skill', patterns = {'["\']?dark magic skill["\']?%s*%+?(%d+)'} },
    { stat = 'Damage', patterns = {'["\']?damage["\']?%s*:%s*%+?(%d+)', 'dmg%.?%s*:%s*%+?(%d+)'} },
    { stat = 'Damage Taken', patterns = {'damage%s+taken[^%d%+%-]*([%+%-]?%s*%d+)%%?', 'dt[^%d%+%-]*([%+%-]?%s*%d+)%%?'} },
    { stat = 'Defense', patterns = {'["\']?defense["\']?%s*%+?(%d+)', '["\']?def%.["\']?%s*%+?(%d+)', '["\']?def["\']?%s*:%s*(%d+)', '["\']?def["\']?%s*%+?(%d+)'} },
    { stat = 'DEX', patterns = {'["\']?dex["\']?%s*%+?(%d+)'} },
    { stat = 'Dispel', patterns = {'["\']?dispel["\']?%s*%+?(%d+)'} },
    { stat = 'Double Attack', patterns = {'double%s+attack[^%d%+%-]*[%+%-]?%s*(%d+)%%?', 'dbl%.%s*atk%.[^%d%+%-]*[%+%-]?%s*(%d+)%%?'} },
    { stat = 'Double Attack Damage', patterns = {'["\']?double attack["\']? damage%s*%+?(%d+)%%?'} },    
    { stat = 'Double Shot', patterns = {'["\']?double shot["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Double Shot Damage', patterns = {'["\']?double shot["\']? damage%s*%+?(%d+)', '["\']?double shot dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Drain and Aspir Potency', patterns = {'["\']?drain["\']? and ["\']?aspir["\']? potency%s*%+?(%d+)'} },
    { stat = 'Drain potency', patterns = {'["\']?drain["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Dual Wield', patterns = {'["\']?dual wield["\']?%s*%+?(%d+)'} },
    { stat = 'Elemental Magic Recast Delay', patterns = {'["\']?elemental magic recast delay["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Elemental Magic Skill', patterns = {'["\']?elemental magic skill["\']?%s*%+?(%d+)'} },
    { stat = 'Elemental weapon skill damage', patterns = {'elemental weapon skill damage%s*%+?(%d+)%%?'} },
    { stat = 'Enemy Critical Hit Rate', patterns = {'["\']?enemy critical hit rate["\']?%s*([%+%-]?%d+)%%?'} },
    { stat = 'Enfeebling Magic Duration', patterns = {'["\']?enfeebling magic effect duration["\']?%s*%+?(%d+)%%?', '["\']?enf%. mag%. eff%. dur%.["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Enfeebling Magic Effect', patterns = {'["\']?enfeebling magic effect["\']?%s*%+?(%d+)'} },
    { stat = 'Enfeebling Magic Skill', patterns = {'["\']?enfeebling magic skill["\']?%s*%+?(%d+)', 'enf%. mag%. skill%s*%+?(%d+)'} },
    { stat = 'Enhancing Magic Duration', patterns = {'["\']?enhancing magic effect duration["\']?%s*%+?(%d+)%%?', '["\']?enhancing magic duration["\']?%s*%+?(%d+)%%?', '["\']?enh%. mag%. eff%. dur%.["\']?%s*%+?(%d+)'} },
    { stat = 'Enhancing Magic Skill', patterns = {'["\']?enhancing magic skill["\']?%s*%+?(%d+)'} },
    { stat = 'Enmity', patterns = {'["\']?enmity["\']?%s*([%+%-]%s*%d+)'} },
    { stat = 'Enmity for each Utsusemi', patterns = {'enmity%s*%+?(%d+)%s*for each utsusemi'} },
    { stat = 'Erase', patterns = {'["\']?erase["\']?%s*%+?(%d+)'} },
    { stat = 'Evasion', patterns = {'["\']?evasion["\']?%s*%+?(%d+)', '["\']?eva%.["\']?%s*%+?(%d+)'} },
    { stat = 'Fast Cast', patterns = {'["\']?fast cast["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Flourish recast time', patterns = {'["\']?flourish["\']? recast time%s*%-?(%d+)%%?'} },
    { stat = 'fTP Mod', patterns = {'ftp mod%s*%+?(%d+%.?%d*)'} },
    { stat = 'Haste', patterns = {'["\']?haste["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Healing Magic Skill', patterns = {'["\']?healing magic skill["\']?%s*%+?(%d+)'} },
    { stat = 'Healing magic recast delay', patterns = {'healing magic recast delay%s*%-?(%d+)%%?'} },
    { stat = 'Helix Effect Duration', patterns = {'["\']?helix eff%. duration["\']?%s*%+?(%d+)%%?', '["\']?helix effect duration["\']?%s*%+?(%d+)%%?'} },
    { stat = 'HP', patterns = {'["\']?hp["\']?%s*%+?(%d+)'} },
    { stat = 'Inquartata', patterns = {'["\']?inquartata["\']?%s*%+?(%d+)'} },
    { stat = 'INT', patterns = {'["\']?int["\']?%s*%+?(%d+)'} },
    { stat = 'Kick Attacks', patterns = {'["\']?kick attacks["\']?%s*%+?(%d+)'} },
    { stat = 'Luopan Duration', patterns = {'["\']?luopan duration["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Luopan: Damage Taken', patterns = {'luopan:%s*absorbs damage%s*%+?(%d+)%%?', 'luopan:%s*damage taken%s*([%+%-]?%d+)%%?'} },
    { stat = 'Magic Accuracy', patterns = {'["\']?mag%.%s*acc%.?["\']?%s*%+?(%d+)', '["\']?magic accuracy["\']?%s*%+?(%d+)', '["\']?m%.acc%.["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Attack Bonus', patterns = {'mag%.%s*atk%.%s*bns%.[^%d%+%-]*[%+%-]?%s*(%d+)', 'magic%s+attack%s+bonus[^%d%+%-]*[%+%-]?%s*(%d+)', 'magic%s+atk%.%s+bonus[^%d%+%-]*[%+%-]?%s*(%d+)'} },
    { stat = 'Magic Burst Accuracy', patterns = {'["\']?magic burst accuracy["\']?%s*%+?(%d+)', '["\']?magic burst acc%.["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Burst Damage', patterns = {'magic[^%w]+burst[^%w]+damage.-([%+%-]?%s*%d+)%%?', 'magic[^%w]+burst[^%w]+dmg%..-([%+%-]?%s*%d+)%%?'} },
    { stat = 'Magic Burst Damage II', patterns = {'["\']?magic burst damage ii["\']?%s*%+?(%d+)%%?', '["\']?magic burst dmg%. ii["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Magic Critical Hit Rate', patterns = {'["\']?magic critical hit rate["\']?%s*%+?(%d+)%%?', '["\']?mag%.%s*crit%.%s*hit rate["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Magic Damage', patterns = {'["\']?magic damage["\']?%s*%+?(%d+)', '["\']?mag%.%s*dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'Magic Damage Taken', patterns = {'magic%s+damage%s+taken[^%d%+%-]*([%+%-]?%s*%d+)%%?', 'magic%s+dmg%.%s*taken[^%d%+%-]*([%+%-]?%s*%d+)%%?', 'mag%.%s*dmg%.%s*taken[^%d%+%-]*([%+%-]?%s*%d+)%%?', 'mdt[^%d%+%-]*([%+%-]?%s*%d+)%%?'} },
    { stat = 'Magic Def. Bonus', patterns = {'mag%.%s*def%.%s*bns%.[^%d]*([%+%-]?%s*%d+)', 'magic%s+def%.%s+bonus[^%d]*([%+%-]?%s*%d+)', 'm%.%s*def%.%s*b%.?[^%d]*([%+%-]?%s*%d+)', 'mdb[^%d]*([%+%-]?%s*%d+)'} },
    { stat = 'Magic Evasion', patterns = {'["\']?magic evasion["\']?%s*%+?(%d+)', '["\']?mag%.%s*evasion["\']?%s*%+?(%d+)', '["\']?mag%.%s*eva%.["\']?%s*%+?(%d+)', '["\']?meva["\']?%s*%+?(%d+)'} },
    { stat = 'Mana Wall', patterns = {'["\']?mana wall["\']?%s*%+?(%d+)%%?'} },
    { stat = 'MND', patterns = {'["\']?mnd["\']?%s*%+?(%d+)'} },
    { stat = 'Movement Speed', patterns = {'["\']?movement speed["\']?%s*%+?(%d+)%%?'} },
    { stat = 'MP', patterns = {'["\']?mp["\']?%s*%+?(%d+)'} },
    { stat = 'Myrkr potency', patterns = {'["\']?myrkr["\']? potency%s*%+?(%d+)%%?'} },    
    { stat = 'Ninjutsu casting time', patterns = {'ninjutsu casting time%s*%-?(%d+)%%?'} },    
    { stat = 'Ninjutsu recast time', patterns = {'ninjutsu recast time%s*%-?(%d+)%%?'} },
    { stat = 'Occ. quickens spellcasting', patterns = {'["\']?occ%. quickens spellcasting["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Parrying Skill', patterns = {'["\']?parrying skill["\']?%s*%+?(%d+)'} },
    { stat = 'Pet: Accuracy', patterns = {'pet:%s*accuracy%s*%+?(%d+)', 'pet:%s*acc%.%s*%+?(%d+)'} },
    { stat = 'Pet: All Attr.', patterns = {'pet:%s*all attr%.%s*%+?(%d+)'} },
    { stat = 'Pet: Attack', patterns = {'pet:%s*attack%s*%+?(%d+)', 'pet:%s*atk%.%s*%+?(%d+)'} },
    { stat = 'Pet: Chance of double damage', patterns = {'pet:%s*chance of double damage%s*%+?(%d+)%%?'} },
    { stat = 'Pet: Damage Taken', patterns = {'pet:%s*damage%s+taken[^%d%+%-]*([%+%-]?%s*%d+)%%?'} },
    { stat = 'Pet: DMG', patterns = {'pet:%s*dmg:%s*%+?(%d+)%%?', 'pet:%s*damage:%s*%+?(%d+)%%?'} },
    { stat = 'Pet: Double Attack', patterns = {'pet:%s*["\']?double attack["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Pet: Enmity', patterns = {'pet:%s*enmity%s*([%+%-]?%d+)'} },
    { stat = 'Pet: Evasion', patterns = {'pet:%s*evasion%s*%+?(%d+)', 'pet:%s*eva%.%s*%+?(%d+)'} },
    { stat = 'Pet: Haste', patterns = {'pet:%s*haste%s*%+?(%d+)%%?'} },
    { stat = 'Pet: INT', patterns = {'pet:%s*int%s*%+?(%d+)'} },
    { stat = 'Pet: Mag. Acc.', patterns = {'pet:%s*mag%.%s*acc%.%s*%+?(%d+)', 'pet:%s*magic accuracy%s*%+?(%d+)'} },
    { stat = 'Pet: Magic Evasion', patterns = {'pet:%s*magic evasion%s*%+?(%d+)', 'pet:%s*mag%.%s*eva%.%s*%+?(%d+)'} },
    { stat = 'Pet: MP', patterns = {'pet:%s*mp%s*%+?(%d+)'} },
    { stat = 'Pet: Ranged Accuracy', patterns = {'pet:%s*rng%.%s*acc%.?%s*%+?(%d+)', 'pet:%s*ranged accuracy%s*%+?(%d+)'} },
    { stat = 'Pet: Regen', patterns = {'pet:%s*regen%s*%+?(%d+)'} },
    { stat = 'Pet: VIT', patterns = {'pet:%s*vit%s*%+?(%d+)'} },
    { stat = 'Phalanx', patterns = {'["\']?phalanx["\']?%s*received%s*%+?(%d+)', '["\']?phalanx["\']?%s*%+?(%d+)'} },
    { stat = 'Phantom Roll', patterns = {'["\']?phantom roll["\']?%s*%+?(%d+)'} },
    { stat = 'Phantom Roll duration', patterns = {'["\']?phantom roll["\']? effect duration%s*%+?(%d+)'} },
    { stat = 'Phantom Roll XI HP/MP', patterns = {'["\']?phantom roll xi["\']?: recover hp and mp%s*%+?(%d+)%%?'} },
    { stat = 'Physical Damage Limit', patterns = {'["\']?physical damage limit["\']?%s*%+?(%d+)%%?', '["\']?pdl["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Physical Damage Taken', patterns = {'physical[^%w]+damage[^%w]+taken.-([%+%-]?%s*%d+)%%?', 'phys%.%s*dmg%.%s*taken.-([%+%-]?%s*%d+)%%?', 'pdt.-([%+%-]?%s*%d+)%%?'} },
    { stat = 'Physical Damage Taken II', patterns = {'physical[^%w]+damage[^%w]+taken[^%w]+ii[^%d]*([%+%-]?%s*%d+)%%?', 'phys%.%s*dmg%.%s*taken[^%w]+ii[^%d]*([%+%-]?%s*%d+)%%?', 'pdt[^%w]+ii[^%d]*([%+%-]?%s*%d+)%%?'} },
    { stat = 'Quadruple Attack', patterns = {'quadruple%s+attack[^%d%+%-]*[%+%-]?%s*(%d+)%%?', 'quad%.%s*atk%.[^%d%+%-]*[%+%-]?%s*(%d+)%%?'} },
    { stat = 'Quick Magic', patterns = {'["\']?quick magic["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Ranged Accuracy', patterns = {'["\']?rng%.%s*acc%.?["\']?%s*%+?(%d+)', '["\']?ranged accuracy["\']?%s*%+?(%d+)'} },
    { stat = 'Ranged Attack', patterns = {'["\']?rng%.%s*atk%.?["\']?%s*%+?(%d+)', '["\']?ranged attack["\']?%s*%+?(%d+)'} },
    { stat = 'Rapid Shot', patterns = {'["\']?rapid shot["\']?%s*%+?(%d+)'} },
    { stat = 'Recycle', patterns = {'["\']?recycle["\']?%s*%+?(%d+)'} },
    { stat = 'Refresh', patterns = {'["\']?refresh["\']?%s*%+?(%d+)'} },
    { stat = 'Refresh Potency', patterns = {'["\']?refresh["\']? potency%s*%+?(%d+)'} },
    { stat = 'Regain', patterns = {'["\']?regain["\']?%s*%+?(%d+)'} },
    { stat = 'Regen', patterns = {'["\']?regen["\']?%s*%+?(%d+)'} },
    { stat = 'Regen Effect Duration', patterns = {'["\']?regen["\']? effect duration%s*%+?(%d+)', '["\']?regen["\']? duration%s*%+?(%d+)'} },
    { stat = 'Regen effects received', patterns = {'potency of ["\']?regen["\']? effects received%s*%+?(%d+)'} },
    { stat = 'Regen Potency', patterns = {'["\']?regen["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Resist Bind', patterns = {'["\']?resist bind["\']?%s*%+?(%d+)'} },
    { stat = 'Resist Charm', patterns = {'["\']?resist charm["\']?%s*%+?(%d+)'} },
    { stat = 'Resist Gravity', patterns = {'["\']?resist gravity["\']?%s*%+?(%d+)'} },
    { stat = 'Resist Petrify', patterns = {'["\']?resist petrify["\']?%s*%+?(%d+)'} },
    { stat = 'Resist Silence', patterns = {'["\']?resist silence["\']?%s*%+?(%d+)'} },
    { stat = 'Resist Sleep', patterns = {'["\']?resist sleep["\']?%s*%+?(%d+)'} },
    { stat = 'Savage Blade Damage', patterns = {'savage%s+blade.-damage.-([%+%-]?%s*%d+)%%?'} },
    { stat = 'Sekkanoki recast time', patterns = {'["\']?sekkanoki["\']? recast time%s*%-?(%d+)%%?'} },
    { stat = 'Sekkanoki: Weapon Skill Damage', patterns = {'["\']?sekkanoki["\']?: weapon skill damage%s*%+?(%d+)%%?'} },
    { stat = 'Skillchain Bonus', patterns = {'skillchain[^%w]+bonus.-([%+%-]?%s*%d+)'} },
    { stat = 'Skillchain Damage', patterns = {'["\']?skillchain dmg%.["\']?%s*%+?(%d+)%%?', '["\']?skillchain damage["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Snapshot', patterns = {'["\']?snapshot["\']?%s*%+?(%d+)'} },
    { stat = 'Song Effect Duration', patterns = {'["\']?song effect duration["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Song effects: Double Attack', patterns = {'song effects: ["\']?double attack["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Song spellcasting time', patterns = {'song spellcasting time%s*%-?(%d+)%%?'} },
    { stat = 'Spell Interruption Rate', patterns = {'["\']?spell interruption rate down["\']?%s*%-?(%d+)%%?', '["\']?spell interruption rate["\']?%s*%-?(%d+)%%?', '["\']?sird["\']?%s*%-?(%d+)%%?'} },
    { stat = 'Step duration', patterns = {'["\']?step["\']? duration%s*%+?(%d+)'} },
    { stat = 'Stoneskin', patterns = {'["\']?stoneskin["\']?%s*%+?(%d+)'} },
    { stat = 'Stoneskin casting time', patterns = {'["\']?stoneskin["\']? casting time%s*([%+%-]?%d+)%%?'} },
    { stat = 'Store TP', patterns = {'store[^%w]+tp[^%d]*([%+%-]?%s*%d+)'} },
    { stat = 'STR', patterns = {'["\']?str["\']?%s*%+?(%d+)'} },
    { stat = 'String Instrument Skill', patterns = {'["\']?string instrument skill["\']?%s*%+?(%d+)'} },
    { stat = 'Subtle Blow', patterns = {'["\']?subtle blow["\']?%s*%+?(%d+)'} },
    { stat = 'Subtle Blow II', patterns = {'["\']?subtle blow ii["\']?%s*%+?(%d+)'} },
    { stat = 'Sword Enhancement Spell Damage', patterns = {'["\']?sword enhancement spell damage["\']?%s*%+?(%d+)%%?'} },
    { stat = 'TP Bonus', patterns = {'["\']?tp bonus["\']?%s*%+?(%d+)'} },
    { stat = 'TP during evasion', patterns = {'tp during evasion%s*%+?(%d+)'} },
    { stat = 'TP Gained when landing critical hits', patterns = {'tp gained when landing critical hits%s*%+?(%d+)'} },
    { stat = 'Treasure Hunter', patterns = {'["\']?treasure hunter["\']?%s*%+?(%d+)', '%s+th%s*%+?(%d+)', '^th%s*%+?(%d+)'} },
    { stat = 'Triple Attack', patterns = {'triple%s+attack[^%d%+%-]*[%+%-]?%s*(%d+)%%?', 'tri%.%s*atk%.[^%d%+%-]*[%+%-]?%s*(%d+)%%?'} },
    { stat = 'Triple Attack Damage', patterns = {'triple[^%w]+attack[^%w]+damage.-([%+%-]?%s*%d+)', 'triple[^%w]+attack[^%w]+dmg%..-([%+%-]?%s*%d+)'} },
    { stat = 'Triple Shot', patterns = {'["\']?triple shot["\']?%s*%+?(%d+)%%?'} },
    { stat = 'Triple Shot Damage', patterns = {'["\']?triple shot["\']? damage%s*%+?(%d+)', '["\']?triple shot dmg%.["\']?%s*%+?(%d+)'} },
    { stat = 'True Shot', patterns = {'["\']?true shot["\']?%s*%+?(%d+)'} },
    { stat = 'VIT', patterns = {'["\']?vit["\']?%s*%+?(%d+)'} },
    { stat = 'Vivacious Pulse potency', patterns = {'["\']?vivacious pulse["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Waltz Potency', patterns = {'["\']?waltz["\']? potency%s*%+?(%d+)%%?'} },
    { stat = 'Weapon Skill Accuracy', patterns = {'["\']?weapon skill accuracy["\']?%s*%+?(%d+)'} },
    { stat = 'Weapon Skill Damage', patterns = {'weapon[^%w]+skill[^%w]+damage[^%d]*([%+%-]?%s*%d+)%%?'} },
    { stat = 'Wind Instrument Skill', patterns = {'["\']?wind instrument skill["\']?%s*%+?(%d+)'} },
    { stat = 'Wyvern: Damage Taken', patterns = {'wyvern:%s*damage taken%s*([%+%-]?%d+)%%?'} },
    { stat = 'Wyvern: HP', patterns = {'wyvern:%s*hp%s*%+?(%d+)'} },
    { stat = 'Wyvern: Lv.', patterns = {'wyvern:%s*lv%.%s*%+?(%d+)'} }
}

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

local base_stat_order = { 'STR', 'DEX', 'VIT', 'AGI', 'INT', 'MND', 'CHR' }

local section3_order = {}
local function is_in_list(val, lst)
    for _, v in ipairs(lst) do if v == val then return true end end
    return false
end

for _, s in ipairs(stat_sequence) do
    if not is_in_list(s.stat, section1_order) and not is_in_list(s.stat, section2_order) 
       and not is_in_list(s.stat, section4_order) and not is_in_list(s.stat, base_stat_order) then
        table.insert(section3_order, s.stat)
    end
end

local parse_sequence = {}
for _, v in ipairs(stat_sequence) do table.insert(parse_sequence, v) end
table.sort(parse_sequence, function(a, b) 
    local score_a = string.len(a.patterns[1])
    local score_b = string.len(b.patterns[1])
    if a.stat:match("^Pet:") or a.stat:match("^Avatar:") or a.stat:match("^Automaton:") then score_a = score_a + 1000 end
    if b.stat:match("^Pet:") or b.stat:match("^Avatar:") or b.stat:match("^Automaton:") then score_b = score_b + 1000 end
    return score_a > score_b 
end)

local rema_ids = {
    [20509]=true, [20583]=true, [20685]=true, [21683]=true, [21750]=true, [21756]=true, [21808]=true, [21857]=true, [21906]=true, [21954]=true, [21077]=true, [22060]=true, [22129]=true, [22140]=true,
    [20512]=true, [20587]=true, [20689]=true, [21684]=true, [21752]=true, [21758]=true, [21810]=true, [21859]=true, [21908]=true, [21956]=true, [21079]=true, [22064]=true, [22130]=true, [22142]=true,
    [20515]=true, [20594]=true, [20695]=true, [21694]=true, [21753]=true, [20843]=true, [20890]=true, [20935]=true, [20977]=true, [21025]=true, [21082]=true, [21147]=true, [22131]=true, [22143]=true,
    [21757]=true, [20510]=true, [21078]=true, [22062]=true, [20686]=true, [20585]=true, [20687]=true, [21809]=true, [21751]=true, [20586]=true, [22139]=true, [21955]=true, [21907]=true, [21858]=true, [22063]=true, [20688]=true, [22141]=true, [20511]=true, [20584]=true, [22061]=true, [21080]=true, [21685]=true
}

local equip_slots_left = { 'main', 'sub', 'head', 'body' }
local equip_slots_center = { 'hands', 'legs', 'feet', 'waist' }
local equip_slots_right = { 'ammo', 'range', 'neck', 'left_ear', 'right_ear', 'left_ring', 'right_ring', 'back' } 
local equip_slots = {}
for _, slot in ipairs(equip_slots_left) do table.insert(equip_slots, slot) end
for _, slot in ipairs(equip_slots_center) do table.insert(equip_slots, slot) end
for _, slot in ipairs(equip_slots_right) do table.insert(equip_slots, slot) end

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

return {
    stat_sequence = stat_sequence,
    parse_sequence = parse_sequence,
    section1_order = section1_order,
    section2_order = section2_order,
    section3_order = section3_order,
    section4_order = section4_order,
    base_stat_order = base_stat_order,
    rema_ids = rema_ids,
    equip_slots_left = equip_slots_left,
    equip_slots_center = equip_slots_center,
    equip_slots_right = equip_slots_right,
    equip_slots = equip_slots,
    special_stats_map = special_stats_map,
    char_stats = char_stats
}