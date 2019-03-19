TinyMeleeHelper.heroicStrikeFrame = {
    container = nil,
    icon = nil,
};

function TinyMeleeHelper:createHeroicStrikeContainer()
    local frame = CreateFrame('Frame', nil, UIParent);
    frame:SetMovable(true);
    frame:SetWidth(30);
    frame:SetHeight(30);
    frame:SetClampedToScreen(true);
    frame:SetScript('OnMouseDown', function(self, button)
        if button == 'LeftButton' then self:StartMoving() end
    end)
    frame:SetScript('"OnMouseUp', function(self, button)
        if button == 'LeftButton' then self:StopMovingOrSizing() end
    end)
    frame:Show();

    self.heroicStrikeFrame.container = frame;
end


function TinyMeleeHelper:createHeroicStrikeIcon()
    local hs = self.spells.HeroicStrike;
    local parent = self.heroicStrikeFrame.container;
    local frame = CreateFrame('Frame', nil, parent);
    frame:SetWidth(30);
    frame:SetHeight(30);
    frame:SetPoint('CENTER', parent, 'CENTER', 0, 0);
    frame:SetFrameStrata('LOW');

    local texture = frame:CreateTexture(nil, 'BACKGROUND');
    texture:SetAllPoints(true)
    texture:SetTexture(hs.icon)

    self.heroicStrikeFrame.icon = frame;
end

function TinyMeleeHelper:showHeroicStrikeIcon()
    if (self.heroicStrikeFrame.icon ~= nil) then
        self.heroicStrikeFrame.icon:Show()
    end
end

function TinyMeleeHelper:hideHeroicStrikeIcon()
    if (self.heroicStrikeFrame.icon ~= nil) then
        self.heroicStrikeFrame.icon:Hide()
    end
end
