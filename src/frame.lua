function THMFrameOnLoad(frame, event)
    TinyMeleeHelper:resolveSpells();
    TinyMeleeHelper:resolveItems();
end

function TMHFrameOnUpdate(frame, event)
    TinyMeleeHelper:castHeroicStrike();
    TinyMeleeHelper:castAsyncSpell();
end

function TMHFrameOnEvent(frame, event, ...)
    local eventType = select(2, ...);
    local sourceGUID = select(4, ...);
    local playerGUID = UnitGUID('player');
    local attackSpeed = UnitAttackSpeed('player');

    if (
        event == 'COMBAT_LOG_EVENT_UNFILTERED' and
        eventType == 'SWING_DAMAGE' and
        sourceGUID == playerGUID
    ) then
        print('next swing in', attackSpeed);
    end

    if (event == 'UNIT_INVENTORY_CHANGED') then
        print('UNIT_INVENTORY_CHANGED');
    end
end
