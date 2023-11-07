# RPC Patcher
Fixes several issues with the DST mods [Global Positions](https://steamcommunity.com/sharedfiles/filedetails/?id=378160973) and [Show Me](https://steamcommunity.com/sharedfiles/filedetails/?id=666155465) related to RPC handling.

## Installation
You can find the mod on the Steam Workshop [here](https://steamcommunity.com/sharedfiles/filedetails/?id=3075814429).

## Fixes (See configuration options)
- Patch Global Positions - Patches malicious players being able to crash the server and spawn in ANY item or mob in the game using Global Positions.
- Patch Show Me - Patches malicious players being able to crash the server using Show Me.
- Wrap All RPC Handlers - Automatically wraps all RPC handlers in a `pcall` to prevent malicious players from crashing the server. (This is a last resort, and should not be needed if the above patches are enabled.)

### Logs
The mod will automatically print in your console when a malicious user sends malicious RPCs from the previously mentioned patches:
```
RPC Patcher: RPC Ping from namespace workshop-378160973 from Antonio32A (KU_FzX9zCuA) was blocked. Reason: Provided ping prefab does not exist.	
RPC Patcher: RPC Hint from namespace ShowMeSHint from Antonio32A (KU_FzX9zCuA) was blocked. Reason: Invalid data types.	
```
