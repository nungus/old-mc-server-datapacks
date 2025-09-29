scoreboard players enable @a spawnwarp
tp @a[scores={spawnwarp=1..}] 0 70 0
title @a[scores={spawnwarp=1..}] actionbar [{"text":"You warped to spawn","color":"gold"}]
execute as @a[scores={spawnwarp=1..}] at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 3 1
scoreboard players set @a[scores={spawnwarp=1..}] spawnwarp 0