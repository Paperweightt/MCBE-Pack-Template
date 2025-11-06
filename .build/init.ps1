$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packs = Split-Path -Parent $scriptDir
$pack_name = Split-Path -Leaf $packs
$mojang = "$home/AppData/Roaming/Minecraft Bedrock/Users/Shared/games/com.mojang"

#symlinks
Remove-Item -r -Path "$mojang/development_behavior_packs/$pack_name" 
New-Item -ItemType SymbolicLink `
    -Path "$mojang/development_behavior_packs/$pack_name" `
    -Target "$packs/$pack_name/BP"

Remove-Item -r -Path $mojang/development_resource_packs/$pack_name
New-Item -ItemType SymbolicLink `
    -Path "$mojang/development_resource_packs/$pack_name" `
    -Target "$packs/$pack_name/RP"
