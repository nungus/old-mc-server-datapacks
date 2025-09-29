execute store result entity @s Pos[0] double 1 run scoreboard players get @s positionX
execute store result entity @s Pos[1] double 1 run scoreboard players get @s positionY
execute store result entity @s Pos[2] double 1 run scoreboard players get @s positionZ
execute at @s as @a[tag=warping,scores={animation=80}] run tp @s ~0.5 ~-1 ~0.5
kill @s