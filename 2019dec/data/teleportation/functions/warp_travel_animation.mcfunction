#summon clone of transmitter with cloned coordinates
execute as @e[tag=transmitter_select] at @s run summon armor_stand ~ ~ ~ {Tags:["transmitter_clone"],Invisible:1,Invulnerable:1,NoGravity:1}
execute as @e[tag=warp_ball] if score @s warpUID = @e[tag=transmitter_select,limit=1] warpUID run scoreboard players set @s animation 1
tag @e[tag=warp_ball,tag=!warp_ball_create,scores={animation=1}] add charging
execute as @a[tag=warping] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=transmitter_select] run tellraw @a[tag=warping,scores={animation=1..}] [{"text":"","color":"yellow"},{"text":"Travelling to warp ball ","color":"gray"},{"text":"[ID:"},{"score":{"name":"@s","objective":"warpID"}},{"text":"]"}]

execute as @e[tag=transmitter_clone] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=transmitter_clone,scores={animation=1}] store result score @s positionX run scoreboard players get @e[tag=transmitter_select,limit=1] positionX
execute as @e[tag=transmitter_clone,scores={animation=1}] store result score @s positionY run scoreboard players get @e[tag=transmitter_select,limit=1] positionY
execute as @e[tag=transmitter_clone,scores={animation=1}] store result score @s positionZ run scoreboard players get @e[tag=transmitter_select,limit=1] positionZ

#warp ball effects

execute as @e[tag=charging,scores={animation=1}] at @s run summon armor_stand ~ ~ ~ {Tags:["shake_sub"],Invisible:1,Invulnerable:1,NoGravity:1}
execute as @e[tag=charging,scores={animation=1}] as @e[tag=shake_sub] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=charging,scores={animation=1..80}] at @s run tp @s @e[tag=shake_sub,distance=..1,limit=1]
execute as @e[tag=charging,scores={animation=1..80}] at @s if predicate teleportation:warp_shake_percent run tp @s ~0.25 ~ ~
execute as @e[tag=charging,scores={animation=1..80}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~0.25 ~
execute as @e[tag=charging,scores={animation=1..80}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~ ~0.25
execute as @e[tag=charging,scores={animation=1..80}] at @s if predicate teleportation:warp_shake_percent run tp @s ~-0.25 ~ ~
execute as @e[tag=charging,scores={animation=1..80}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~-0.25 ~
execute as @e[tag=charging,scores={animation=1..80}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~ ~-0.25
execute as @e[tag=charging,scores={animation=1..80}] at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.2 1.6

execute as @e[tag=charging,scores={animation=80}] at @s run tp @s @e[tag=shake_sub,distance=..1,limit=1]

scoreboard players set @e[tag=charging,scores={animation=160}] animation 0
tag @e[tag=charging,scores={animation=0}] remove charging


#player effects
execute as @a[tag=warping,scores={animation=1}] at @s run summon armor_stand ~ ~ ~ {Tags:["warp_sub"],Invisible:1,Invulnerable:1,NoGravity:1}
execute as @e[tag=warp_sub] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=warp_sub,scores={animation=10}] at @s as @a[tag=warping,scores={animation=10}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=15}] at @s as @a[tag=warping,scores={animation=15}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=20}] at @s as @a[tag=warping,scores={animation=20}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=25}] at @s as @a[tag=warping,scores={animation=25}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=30}] at @s as @a[tag=warping,scores={animation=30}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=35}] at @s as @a[tag=warping,scores={animation=35}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=40}] at @s as @a[tag=warping,scores={animation=40}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=45}] at @s as @a[tag=warping,scores={animation=45}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=50}] at @s as @a[tag=warping,scores={animation=50}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=55}] at @s as @a[tag=warping,scores={animation=55}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=60}] at @s as @a[tag=warping,scores={animation=60}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=65}] at @s as @a[tag=warping,scores={animation=65}] run tp @s ~ ~ ~
execute as @e[tag=warp_sub,scores={animation=70}] at @s as @a[tag=warping,scores={animation=70}] run tp @s ~ ~ ~
kill @e[tag=warp_sub,scores={animation=80}]


effect give @a[tag=warping,scores={animation=1}] resistance 5 255 true
effect give @a[tag=warping,scores={animation=1}] levitation 4 255 true

execute as @a[tag=warping,scores={animation=1}] at @s run playsound entity.wither.ambient master @a ~ ~ ~ 0.8 0
execute as @a[tag=warping,scores={animation=1..20}] at @s run particle portal ~ ~1 ~ 0 0 0 3 30

execute as @a[tag=warping,scores={animation=80}] at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @a[tag=warping,scores={animation=80}] at @s run particle dragon_breath ~ ~1 ~ 0 0 0 0.1 60


tag @e remove transmitter_select

execute as @e[tag=transmitter_clone,scores={animation=80}] run function teleportation:warp_go



execute as @a[tag=warping,scores={animation=81}] at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @a[tag=warping,scores={animation=81}] at @s run particle dragon_breath ~ ~1 ~ 0 0 0 0.1 40

scoreboard players set @a[tag=warping] warp 0
scoreboard players set @a[tag=warping] warpSub 0
scoreboard players set @a[tag=warping] warpPass 0
scoreboard players set @a[tag=warping,scores={animation=81}] animation 0
tag @a[scores={animation=0}] remove warping