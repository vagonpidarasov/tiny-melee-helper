function THMFrameOnLoad(frame, event)
    TinyMeleeHelper:resolveSpells();
    TinyMeleeHelper:resolveItems();
end

function TMHFrameOnUpdate(frame, event)
    TinyMeleeHelper:castHeroicStrike();
    TinyMeleeHelper:castAsyncSpell();
end

function TMHFrameOnEvent(frame, event, ...)
    if TinyMeleeHelper:isSwingEvent(event, ...) then
        TinyMeleeHelper:resolveHeroicStrikeCastTime();
    end

    if (TinyMeleeHelper:isUnitInventoryChangeEvent(event, ...)) then
        TinyMeleeHelper:resolveHeroicStrikeCastTime();
    end
end
