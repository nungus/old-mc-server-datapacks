scoreboard players add @a[scores={ticks=1200..}] mins 1
scoreboard players set @a[scores={ticks=1200..}] ticks 0

scoreboard players add @e[scores={animation=1..}] animation 1
execute as @a unless score @s animation matches 0.. run scoreboard players set @s animation 0