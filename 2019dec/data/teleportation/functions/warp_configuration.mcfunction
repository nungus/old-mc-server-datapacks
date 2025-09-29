#~ setup/display
scoreboard players set @a[tag=warp_configure,scores={animation=0}] warp 0
execute as @a[tag=warp_configure,scores={animation=0}] at @s store result score @s warpID run scoreboard players get @e[tag=warp_ball,distance=..3,limit=1] warpID
execute as @a[tag=warp_configure,scores={animation=0}] at @s store result score @s warpPass run scoreboard players get @e[tag=warp_ball,distance=..3,limit=1] warpPass
execute as @a[tag=warp_configure,scores={animation=0}] at @s if entity @e[tag=warp_ball,distance=..3,tag=warp_coords_hidden] run tag @s add warp_coords_hidden

execute as @a[tag=warp_configure,scores={animation=0}] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", Password: ","color":"yellow"},{"score":{"name":"@s","objective":"warpPass"},"color":"gold"},{"text":", Coordinates: "},{"text":"Shown","color":"gold"}]
execute as @a[tag=warp_configure,scores={animation=0,warpPass=0}] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", No Password"},{"text":", Coordinates: "},{"text":"Shown","color":"gold"}]
execute as @a[tag=warp_configure,scores={animation=0},tag=warp_coords_hidden] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", Password: ","color":"yellow"},{"score":{"name":"@s","objective":"warpPass"},"color":"gold"},{"text":", Coordinates: "},{"text":"Hidden","color":"gold"}]
execute as @a[tag=warp_configure,scores={animation=0,warpPass=0},tag=warp_coords_hidden] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", No Password"},{"text":", Coordinates: "},{"text":"Hidden","color":"gold"}]


execute as @a[tag=warp_configure] unless score @s animation matches 1..100 run scoreboard players set @s animation 1

#~ message after saving a warp's configuration
scoreboard players set @a[tag=warp_config_save] animation 0
execute as @a[tag=warp_config_save] at @s as @e[tag=warp_ball,distance=..3,tag=warp_coords_hidden,scores={warpPass=0}] run tellraw @a[tag=warp_config_save] [{"text":"","color":"gray"},{"text":"Saved! ","color":"green"},{"text":"ID: "},{"score":{"name":"@s","objective":"warpID"}},{"text":", No password"},{"text":", Coordinates: Hidden"}]
execute as @a[tag=warp_config_save] at @s as @e[tag=warp_ball,distance=..3,tag=!warp_coords_hidden,scores={warpPass=0}] run tellraw @a[tag=warp_config_save] [{"text":"","color":"gray"},{"text":"Saved! ","color":"green"},{"text":"ID: "},{"score":{"name":"@s","objective":"warpID"}},{"text":", No Password"},{"text":", Coordinates: Shown"}]
execute as @a[tag=warp_config_save] at @s as @e[tag=warp_ball,distance=..3,tag=warp_coords_hidden,scores={warpPass=1..}] run tellraw @a[tag=warp_config_save] [{"text":"","color":"gray"},{"text":"Saved! ","color":"green"},{"text":"ID: "},{"score":{"name":"@s","objective":"warpID"}},{"text":", Password: "},{"score":{"name":"@s","objective":"warpPass"}},{"text":", Coordinates: Hidden"}]
execute as @a[tag=warp_config_save] at @s as @e[tag=warp_ball,distance=..3,tag=!warp_coords_hidden,scores={warpPass=1..}] run tellraw @a[tag=warp_config_save] [{"text":"","color":"gray"},{"text":"Saved! ","color":"green"},{"text":"ID: "},{"score":{"name":"@s","objective":"warpID"}},{"text":", Password: "},{"score":{"name":"@s","objective":"warpPass"}},{"text":", Coordinates: Shown"}]
tag @a[tag=warp_config_save] remove warp_configure
scoreboard players set @a[tag=warp_config_save] warpID 0
scoreboard players set @a[tag=warp_config_save] warpPass 0
scoreboard players set @a[tag=warp_config_save] warp 0
tag @a[tag=warp_config_save] remove warp_coords_hidden
tag @a remove warp_config_save

#~ cancelling configuration from going too far away from the warp
execute as @a[tag=warp_configure] at @s unless entity @e[tag=warp_ball,distance=..3] run scoreboard players set @s animation 0
tellraw @a[tag=warp_configure,scores={animation=0}] [{"text":"You went away from the warp ball, cancelling the configuration.","color":"red"}]
scoreboard players set @a[tag=warp_configure,scores={animation=0}] warpID 0
scoreboard players set @a[tag=warp_configure,scores={animation=0}] warpPass 0
scoreboard players set @a[tag=warp_configure,scores={animation=0}] warp 0
tag @a[tag=warp_configure,scores={animation=0}] remove warp_coords_hidden
execute as @a[tag=warp_configure] at @s if score @s animation matches 0 run tag @s remove warp_configure

