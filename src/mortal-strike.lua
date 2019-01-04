function TinyMeleeHelper:castMortalStrike()
    self:startAttack();

    if (
        not self:isSpellUsable(self.spells.MortalStrike) and
        not self:isSpellUsable(self.spells.Execute)
    ) then return end

    if (self:isSpellCooldown(self.spells.MortalStrike)) then
        self:castSpell(self.spells.Execute);
    else
        self:castSpell(self.spells.MortalStrike);
    end
end
