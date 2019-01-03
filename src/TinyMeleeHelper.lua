TinyMeleeHelper = {};

function TinyMeleeHelper:resolveSpells()
    for _, spell in pairs(self.spells) do
        spell.name = GetSpellInfo(spell.id);
        if spell.stance == nil then spell.stance = 0 end
        if spell.target ~= true then spell.target = false end
    end
end

function TinyMeleeHelper:resolveItems()
    for _, item in pairs(self.items) do
        item.name = GetItemInfo(item.id);
    end
end

function TinyMeleeHelper:runMacroText(macroText)
--    RunMacroText(macroText, true);
    print('macroText', ':', macroText);
end

function TinyMeleeHelper:isUsableSpell(spell)
    return (IsUsableSpell(spell.name) == 1);
end

function TinyMeleeHelper:startAttack()
    self:runMacroText('/startattack');
end

function TinyMeleeHelper:castSpell(spell)
    if (self:isUsableSpell(spell.name)) then
        self:runMacroText('/cast ' .. spell.name);
    end
end

function TinyMeleeHelper:equipItem(item)
    self:runMacroText('/equip ' .. item.name);
end

function TinyMeleeHelper:isTargetHostile()
    return (UnitExists('target') and not UnitIsFriend('player', 'target'));
end

function TinyMeleeHelper:isTargetFriendly()
    return (UnitExists('target') and UnitIsFriend('player', 'target'));
end

function TinyMeleeHelper:getSpellCooldown(spell)
    return select(2, GetSpellCooldown(spell.name));
end

function TinyMeleeHelper:isInCombat()
    return UnitAffectingCombat('player');
end

function TinyMeleeHelper:isMounted()
    return (IsMounted() == 1);
end

function TinyMeleeHelper:hasEnoughRage(power)
    return (UnitPower('player') >= power);
end

function TinyMeleeHelper:cancelWhirlwind()
    CancelUnitBuff('player', self.spells.Whirlwind.name);
end
