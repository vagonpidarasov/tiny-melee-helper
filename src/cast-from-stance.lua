TinyMeleeHelper.stanceNumberMap = {
    [0] = TinyMeleeHelper.spells.BattleStance,
    [1] = TinyMeleeHelper.spells.BattleStance,
    [2] = TinyMeleeHelper.spells.DefenceStance,
    [3] = TinyMeleeHelper.spells.BerserkStance,
};

function TinyMeleeHelper:castSpellFromStance(spell)
    self:cancelWhirlwind();

    if (self:isStanceActive(spell.stance)) then
        self:castSpell(spell);
    else
        self:castSpell(self.stanceNumberMap[spell.stance]);
        self:castSpellAsync(spell);
    end
end
