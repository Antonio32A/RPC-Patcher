name = "RPC Patcher"
author = "Antonio32A"
description = "Patches various mod RPCs to fix crashes and other issues."
version = "1.0.0"
api_version = 10
priority = -1048576

dont_starve_compatible = false
dst_compatible = true
reign_of_giants_compatible = false
shipwrecked_compatible = false

client_only_mod = false
all_clients_require_mod = false
server_only_mod = true

configuration_options = {
    {
        name = "PATCH_GLOBAL_POSITIONS",
        label = "Patch Global Positions",
        hover = "Should the mod patch the crash and spawn in prefab exploits from Global Positions?",
        options = {
            { description = "Yes", data = true },
            { description = "No", data = false }
        },
        default = true
    },
    {
        name = "PATCH_SHOW_ME",
        label = "Patch Show Me",
        hover = "Should the mod patch the crash exploit from Show Me?",
        options = {
            { description = "Yes", data = true },
            { description = "No", data = false }
        },
        default = true
    },
    {
        name = "WRAP_ALL_RPC_HANDLERS",
        label = "Wrap All RPC Handlers",
        hover = "Should the mod wrap all RPC handlers to prevent crashes from other mods?",
        options = {
            { description = "Yes", data = true },
            { description = "No", data = false }
        },
        default = false
    }
}
