# meta
scoreboard players enable @a spawnpoint.trav
execute as @a[scores={spawnpoint.trav=1..}] run tellraw @a [{"selector":"@s"},{"text":" >>> Suicide","color":"dark_gray"}]
execute as @a[scores={spawnpoint.trav=1..}] as @a at @s run playsound block.note_block.snare master @s ~ ~ ~ 1 1
kill @a[scores={spawnpoint.trav=1..}]
scoreboard players set @a[scores={spawnpoint.trav=1..}] spawnpoint.trav 0