TinyMeleeHelper.asyncCast = {
    spell = nil,
    time = 0,
};

-- api method is used to cast spell asynchronously
function TinyMeleeHelper:castSpellAsync(spell)
    if (self.asyncCast.spell == nil) then
        self.asyncCast.spell = spell;
        self.asyncCast.time = GetTime();
    end
end

function TinyMeleeHelper:resetSpellAsync()
    self.asyncCast.spell = nil;
    self.asyncCast.time = 0;
end

function TinyMeleeHelper:isAsyncSpellInvalid()
    if (self.asyncCast.time + self.config.asyncCastTimeout < GetTime()) then
        return true;
    end

    local spell = self.asyncCast.spell;
    local spellCooldown = self:isSpellCooldown(spell);
    local _, spellNoMana = self:isSpellUsable(spell);
    local targetInvalid;

    if (spell.target) then
        targetInvalid = self:isTargetFriendly();
    else
        targetInvalid = false;
    end

    if (spellCooldown or targetInvalid or spellNoMana) then
        return true;
    end

    return false;
end

function TinyMeleeHelper:isAsyncSpellReady()
    return self:isSpellUsable(self.asyncCast.spell);
end

-- api method is triggered each OnUpdate event
function TinyMeleeHelper:castAsyncSpell()
    if (self.asyncCast.spell == nil) then return end

    if (self:isAsyncSpellInvalid()) then
        self:resetSpellAsync();
    end

    if (self.asyncCast.spell == nil) then return end

    if (self:isAsyncSpellReady()) then
        self:castSpell(self.asyncCast.spell);
        self:resetSpellAsync();
    end
end
