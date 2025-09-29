execute as @e[tag=warp_ball_create] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=warp_ball_create,scores={animation=1}] at @s run summon armor_stand ~ ~ ~ {Tags:["shake_sub"],Invisible:1,Invulnerable:1,NoGravity:1}
execute as @e[tag=warp_ball_create,scores={animation=1}] as @e[tag=shake_sub] unless score @s animation matches 1.. run scoreboard players set @s animation 1

execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s run tp @s @e[tag=shake_sub,distance=..1,limit=1]
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s if predicate teleportation:warp_shake_percent run tp @s ~0.25 ~ ~
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~0.25 ~
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~ ~0.25
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s if predicate teleportation:warp_shake_percent run tp @s ~-0.25 ~ ~
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~-0.25 ~
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s if predicate teleportation:warp_shake_percent run tp @s ~ ~ ~-0.25
execute as @e[tag=warp_ball_create,scores={animation=1..200}] at @s run playsound block.note_block.bit master @a ~ ~ ~ 0.2 1.6

execute as @e[tag=warp_ball_create,scores={animation=200}] at @s run tp @s @e[tag=shake_sub,distance=..1,limit=1]

kill @e[tag=shake_sub,scores={animation=200}]

execute as @e[tag=warp_ball_create,scores={animation=200}] at @s run playsound entity.wither.death master @a ~ ~ ~ 3 0
execute as @e[tag=warp_ball_create,scores={animation=200}] at @s run effect give @a[distance=..20] nausea 12 255 true
execute as @e[tag=warp_ball_create,scores={animation=200}] at @s run effect give @a[distance=..20] blindness 10 255 true
execute as @e[tag=warp_ball_create,scores={animation=200..350}] at @s run particle portal ~ ~0.15 ~ 0 0 0 5 25

tag @e[tag=warp_ball_create,scores={animation=400}] remove warp_ball_create
execute as @e[tag=warp_ball,scores={animation=400}] run scoreboard players set @s animation 0