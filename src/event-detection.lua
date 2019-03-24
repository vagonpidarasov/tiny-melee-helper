function TinyMeleeHelper:isPlayerEnteringWorldEvent(event, ...)
    return event == 'PLAYER_ENTERING_WORLD';
end

function TinyMeleeHelper:isUnitInventoryChangeEvent(event, ...)
    return event == 'UNIT_INVENTORY_CHANGED';
end

function TinyMeleeHelper:isUnitRageEvent(event, ...)
    return event == 'UNIT_RAGE';
end

function TinyMeleeHelper:isSwingEvent(event, ...)
    local eventType = select(2, ...);
    local sourceGUID = select(3, ...);
    local spellId = select(9, ...);
    local playerGUID = UnitGUID('player');
    local hs = self.spells.HeroicStrike;

    local swingDamage = (
        event == 'COMBAT_LOG_EVENT_UNFILTERED' and
            eventType == 'SWING_DAMAGE' and
            sourceGUID == playerGUID
    );

    local heroicDamage = (
        event == 'COMBAT_LOG_EVENT_UNFILTERED' and
            eventType == 'SPELL_DAMAGE' and
            sourceGUID == playerGUID and
            spellId == hs.id
    )

    return swingDamage or heroicDamage;
end
