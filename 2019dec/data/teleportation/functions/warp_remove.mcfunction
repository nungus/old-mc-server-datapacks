execute as @a[tag=warp_ball_remove] at @s run tag @e[tag=warp_ball,distance=..3] add warp_ball_remove
execute as @a[tag=warp_ball_remove] run tag @s remove warp_coords_hidden
execute as @e[tag=warp_ball,tag=warp_ball_remove] if score @s warpID matches 1.. run tellraw @a[tag=warp_ball_remove] [{"text":"","color":"yellow"},{"text":"You removed the warp ball: ","color":"gray"},{"text":"[ID:"},{"score":{"name":"@s","objective":"warpID"}},{"text":"]"}]
execute as @e[tag=warp_ball,tag=warp_ball_remove] unless score @s warpID matches 1.. run tellraw @a[tag=warp_ball_remove] [{"text":"","color":"yellow"},{"text":"You removed the warp ball: ","color":"gray"},{"text":"[Unconfigured]"}]
tag @a remove warp_ball_remove
execute as @e[tag=warp_ball_remove] as @e[tag=transmitter] if score @s warpUID = @e[tag=warp_ball_remove,limit=1] warpUID run kill @s
execute as @e[tag=warp_ball_remove] unless score @s animation matches 1.. run scoreboard players set @s animation 1

#removal effects

execute as @e[tag=warp_ball_remove,scores={animation=1}] at @s run summon armor_stand ~ ~ ~ {Tags:["shake_sub"],Invisible:1,Invulnerable:1,NoGravity:1}
execute as @e[tag=warp_ball_remove,scores={animation=1}] as @e[tag=shake_sub] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s run tp @s @e[tag=shake_sub,distance=..1,limit=1]
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s if predicate teleportation:warp_shake_percent run tp @s ~0.25 ~ ~
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~0.25 ~
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~ ~0.25
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s if predicate teleportation:warp_shake_percent run tp @s ~-0.25 ~ ~
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~-0.25 ~
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~ ~-0.25
execute as @e[tag=warp_ball_remove,scores={animation=1..60}] at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.2 1.6


execute as @e[tag=warp_ball_remove,scores={animation=60}] at @s run tp @s @e[tag=shake_sub,distance=..1,limit=1]


execute as @e[tag=warp_ball_remove,scores={animation=1..10}] at @s run particle portal ~ ~0.15 ~ 0 0 0 5 25

execute as @e[tag=warp_ball_remove,scores={animation=80..115}] at @s run playsound entity.wither.break_block master @a ~ ~ ~ 0.15 0
execute as @e[tag=warp_ball_remove,scores={animation=80..120}] at @s run particle dragon_breath ~ ~0.15 ~ 0 0 0 0.5 5
execute as @e[tag=warp_ball_remove,scores={animation=130}] at @s run playsound entity.ender_eye.death master @a ~ ~ ~ 1 0.8
execute as @e[tag=warp_ball_remove,scores={animation=130}] at @s run summon item ~ ~ ~ {Motion:[0.0,0.5,0.0],Item:{id:"snowball",Count:1b,tag:{warp_ball:1b,display:{Name:"{\"text\":\"Warp ball\",\"color\":\"gold\",\"italic\":\"false\"}",Lore:["\"Throw it to create a warping outpost.\""]}}}}



kill @e[tag=warp_ball_remove,scores={animation=130}]