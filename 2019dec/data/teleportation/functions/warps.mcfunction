#warp ball effects

execute as @e[nbt={Item:{tag:{warp_ball:1b}}}] unless entity @s[tag=charging] unless entity @s[tag=warp_ball_create] unless entity @s[tag=warp_ball_remove] at @s run particle portal ~ ~0.15 ~ 0.05 0 -0.05 0.5 1 force


#creating warp & unique ID

tag @e[type=snowball,nbt={Item:{tag:{warp_ball:1b}}}] add warp_ball
execute as @e[tag=warp_ball] unless score @s warpUID matches 1.. run tag @s add new_warp_ball
execute as @e[tag=warp_ball] run data merge entity @s {Invulnerable:1,NoGravity:1,NoAI:1,Motion:[0.0,0.0,0.0]}

#fail to create

execute as @a at @s in the_nether if entity @e[tag=warp_ball,distance=..5] run tag @e[tag=warp_ball,distance=..5] add warp_ball_fail
execute as @a at @s in the_end if entity @e[tag=warp_ball,distance=..5] run tag @e[tag=warp_ball,distance=..5] add warp_ball_fail
execute as @e[tag=new_warp_ball] at @s as @e[tag=warp_ball,distance=..10] unless entity @s[tag=new_warp_ball] run tag @e[tag=new_warp_ball] add warp_ball_fail

execute as @e[tag=warp_ball_fail] at @s run summon item ~ ~ ~ {Item:{id:"snowball",Count:1b,tag:{warp_ball:1b,display:{Name:"{\"text\":\"Warp ball\",\"color\":\"gold\",\"italic\":\"false\"}",Lore:["\"Throw it to create a warping outpost.\""]}}}}
execute as @e[tag=warp_ball_fail] at @s run playsound block.note_block.guitar master @p ~ ~ ~ 1 0
execute as @e[tag=warp_ball_fail] at @s run title @p actionbar [{"text":"You can't use the warp ball here.","color":"red"}]

execute as @e[tag=warp_ball_fail] run kill @s



#creating

execute as @e[tag=new_warp_ball] at @s at @p run tp @s ~ ~1 ~
execute as @e[tag=new_warp_ball] at @p run playsound block.note.pling master @a
execute as @e[tag=new_warp_ball] at @s run summon armor_stand ~ ~ ~ {Tags:["transmitter","new_transmitter"],Invisible:1,Invulnerable:1,NoGravity:1}
execute as @e[tag=new_warp_ball] at @s store result score @s teleportID run scoreboard players get @p teleportID

execute as @e[tag=new_warp_ball] at @s store result score @e[tag=new_transmitter,distance=0,limit=1] warpUID run data get storage minecraft:idmang warpIdCount
execute as @e[tag=new_warp_ball] at @s run scoreboard players add @e[tag=new_transmitter,distance=0] warpUID 1
execute as @e[tag=new_warp_ball] at @s store result storage minecraft:idmang warpIdCount int 1 run scoreboard players get @e[tag=new_transmitter,distance=0,limit=1] warpUID
execute as @e[tag=new_warp_ball] at @s store result score @s warpUID run scoreboard players get @e[tag=new_transmitter,distance=0,limit=1] warpUID

execute as @e[tag=new_transmitter] at @s store result score @s teleportID run scoreboard players get @e[tag=new_warp_ball,distance=0,limit=1] teleportID

execute as @e[tag=new_transmitter] store result score @s positionX run data get entity @s Pos[0]
execute as @e[tag=new_transmitter] store result score @s positionY run data get entity @s Pos[1]
execute as @e[tag=new_transmitter] store result score @s positionZ run data get entity @s Pos[2]

execute as @e[tag=new_transmitter] store result entity @s Pos[0] double 1 run scoreboard players get @s positionX
execute as @e[tag=new_transmitter] store result entity @s Pos[1] double 1 run scoreboard players get @s positionY
execute as @e[tag=new_transmitter] store result entity @s Pos[2] double 1 run scoreboard players get @s positionZ
execute as @e[tag=new_transmitter] at @s run tp @s ~0.5 ~ ~0.5

execute as @e[tag=new_warp_ball] store result score @s positionX run scoreboard players get @e[tag=new_transmitter,limit=1] positionX
execute as @e[tag=new_warp_ball] store result score @s positionY run scoreboard players get @e[tag=new_transmitter,limit=1] positionY
execute as @e[tag=new_warp_ball] store result score @s positionZ run scoreboard players get @e[tag=new_transmitter,limit=1] positionZ