#~ fail trying to configure someone else's warp
execute as @a[tag=warp_configure] at @s unless score @e[tag=warp_ball,distance=..3,limit=1] teleportID = @s teleportID run scoreboard players set @s animation 0
title @a[tag=warp_configure,scores={animation=0}] actionbar [{"text":"This warp ball doesn't belong to you.","color":"red"}]
execute as @a[tag=warp_configure] at @s if score @s animation matches 0 as @a if score @s teleportID = @e[tag=warp_ball,distance=..3,limit=1] teleportID run title @a[tag=warp_configure,scores={animation=0}] actionbar [{"text":"This warp ball belongs to ","color":"red"},{"selector":"@s"},{"text":"."}]
execute as @a[tag=warp_configure] if score @s animation matches 0 run tag @s remove warp_configure

#~ the animation associated with configuring a warp is just a delay to prevent
#~ it from spamming your chat; it waits 5 seconds before retriggering
scoreboard players set @a[tag=warp_configure,scores={animation=100}] animation 1

#~ begin configuration
execute as @a[tag=warp_configure,scores={animation=1},predicate=teleportation:configure_crouch] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 1
execute as @a[tag=warp_configure,scores={animation=1},predicate=teleportation:configure_crouch] at @s run tellraw @s [{"text":"Configure your warp ball","color":"red","underlined":"true"}]
tellraw @a[tag=warp_configure,scores={animation=1},predicate=teleportation:configure_crouch] [{"text":""},{"text":"Warp ID -   ","color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"ID used to travel with /trigger warp.","color":"yellow"}]}},{"text":"[-200]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000001"}},{"text":" "},{"text":"[-20]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000002"}},{"text":" "},{"text":"[-1]","color":"red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000003"}},{"text":" "},{"text":"[+1]","color":"green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000004"}},{"text":" "},{"text":"[+20]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000005"}},{"text":" "},{"text":"[+200]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000006"}}]
tellraw @a[tag=warp_configure,scores={animation=1},predicate=teleportation:configure_crouch] [{"text":""},{"text":"Password - ","color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"(Optional) Password which may be required.","color":"yellow"}]}},{"text":"[-200]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000007"}},{"text":" "},{"text":"[-20]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000008"}},{"text":" "},{"text":"[-1]","color":"red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000009"}},{"text":" "},{"text":"[+1]","color":"green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000010"}},{"text":" "},{"text":"[+20]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000011"}},{"text":" "},{"text":"[+200]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000012"}},{"text":"      "},{"text":"[Save]","color":"green","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000015"}}]
tellraw @a[tag=warp_configure,scores={animation=1},predicate=teleportation:configure_crouch] [{"text":""},{"text":"Coordinates - ","color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Show or hide coordinates in /trigger warps.","color":"yellow"}]}},{"text":"[Shown]","color":"blue","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000013"}},{"text":" "},{"text":"[Hidden]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000014"}},{"text":"                         "},{"text":"[Remove]","color":"red","clickEvent":{"action":"run_command","value":"/trigger warp set 1250000016"}}]

#~ buttons of a few different scales that change various properties of the warp
#~ the massive numbers are just because i didn't want to make a new trigger
#~ so they just use the normal trigger but with massive, irrelevant numbers
scoreboard players remove @a[tag=warp_configure,scores={warp=1250000001}] warpID 200
scoreboard players remove @a[tag=warp_configure,scores={warp=1250000002}] warpID 20
scoreboard players remove @a[tag=warp_configure,scores={warp=1250000003}] warpID 1
scoreboard players add @a[tag=warp_configure,scores={warp=1250000004}] warpID 1
scoreboard players add @a[tag=warp_configure,scores={warp=1250000005}] warpID 20
scoreboard players add @a[tag=warp_configure,scores={warp=1250000006}] warpID 200

scoreboard players remove @a[tag=warp_configure,scores={warp=1250000007}] warpPass 200
scoreboard players remove @a[tag=warp_configure,scores={warp=1250000008}] warpPass 20
scoreboard players remove @a[tag=warp_configure,scores={warp=1250000009}] warpPass 1
scoreboard players add @a[tag=warp_configure,scores={warp=1250000010}] warpPass 1
scoreboard players add @a[tag=warp_configure,scores={warp=1250000011}] warpPass 20
scoreboard players add @a[tag=warp_configure,scores={warp=1250000012}] warpPass 200

tag @a[tag=warp_configure,scores={warp=1250000013}] remove warp_coords_hidden
tag @a[tag=warp_configure,scores={warp=1250000014}] add warp_coords_hidden

