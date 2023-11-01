function Patch(namespace, name, fn)
    print("Patching RPC " .. name .. " in namespace " .. namespace .. ".")
    if MOD_RPC[namespace] == nil then
        print("RPC Patcher: Mod namespace " .. namespace .. " does not exist.")
        return
    end

    local rpc_info = MOD_RPC[namespace][name]
    if rpc_info == nil or rpc_info.id == nil then
        print("RPC Patcher: RPC " .. name .. " from namespace " .. namespace .. " does not exist.")
        return
    end

    if MOD_RPC_HANDLERS[namespace] == nil then
        print("RPC Patcher: Mod namespace " .. namespace .. " has no RPC handlers.")
        return
    end

    local oldfn = MOD_RPC_HANDLERS[namespace][rpc_info.id]
    if oldfn == nil then
        print("RPC Patcher: RPC " .. name .. " from namespace " .. namespace .. " has no handler.")
        return
    end

    MOD_RPC_HANDLERS[namespace][rpc_info.id] = function(player, ...)
        local reason = fn(player, ...)
        if reason == nil then
            return oldfn(player, ...)
        end

        local display_name = player.name .. " (" .. player.userid .. ")"
        print("RPC Patcher: RPC " .. name .. " from namespace " .. namespace .. " from " .. display_name .. " was blocked. Reason: " .. reason)
    end
end

return Patch
