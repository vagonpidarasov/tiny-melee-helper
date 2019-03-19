function TMHFrameOnUpdate(frame, event)
    TinyMeleeHelper:castHeroicStrike();
    TinyMeleeHelper:castAsyncSpell();
    TinyMeleeHelper:castSweepingStrikes();
end

function TMHFrameOnEvent(frame, event, ...)
    if (TinyMeleeHelper:isPlayerEnteringWorldEvent(event, ...)) then
        TinyMeleeHelper:resolveSpells();
        TinyMeleeHelper:resolveItems();
    end

    if TinyMeleeHelper:isSwingEvent(event, ...) then
        TinyMeleeHelper:resolveHeroicStrikeCastTime();
    end

    if (TinyMeleeHelper:isUnitInventoryChangeEvent(event, ...)) then
        TinyMeleeHelper:resolveHeroicStrikeCastTime();
    end
end

local TMHFrame = CreateFrame('Frame', nil, UIParent);
TMHFrame:RegisterEvent('PLAYER_ENTERING_WORLD');
TMHFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED');
TMHFrame:SetScript('OnEvent', TMHFrameOnEvent)
TMHFrame:SetScript('OnUpdate', TMHFrameOnUpdate)
