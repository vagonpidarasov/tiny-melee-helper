TinyMeleeHelper.sweepingStrikes = {
    castTime = 0,
};

-- api method is triggered each OnUpdate event
function TinyMeleeHelper:castSweepingStrikes()
    local spell = self.spells.SwippingStrikes;

    if ((GetTime() - self.sweepingStrikes.castTime) < 0.5) then return end
    if not self:isInCombat() then return end
    if self:isSpellCooldown(spell) then return end
    if not self:isSpellUsable(spell) then return end
    if self:isMounted() then return end

    self:castSpell(spell);
    self.sweepingStrikes.castTime = GetTime();
end
