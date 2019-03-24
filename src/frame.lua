function TMHFrameOnEvent(frame, event, ...)
    if (TinyMeleeHelper:isPlayerEnteringWorldEvent(event, ...)) then
    end

    if TinyMeleeHelper:isSwingEvent(event, ...) then
        TinyMeleeHelper:resetHeroicStrike();
    end

    if (TinyMeleeHelper:isUnitInventoryChangeEvent(event, ...)) then
        TinyMeleeHelper:resetHeroicStrike();
    end

    if (TinyMeleeHelper:isUnitRageEvent(event, ...)) then
        TinyMeleeHelper:checkHeroicStrike();
    end
end

local TMHFrame = CreateFrame('Frame', nil, UIParent);
TMHFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED');
TMHFrame:RegisterEvent('UNIT_RAGE');
TMHFrame:SetScript('OnEvent', TMHFrameOnEvent)
