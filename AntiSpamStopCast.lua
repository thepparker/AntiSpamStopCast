AntiSpamStopCast = CreateFrame("Frame")
AntiSpamStopCast:RegisterEvent("ADDON_LOADED")
AntiSpamStopCast.SpellCache = {}

function AntiSpamStopCast:ASSpellStopCasting(spell, canceltime)
    --DEFAULT_CHAT_FRAME:AddMessage("Checking cache for " .. spell)
    if (self.SpellCache[spell] == nil) then
        --DEFAULT_CHAT_FRAME:AddMessage(" - Spell is not in cache, stopping cast")
        SpellStopCasting()
        self.SpellCache[spell] = {
            ["ELAPSED"] = 0,
            ["CANCELTIME"] = canceltime
         }
    end
end

function AntiSpamStopCast.Update_ASCoolDown()
    --DEFAULT_CHAT_FRAME:AddMessage("update")
    local elapsed = arg1
    
    for spell, times in pairs(AntiSpamStopCast.SpellCache) do
        times["ELAPSED"] = times["ELAPSED"] + elapsed
        --DEFAULT_CHAT_FRAME:AddMessage("UPDATE - '" .. spell .. ". Elapsed: " .. times["ELAPSED"])
        if (times["ELAPSED"] > times["CANCELTIME"]) then
            -- 0.2 seconds has passed since the cast was cancelled, and another started
            -- let's allow the spell to be cancelled again
            AntiSpamStopCast.SpellCache[spell] = nil
        end
    end
end

function AntiSpamStopCast.OnEvent()
    if (event == "ADDON_LOADED") and (string.lower(arg1) == "antispamstopcast") then
        DEFAULT_CHAT_FRAME:AddMessage("Anti-Spam StopCast loaded")
    end
end

AntiSpamStopCast:SetScript("OnUpdate", AntiSpamStopCast.Update_ASCoolDown)
AntiSpamStopCast:SetScript("OnEvent", AntiSpamStopCast.OnEvent)
