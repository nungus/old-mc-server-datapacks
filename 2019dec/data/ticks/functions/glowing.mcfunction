scoreboard players enable @a glow

execute as @a[scores={glow=1..}] if entity @s[tag=glowing] run scoreboard players set @s glow 125000

execute as @a[scores={glow=1..}] if score @s glow matches 125000 run tag @s remove glowing
execute as @a[scores={glow=1..}] unless score @s glow matches 125000 run tag @s add glowing

effect give @a[tag=glowing] glowing 1 255 true

scoreboard players set @a[scores={glow=1..}] glow 0