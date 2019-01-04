function TinyMeleeHelper:isPlayerEnteringWorldEvent(event, ...)
    return event == 'PLAYER_ENTERING_WORLD';
end

function TinyMeleeHelper:isUnitInventoryChangeEvent(event, ...)
    return event == 'UNIT_INVENTORY_CHANGED';
end

function TinyMeleeHelper:isSwingEvent(event, ...)
    local eventType = select(2, ...);
    local sourceGUID = select(3, ...);
    local playerGUID = UnitGUID('player');

    return (
        event == 'COMBAT_LOG_EVENT_UNFILTERED' and
        eventType == 'SWING_DAMAGE' and
        sourceGUID == playerGUID
    );
end