scoreboard players set 


#general

execute as @e[tag=warp_ball] if score @s warpUID = @e[tag=new_transmitter,limit=1] warpUID run tp @s @e[tag=new_transmitter,limit=1]

tag @e[tag=new_warp_ball] add warp_ball_create
tag @e remove new_transmitter
tag @e remove new_warp_ball

execute as @e[tag=warp_ball] store result entity @s Pos[0] double 1 run scoreboard players get @s positionX
execute as @e[tag=warp_ball] store result entity @s Pos[1] double 1 run scoreboard players get @s positionY
execute as @e[tag=warp_ball] store result entity @s Pos[2] double 1 run scoreboard players get @s positionZ
execute as @e[tag=warp_ball] at @s run tp @s ~0.5 ~ ~0.5

function teleportation:warp_create_animation

#warping

scoreboard players enable @a warp
scoreboard players enable @a warpPass

execute as @e[tag=transmitter,scores={warpPass=0}] if score @s warpID = @a[scores={warp=1..,animation=0},limit=1] warp run tag @s add transmitter_select

execute as @a[scores={warp=1..}] unless score @s animation matches 1.. unless entity @e[tag=transmitter_select,limit=1] unless entity @s[tag=warp_configure] as @e[tag=transmitter] if score @s warpID = @a[scores={warp=1..},limit=1] warp run tellraw @a[scores={warp=1..}] [{"text":"","color":"yellow"},{"text":"Warp ","color":"gray"},{"text":"[ID:"},{"score":{"name":"@s","objective":"warpID"}},{"text":"]"},{"text":" requires a password:","color":"gray"},{"text":"\n - \"/trigger warpPass set (PASSWORD)\"","color":"dark_gray"}]

execute as @a[scores={warpPass=1..},tag=!warp_configure] store result score @s warp run scoreboard players get @s warpSub
execute as @e[tag=transmitter,scores={warpPass=1..}] if score @s warpID = @a[scores={warp=1..,animation=0},limit=1] warp if score @s warpPass = @a[scores={warpPass=1..,animation=0},limit=1] warpPass run tag @s add transmitter_select
execute as @a[scores={warp=1..}] store result score @s warpSub run scoreboard players get @s warp

execute as @e[tag=transmitter_select] run tag @a[scores={warp=1..}] add warping

execute as @a[scores={warp=1..,warpPass=1..}] unless entity @e[tag=transmitter_select] unless entity @s[tag=warp_configure] run tellraw @s [{"text":"Incorrect password.","color":"red"}]


#warp animation

function teleportation:warp_travel_animation


#configuring

execute as @a[predicate=teleportation:configure_crouch,tag=!warping] at @s if entity @e[tag=warp_ball,distance=..3,tag=!warp_ball_create,tag=!warp_ball_remove] run tag @s add warp_configure
function teleportation:warp_configuration

scoreboard players set @a warp 0
scoreboard players set @a[tag=!warp_configure] warpPass 0

#remove warp ball

function teleportation:warp_remove

#warp list

scoreboard players enable @a warpList
execute as @a[scores={warpList=1..}] at @s as @e[tag=transmitter] if score @s warpID = @a[scores={warpList=1..},limit=1] warpList run playsound block.note_block.hat master @a[scores={warpList=1..}] ~ ~ ~ 1 2
tellraw @a[scores={warpList=1}] [{"text":"Available warps:","color":"red","underlined":"true"}]
execute as @e[tag=transmitter] unless score @s warpID matches 1.. run tellraw @a[scores={warpList=1}] [{"text":"","color":"gray"},{"text":"[Unconfigured] ","color":"yellow"},{"text":"(XYZ: ","color":"gray"},{"score":{"name":"@s","objective":"positionX"}},{"text":" / "},{"score":{"name":"@s","objective":"positionY"}},{"text":" / "},{"score":{"name":"@s","objective":"positionZ"}},{"text":")"}]
execute as @e[tag=transmitter,tag=!warp_coords_hidden,scores={warpPass=0}] if score @s warpID matches 1.. run tellraw @a[scores={warpList=1}] [{"text":"","color":"gray"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"] ","color":"yellow"},{"text":"(XYZ: "},{"score":{"name":"@s","objective":"positionX"}},{"text":" / "},{"score":{"name":"@s","objective":"positionY"}},{"text":" / "},{"score":{"name":"@s","objective":"positionZ"}},{"text":")"},{"text":" {No password}","color":"aqua"}]
execute as @e[tag=transmitter,tag=warp_coords_hidden,scores={warpPass=0}] if score @s warpID matches 1.. run tellraw @a[scores={warpList=1}] [{"text":"","color":"gray"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"]","color":"yellow"},{"text":" (Coordinates hidden)"},{"text":" {No password}","color":"aqua"}]
execute as @e[tag=transmitter,tag=!warp_coords_hidden,scores={warpPass=1..}] if score @s warpID matches 1.. run tellraw @a[scores={warpList=1}] [{"text":"","color":"gray"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"] ","color":"yellow"},{"text":"(XYZ: "},{"score":{"name":"@s","objective":"positionX"}},{"text":" / "},{"score":{"name":"@s","objective":"positionY"}},{"text":" / "},{"score":{"name":"@s","objective":"positionZ"}},{"text":")"},{"text":" {Password}","color":"gold"}]
execute as @e[tag=transmitter,tag=warp_coords_hidden,scores={warpPass=1..}] if score @s warpID matches 1.. run tellraw @a[scores={warpList=1}] [{"text":"","color":"gray"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"]","color":"yellow"},{"text":" (Coordinates hidden)"},{"text":" {Password}","color":"gold"}]

