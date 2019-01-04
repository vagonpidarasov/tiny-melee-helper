TinyMeleeHelper.hsLastCastTime = 0;

-- api method is triggered each OnUpdate event
function TinyMeleeHelper:castHeroicStrike()
    local hs = self.spells.HeroicStrike;

    if (GetTime() - self.hsLastCastTime < hs.delay) then return end
    if not self:isInCombat() then return end
    if not self:isTargetHostile() then return end
    if not self:isSpellUsable(hs) then return end
    if not self:hasEnoughRage(hs.rage) then return end
    if self:isMounted() then return end

    self:castSpell(hs);
    self.hsLastCastTime = GetTime();
end
