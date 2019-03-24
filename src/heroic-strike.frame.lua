TinyMeleeHelper.heroicStrikeFrame = {
    container = nil,
    icon = nil,
};

function TinyMeleeHelper:createHeroicStrikeContainer()
    local frame = CreateFrame('Frame', nil, UIParent);
    frame:SetPoint('CENTER', UIParent, 'CENTER', 0, -37);
    --frame:SetMovable(true);
    frame:SetWidth(30);
    frame:SetHeight(30);

    local texture = frame:CreateTexture(nil, 'BACKGROUND');
    texture:SetAllPoints(true);
    texture:SetTexture([[Interface\AddOns\TinyMeleeHelper\Normal]]);
    texture:SetTexCoord(0.07, 0.9, 0.07, 0.9);

    frame:SetClampedToScreen(true);
    --frame:SetScript('OnMouseDown', function(self, button)
    --if button == 'LeftButton' then self:StartMoving() end
    --end)
    --frame:SetScript('OnMouseUp', function(self, button)
    --if button == 'LeftButton' then self:StopMovingOrSizing() end
    --end)
    frame:Show();
    self.heroicStrikeFrame.container = frame;
end

function TinyMeleeHelper:createHeroicStrikeIcon()
    local hs = self.spells.HeroicStrike;
    local parent = self.heroicStrikeFrame.container;
    local frame = CreateFrame('Frame', nil, parent);
    frame:SetWidth(20);
    frame:SetHeight(20);
    frame:SetPoint('CENTER', parent, 'CENTER', 0, 0);
    frame:SetFrameStrata('LOW');

    local texture = frame:CreateTexture(nil, 'BACKGROUND');
    texture:SetAllPoints(true);
    texture:SetTexture(hs.icon);
    texture:SetTexCoord(0.07, 0.9, 0.07, 0.9);
    frame:Show();

    self.heroicStrikeFrame.icon = frame;
end

function TinyMeleeHelper:showHeroicStrikeIcon()
    if (self.heroicStrikeFrame.container ~= nil) then
        self.heroicStrikeFrame.container:Show()
    end
end

function TinyMeleeHelper:hideHeroicStrikeIcon()
    if (self.heroicStrikeFrame.container ~= nil) then
        self.heroicStrikeFrame.container:Hide()
    end
end
