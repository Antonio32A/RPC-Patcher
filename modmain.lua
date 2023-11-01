do
    local GLOBAL = GLOBAL
    local modEnv = GLOBAL.getfenv(1)
    local rawget, setmetatable = GLOBAL.rawget, GLOBAL.setmetatable
    setmetatable(modEnv, {
        __index = function(self, index)
            return rawget(GLOBAL, index)
        end
        -- lack of __newindex means it defaults to modEnv, so we don't mess up globals.
    })

    _G = GLOBAL
end

local GLOBAL_POSITIONS = "workshop-378160973"
local SHOW_ME = "ShowMeSHint"
local Patch = require("patcher")

AddSimPostInit(function()
    Patch(GLOBAL_POSITIONS, "Ping", function(_, pingtype, x, y, z)
        if not checkstring(pingtype) or not checknumber(x) or not checknumber(y) or not checknumber(z) then
            return "Invalid data types."
        end

        if pingtype ~= "delete" and pingtype ~= "clear" then
            local prefab = "ping_" .. pingtype
            if not PrefabExists(prefab) then
                return "Provided ping prefab does not exist."
            end
        end
    end)

    Patch(SHOW_ME, "Hint", function(_, guid, item)
        if not checknumber(guid) or not checkentity(item) then
            return "Invalid data types."
        end
    end)
end)
