scoreboard players enable @a help

execute as @a[scores={help=1..}] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 2

tellraw @a[scores={help=1}] [{"text":"Help list","color":"red","underlined":"true"},{"text":" - Click on what you need help with.","color":"dark_gray","underlined":"false"}]
tellraw @a[scores={help=1}] [{"text":" - Glow","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 2"}}]
tellraw @a[scores={help=1}] [{"text":" - Shop","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 3"}}]
tellraw @a[scores={help=1}] [{"text":" - TPA","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 4"}}]
tellraw @a[scores={help=1}] [{"text":" - Warps","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 5"}}]
tellraw @a[scores={help=1}] [{"text":" - Colours","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 11"}}]
tellraw @a[scores={help=1}] [{"text":" - Spawn","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 12"}}]



# glow
tellraw @a[scores={help=2}] [{"text":"Help - Glow","color":"blue","underlined":"true"}]
tellraw @a[scores={help=2}] [{"text":"Type \"","color":"gray"},{"text":"/trigger glow","color":"yellow"},{"text":"\" to toggle the glowing effect on and off."}]

# shop
tellraw @a[scores={help=3}] [{"text":"Help - Shop","color":"blue","underlined":"true"}]
tellraw @a[scores={help=3}] [{"text":"Type \"","color":"gray"},{"text":"/trigger shop","color":"yellow"},{"text":"\" to open the shop. You can purchase\nitems and perks using mins."}]

# tpa
tellraw @a[scores={help=4}] [{"text":"Help - TPA (teleport ask)","color":"blue","underlined":"true"}]
tellraw @a[scores={help=4}] [{"text":"Type \"","color":"gray"},{"text":"/trigger tpa set ","color":"yellow"},{"text":"[ID]","color":"red"},{"text":"\" where "},{"text":"[ID]","color":"red"},{"text":" is the teleportation ID\nof another player. You can find their teleportation ID in the\nplayer list. They will receive a TPA request and may accept it\nat will."}]

# warps
tellraw @a[scores={help=5}] [{"text":"Help list: Warps","color":"red","underlined":"true"}]
tellraw @a[scores={help=5}] [{"text":" - Creating a warp","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 6"}}]
tellraw @a[scores={help=5}] [{"text":" - Modifying and configuring a warp","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 7"}}]
tellraw @a[scores={help=5}] [{"text":" - Warping to a location","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 8"}}]
tellraw @a[scores={help=5}] [{"text":" - Listing warps","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 9"}}]
tellraw @a[scores={help=5}] [{"text":" - Indexing a warp","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 10"}}]

tellraw @a[scores={help=6}] [{"text":"Help - Creating a warp","color":"blue","underlined":"true"}]
tellraw @a[scores={help=6}] [{"text":"You can purchase a warp ball from the ","color":"gray"},{"text":"shop","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 3"}},{"text":". Throw the warp\nball to create a warp which only you can "},{"text":"modify","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 7"}},{"text":". You can't\ncreate a warp if you are within 10 blocks of another warp, or\nin a different dimension to the overworld."}]

tellraw @a[scores={help=7}] [{"text":"Help - Modifying and configuring a warp","color":"blue","underlined":"true"}]
tellraw @a[scores={help=7}] [{"text":"You can modify a warp that belongs to you by crouching while\nbeing within a 3 block radius of it. You can change the warp's\nID, enable/disable/set its password, and choose to show/hide\nits coordinates in the ","color":"gray"},{"text":"warp list","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 9"}},{"text":". You can also remove the warp."}]


tellraw @a[scores={help=8}] [{"text":"Help - Warping to a location","color":"blue","underlined":"true"}]
tellraw @a[scores={help=8}] [{"text":"Type \"","color":"gray"},{"text":"/trigger warp set ","color":"yellow"},{"text":"[ID]","color":"red"},{"text":"\" where "},{"text":"[ID]","color":"red"},{"text":" is the ID of a warp\nball. You can find available warp IDs by checking the "},{"text":"warp list","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 9"}},{"text":".\nUpon entering a valid ID to warp to, you will travel there.\n\nIf the warp requires a password, type \""},{"text":"/trigger warpPass set\n","color":"yellow"},{"text":"[PASSWORD]","color":"red"},{"text":"\" where "},{"text":"[PASSWORD]","color":"red"},{"text":" is the correct password to\naccess the specified warp."}]

tellraw @a[scores={help=9}] [{"text":"Help - Listing warps","color":"blue","underlined":"true"}]
tellraw @a[scores={help=9}] [{"text":"Type \"","color":"gray"},{"text":"/trigger warpList","color":"yellow"},{"text":"\" to view a list of all available warps.\nWarps may be set to require passwords or hide their\ncoordinates."}]

tellraw @a[scores={help=10}] [{"text":"Help - Indexing a warp","color":"blue","underlined":"true"}]
tellraw @a[scores={help=10}] [{"text":"Type \"","color":"gray"},{"text":"/trigger warpList set ","color":"yellow"},{"text":"[ID]","color":"red"},{"text":"\" where "},{"text":"[ID]","color":"red"},{"text":" is the desired\nwarp's warp ID. You can find available warp IDs by checking\nthe "},{"text":"warp list","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 9"}},{"text":". Only the desired warp will be displayed. The\nwarp's UID (unique identity) is displayed, unlike in the warp list.\nThe desired warp ball will also display who it is owned by if\nthat player is online."}]

# colours
tellraw @a[scores={help=11}] [{"text":"Help - Colours","color":"blue","underlined":"true"}]
tellraw @a[scores={help=11}] [{"text":"You can purchase colours in the ","color":"gray"},{"text":"shop","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 3"}},{"text":". To apply your colours\nto your name, type \""},{"text":"/trigger colour_menu","color":"yellow"},{"text":"\"."}]

# spawn
tellraw @a[scores={help=12}] [{"text":"Help list: Spawn","color":"red","underlined":"true"}]
tellraw @a[scores={help=12}] [{"text":" - Set spawnpoint","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 13"}}]
tellraw @a[scores={help=12}] [{"text":" - Forced suicide","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 14"}}]
tellraw @a[scores={help=12}] [{"text":" - Travel to world spawnpoint","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger help set 15"}}]

tellraw @a[scores={help=13}] [{"text":"Help - Set spawnpoint","color":"blue","underlined":"true"}]
tellraw @a[scores={help=13}] [{"text":"Type \"","color":"gray"},{"text":"/trigger setspawn","color":"yellow"},{"text":"\" to set your spawnpoint. You can\ntravel here at any time by performing a "},{"text":"forced suicide","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 14"}},{"text":"."}]

tellraw @a[scores={help=14}] [{"text":"Help - Forced suicide","color":"blue","underlined":"true"}]
tellraw @a[scores={help=14}] [{"text":"Type \"","color":"gray"},{"text":"/trigger suicide","color":"yellow"},{"text":"\" to force kill yourself. You can "},{"text":"set\nspawnpoint","color":"aqua","underlined":"true","clickEvent":{"action":"run_command","value":"/trigger help set 13"}},{"text":" before suiciding to respawn at a chosen location."}]

tellraw @a[scores={help=15}] [{"text":"Help - Travel to world spawnpoint","color":"blue","underlined":"true"}]
tellraw @a[scores={help=15}] [{"text":"Type \"","color":"gray"},{"text":"/trigger spawn","color":"yellow"},{"text":"\" to travel to the world spawnpoint."}]


scoreboard players set @a help 0