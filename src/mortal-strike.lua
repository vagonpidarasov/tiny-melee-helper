function TinyMeleeHelper:castMortalStrike()
    self:startAttack();
    if (self:getSpellCooldown(self.spells.MortalStrike) == 0) then
        self:castSpell(self.spells.MortalStrike);
    else
        self:castSpell(self.spells.Execute);
    end
end
