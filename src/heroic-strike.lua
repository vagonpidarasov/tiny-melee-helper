TinyMeleeHelper.heroicStrike = {
    castTriggered = false,
};

function TinyMeleeHelper:triggerHeroicStrike()
    self.heroicStrike.castTriggered = true;
end

function TinyMeleeHelper:resetHeroicStrike()
    self.heroicStrike.castTriggered = false;
end

function TinyMeleeHelper:checkHeroicStrike()
    local hs = self.spells.HeroicStrike;
    if self:hasEnoughRage(hs.rage) and not self.heroicStrike.castTriggered then
        self:showHeroicStrikeIcon();
    else
        self:hideHeroicStrikeIcon();
    end
end
