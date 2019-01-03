TinyMeleeHelper.castQueue = {};
TinyMeleeHelper.castQueueExpireTime = 0.5;

function TinyMeleeHelper:setSpellQueue(spell)
    self.castQueue[spell.name] = GetTime();
end

function TinyMeleeHelper:isTargetRequired(spellName)
    return self.spellTargetRequired[spellName];
end

function TinyMeleeHelper:resetSpellQueue(spellName)
    self.castQueue[spellName] = 0;
end

function TinyMeleeHelper:isSpellInQueue(spellName)
    return (
        (self.castQueue[spellName] ~= nil) and
        (self.castQueue[spellName] > 0)
    );
end

function TinyMeleeHelper:isSpellExpired(spellName)
    return (
        (self.castQueue[spellName] ~= nil) and
        (self.castQueue[spellName] < GetTime() - self.castQueueExpireTime)
    );
end

function TinyMeleeHelper:castSpellFromQueue(spellName)
    local spellCooldown, targetInvalid, spellUsable, spellNoMana;

    spellCooldown = self:getSpellCooldown(spellName);
    spellUsable, spellNoMana = IsUsableSpell(spellName);

    if (self:isTargetRequired(spellName)) then
        targetInvalid = self:isTargetFriendly();
    else
        targetInvalid = false;
    end

    if ((spellCooldown > 0) or targetInvalid or spellNoMana) then
        self:resetSpellQueue(spellName);
        return;
    end

    if (spellUsable == 1) then
        self:castSpellByName(spellName);
        self:resetSpellQueue(spellName);
    end
end

function TinyMeleeHelper:proceedSpellQueue()
    for spellName, time in pairs(self.castQueue) do
        if (self:isSpellExpired(spellName)) then
            self:resetSpellQueue(spellName);
        end

        if (self:isSpellInQueue(spellName)) then
            self:castSpellFromQueue(spellName);
        end
    end
end


