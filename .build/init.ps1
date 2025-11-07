$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$packDir = Split-Path -Parent $scriptDir
$pack_name = Split-Path -Leaf $packDir
$mojang = "$home/AppData/Roaming/Minecraft Bedrock/Users/Shared/games/com.mojang"

$dev = $true

echo $pack

#symlinks
# Remove-Item -r -Path "$mojang/development_behavior_packs/$pack_name" 
# New-Item -ItemType SymbolicLink `
#     -Path "$mojang/development_behavior_packs/$pack_name" `
#     -Target "$packDir/BP"
#
# Remove-Item -r -Path "$mojang/development_resource_packs/$pack_name"
# New-Item -ItemType SymbolicLink `
#     -Path "$mojang/development_resource_packs/$pack_name" `
#     -Target "$packDir/RP"

#uuid

echo "$packDir/BP/manifest.json" 

Get-Content "$packDir/BP/manifest.json" `
| ForEach-Object { $_ -replace "`$uuid", [guid]::NewGuid() } `
| Set-Content "$packDir/BP/manifest.json"