#~ fail to save because of incompatible properties
#~ if the save is successful, commands from line #15 will display the save msgs
#~ on the next tick (as the player still has the warp_config_save tag)
tag @a[tag=warp_configure,scores={warp=1250000015}] add warp_config_save
execute as @a[tag=warp_config_save] if score @s warpID matches ..1 run tag @s add warp_config_save_sub
execute as @a[tag=warp_config_save] if score @s warpID matches ..1 run tag @s remove warp_config_save
title @a[scores={warp=1250000015},tag=!warp_config_save,tag=warp_configure] actionbar [{"text":"Can't save: Warp ID must be above 1.","color":"red"}]
execute as @a[tag=warp_configure,tag=!warp_config_save,scores={warp=1250000015}] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 0

tag @a[tag=warp_configure,scores={warp=1250000015}] add warp_config_save
execute as @a[tag=warp_config_save] at @s as @e[tag=transmitter] if score @s warpID = @a[tag=warp_config_save,limit=1] warpID unless score @s warpID = @e[tag=warp_ball,distance=..3,limit=1] warpID run tag @a[tag=warp_config_save] remove warp_config_save
title @a[scores={warp=1250000015},tag=!warp_config_save,tag=warp_configure] actionbar [{"text":"Can't save: This Warp ID is already taken.","color":"red"}]
execute as @a[tag=warp_configure,tag=!warp_config_save,scores={warp=1250000015}] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 0

tag @a[tag=warp_config_save_sub] remove warp_config_save
tag @a[tag=warp_config_save_sub] remove warp_config_save_sub

tag @a[tag=warp_configure,scores={warp=1250000016}] add warp_ball_remove
scoreboard players set @a[tag=warp_configure,scores={warp=1250000016}] animation 0
tag @a[tag=warp_configure,scores={warp=1250000016}] remove warp_configure


#store
#~ ...the changes into the warp ball

execute as @a[tag=warp_config_save] at @s run tag @e[tag=warp_ball,distance=..3] add warp_ball_config_save
execute as @a[tag=warp_config_save] at @s store result score @e[tag=warp_ball_config_save,distance=..3] warpID run scoreboard players get @s warpID
execute as @a[tag=warp_config_save] at @s store result score @e[tag=warp_ball_config_save,distance=..3] warpPass run scoreboard players get @s warpPass
execute as @a[tag=warp_config_save] at @s if entity @s[tag=warp_coords_hidden] run tag @e[tag=warp_ball_config_save,distance=..3] add warp_coords_hidden
execute as @a[tag=warp_config_save] at @s if entity @s[tag=!warp_coords_hidden] run tag @e[tag=warp_ball_config_save,distance=..3] remove warp_coords_hidden

execute as @e[tag=transmitter] if score @s warpUID = @e[tag=warp_ball_config_save,limit=1] warpUID store result score @s warpID run scoreboard players get @e[tag=warp_ball_config_save,limit=1] warpID
execute as @e[tag=transmitter] if score @s warpUID = @e[tag=warp_ball_config_save,limit=1] warpUID store result score @s warpPass run scoreboard players get @e[tag=warp_ball_config_save,limit=1] warpPass
execute as @e[tag=warp_ball_config_save,tag=warp_coords_hidden] as @e[tag=transmitter] if score @s warpUID = @e[tag=warp_ball_config_save,limit=1] warpUID run tag @s add warp_coords_hidden
execute as @e[tag=warp_ball_config_save,tag=!warp_coords_hidden] as @e[tag=transmitter] if score @s warpUID = @e[tag=warp_ball_config_save,limit=1] warpUID run tag @s remove warp_coords_hidden

tag @e remove warp_ball_config_save


scoreboard players set @a[scores={warpID=..-1}] warpID 0
scoreboard players set @a[scores={warpPass=..-1}] warpPass 0

#~ play a hat sound and update the display as a player configures a warp
execute as @a[tag=warp_configure,scores={warp=1200000000..}] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 2
execute as @a[tag=warp_configure,scores={warp=1250000001..1250000014}] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", Password: ","color":"yellow"},{"score":{"name":"@s","objective":"warpPass"},"color":"gold"},{"text":", Coordinates: "},{"text":"Shown","color":"gold"}]
execute as @a[tag=warp_configure,scores={warp=1250000001..1250000014,warpPass=0}] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", No Password"},{"text":", Coordinates: "},{"text":"Shown","color":"gold"}]
execute as @a[tag=warp_configure,scores={warp=1250000001..1250000014},tag=warp_coords_hidden] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", Password: ","color":"yellow"},{"score":{"name":"@s","objective":"warpPass"},"color":"gold"},{"text":", Coordinates: "},{"text":"Hidden","color":"gold"}]
execute as @a[tag=warp_configure,scores={warp=1250000001..1250000014,warpPass=0},tag=warp_coords_hidden] run title @s actionbar [{"text":"Warp ID: ","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"gold"},{"text":", No Password"},{"text":", Coordinates: "},{"text":"Hidden","color":"gold"}]

scoreboard players set @a[scores={warp=1250000000..}] warp 0