execute as @e[tag=transmitter] if score @s warpID = @e[scores={warpList=2..},limit=1] warpList run tag @s add warp_index
execute as @e[tag=warp_index] run tellraw @a[scores={warpList=2..}] [{"text":"Indexing warp > ","color":"red"}]
execute as @e[tag=transmitter,tag=!warp_coords_hidden,scores={warpPass=0},tag=warp_index] run tellraw @a[scores={warpList=2..}] [{"text":"","color":"gray"},{"text":"[UID:","color":"blue"},{"score":{"name":"@s","objective":"warpUID"},"color":"blue"},{"text":"] ","color":"blue"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"] ","color":"yellow"},{"text":"(XYZ: "},{"score":{"name":"@s","objective":"positionX"}},{"text":" / "},{"score":{"name":"@s","objective":"positionY"}},{"text":" / "},{"score":{"name":"@s","objective":"positionZ"}},{"text":")"},{"text":" {No password}","color":"aqua"}]
execute as @e[tag=transmitter,tag=warp_coords_hidden,scores={warpPass=0},tag=warp_index] run tellraw @a[scores={warpList=2..}] [{"text":"","color":"gray"},{"text":"[UID:","color":"blue"},{"score":{"name":"@s","objective":"warpUID"},"color":"blue"},{"text":"] ","color":"blue"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"]","color":"yellow"},{"text":" (Coordinates hidden)"},{"text":" {No password}","color":"aqua"}]
execute as @e[tag=transmitter,tag=!warp_coords_hidden,scores={warpPass=1..},tag=warp_index] run tellraw @a[scores={warpList=2..}] [{"text":"","color":"gray"},{"text":"[UID:","color":"blue"},{"score":{"name":"@s","objective":"warpUID"},"color":"blue"},{"text":"] ","color":"blue"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"] ","color":"yellow"},{"text":"(XYZ: "},{"score":{"name":"@s","objective":"positionX"}},{"text":" / "},{"score":{"name":"@s","objective":"positionY"}},{"text":" / "},{"score":{"name":"@s","objective":"positionZ"}},{"text":")"},{"text":" {Password}","color":"gold"}]
execute as @e[tag=transmitter,tag=warp_coords_hidden,scores={warpPass=1..},tag=warp_index] run tellraw @a[scores={warpList=2..}] [{"text":"","color":"gray"},{"text":"[UID:","color":"blue"},{"score":{"name":"@s","objective":"warpUID"},"color":"blue"},{"text":"] ","color":"blue"},{"text":"[ID:","color":"yellow"},{"score":{"name":"@s","objective":"warpID"},"color":"yellow"},{"text":"]","color":"yellow"},{"text":" (Coordinates hidden)"},{"text":" {Password}","color":"gold"}]

execute as @a if score @s teleportID = @e[tag=warp_index,limit=1] teleportID run tellraw @a[scores={warpList=2..}] [{"text":" - Owned by ","color":"dark_purple"},{"selector":"@s"},{"text":" (ONLINE)."}]

tag @e remove warp_index
scoreboard players set @a warpList 0

tp @e[tag=transmitter] 0 100 0