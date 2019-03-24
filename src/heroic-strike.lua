TinyMeleeHelper.heroicStrike = {
    castTriggered = false,
};

function TinyMeleeHelper:resolveHeroicStrikeCastTime()
    self.heroicStrike.castTriggered = false;
end

function TinyMeleeHelper:castHeroicStrike()
    local hs = self.spells.HeroicStrike;

    if (self.heroicStrike.castTriggered) then return end
    if not self:isInCombat() then return end
    if not self:isTargetHostile() then return end
    if not self:isSpellUsable(hs) then return end
    if not self:hasEnoughRage(hs.rage) then return end

    self:showHeroicStrikeIcon();
    self.heroicStrike.castTriggered = true;
end
