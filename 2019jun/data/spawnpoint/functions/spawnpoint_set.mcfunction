# meta
scoreboard players enable @a spawnpoint.set
tellraw @a[scores={spawnpoint.set=1..}] [{"text":"You set your spawnpoint!","color":"green"}]
execute as @a[scores={spawnpoint.set=1..}] at @s run playsound block.note_block.cow_bell master @s ~ ~ ~ 1 0
execute as @a[scores={spawnpoint.set=1..}] at @s run spawnpoint @s ~ ~ ~
scoreboard players set @a[scores={spawnpoint.set=1..}] spawnpoint.set 0