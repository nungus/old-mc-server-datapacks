scoreboard players enable @a spawn
execute as @a[scores={spawn=1},tag=!warping] at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @a[scores={spawn=1},tag=!warping] at @s run particle dragon_breath ~ ~ ~ 0 0 0 0.1 60

tp @a[scores={spawn=1},tag=!warping] 143 69 -128

execute as @a[scores={spawn=1},tag=!warping] at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @a[scores={spawn=1},tag=!warping] at @s run particle dragon_breath ~ ~ ~ 0 0 0 0.1 60
tellraw @a[scores={spawn=1},tag=!warping] [{"text":"You teleported to spawn.","color":"gold"}]

scoreboard players set @a[scores={spawn=2}] spawn 0
scoreboard players add @a[scores={spawn=1}] spawn 1