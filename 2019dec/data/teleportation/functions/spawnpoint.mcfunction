execute as @a[scores={setspawn=1..}] at @s run spawnpoint @s
execute as @a[scores={setspawn=1..}] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2
tellraw @a[scores={setspawn=1..}] [{"text":"Spawnpoint set.","color":"green"}]

kill @a[scores={suicide=1..}]

scoreboard players set @a setspawn 0
scoreboard players set @a suicide 0

scoreboard players enable @a setspawn
scoreboard players enable @a suicide