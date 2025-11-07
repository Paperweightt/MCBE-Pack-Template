$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packDir = Split-Path -Parent $scriptDir
$pack_name = Split-Path -Leaf $packDir
$mojang = "$home/AppData/Roaming/Minecraft Bedrock/Users/Shared/games/com.mojang"

#symlinks
Remove-Item -r -Path "$mojang/development_behavior_packs/$pack_name" 
New-Item -ItemType SymbolicLink `
    -Path "$mojang/development_behavior_packs/$pack_name" `
    -Target "$packDir/BP"

Remove-Item -r -Path "$mojang/development_resource_packs/$pack_name"
New-Item -ItemType SymbolicLink `
    -Path "$mojang/development_resource_packs/$pack_name" `
    -Target "$packDir/RP"

#manifest.json

(Get-Content "$packDir/BP/manifest.json") `
 -replace '\$uuid', {[guid]::NewGuid().ToString()} `
 -replace '\$pack_name', $pack_name `
| Set-Content "$packDir/BP/manifest.json" 

(Get-Content "$packDir/RP/manifest.json") `
 -replace '\$uuid', {[guid]::NewGuid().ToString()} `
 -replace '\$pack_name', $pack_name `
| Set-Content "$packDir/RP/manifest.json" 
