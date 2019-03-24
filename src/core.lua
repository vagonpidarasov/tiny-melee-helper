TinyMeleeHelper = {
    config = {},
};

function TinyMeleeHelper:resolveSpells()
    for _, spell in pairs(self.spells) do
        local name, _, icon = GetSpellInfo(spell.id)
        spell.name = name;
        spell.icon = icon;
        if spell.stance == nil then spell.stance = 0 end
        if spell.target ~= true then spell.target = false end
    end
end

function TinyMeleeHelper:isSpellUsable(spell)
    local spellUsable, spellNoMana = IsUsableSpell(spell.name);
    return (spellUsable == 1), spellNoMana;
end

function TinyMeleeHelper:isTargetHostile()
    return (UnitExists('target') and not UnitIsFriend('player', 'target'));
end

function TinyMeleeHelper:isTargetFriendly()
    return (UnitExists('target') and UnitIsFriend('player', 'target'));
end

function TinyMeleeHelper:isStanceActive(stanceNumber)
    return GetShapeshiftForm() == stanceNumber;
end

function TinyMeleeHelper:isSpellCooldown(spell)
    return select(2, GetSpellCooldown(spell.name)) > 0;
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
