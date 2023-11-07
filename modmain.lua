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
local Patcher = require("patcher")

AddSimPostInit(function()
    if GetModConfigData("PATCH_GLOBAL_POSITIONS") then
        Patcher.Patch(GLOBAL_POSITIONS, "Ping", function(_, pingtype, x, y, z)
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
    end

    if GetModConfigData("PATCH_SHOW_ME") then
        Patcher.Patch(SHOW_ME, "Hint", function(_, guid, item)
            if not checknumber(guid) or not checkentity(item) then
                return "Invalid data types."
            end
        end)
    end

    if GetModConfigData("WRAP_ALL_RPC_HANDLERS") then
        Patcher.HookAllHandlers(function(namespace, rpc_name, player, oldfn, ...)
            local status, result = pcall(oldfn, player, ...)
            if not status then
                local display_name = player.name .. " (" .. player.userid .. ")"
                print("RPC Patcher: RPC " .. rpc_name .. " from namespace " .. namespace .. " from " .. display_name .. " errored. Error: " .. tostring(result))
            end
        end)
    end
end)
