TinyMeleeHelper.heroicStrike = {
    nextCastTime = 0,
    castTriggered = false,
};

function TinyMeleeHelper:resolveHeroicStrikeCastTime()
    local attackSpeed = UnitAttackSpeed('player');
    local timeout = self.config.heroicStrikeCastTimeout;
    self.heroicStrike.nextCastTime = GetTime() + attackSpeed - timeout;
    self.heroicStrike.castTriggered = false;
end

-- api method is triggered each OnUpdate event
function TinyMeleeHelper:castHeroicStrike()
    local hs = self.spells.HeroicStrike;

    if (GetTime() < self.heroicStrike.nextCastTime) then return end
    if (self.heroicStrike.castTriggered) then return end
    if not self:isInCombat() then return end
    if not self:isTargetHostile() then return end
    if not self:isSpellUsable(hs) then return end
    if not self:hasEnoughRage(hs.rage) then return end
    if self:isMounted() then return end

    self:castSpell(hs);
    self.heroicStrike.castTriggered = true;
end
