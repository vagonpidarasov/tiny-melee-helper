function TinyMeleeHelper:isPlayerEnteringWorldEvent(event, ...)
    return event == 'PLAYER_ENTERING_WORLD';
end

function TinyMeleeHelper:isUnitInventoryChangeEvent(event, ...)
    return event == 'UNIT_INVENTORY_CHANGED';
end

function TinyMeleeHelper:isUnitRageEvent(event, ...)
    if (event ~= 'UNIT_RAGE') then return false end
    local sourceGUID = select(1, ...);
    local playerGUID = 'player';
    return sourceGUID == playerGUID;
end

function TinyMeleeHelper:isSwingEvent(event, ...)
    if (event ~= 'COMBAT_LOG_EVENT_UNFILTERED') then return false end

    local sourceGUID = select(3, ...);
    local playerGUID = UnitGUID('player');

    if (sourceGUID ~= playerGUID) then return false end

    local hs = self.spells.HeroicStrike;
    local eventType = select(2, ...);
    local spellId = select(9, ...);

    local swingDamage = eventType == 'SWING_DAMAGE';
    local heroicDamage = eventType == 'SPELL_DAMAGE' and spellId == hs.id;

    return swingDamage or heroicDamage;
end
