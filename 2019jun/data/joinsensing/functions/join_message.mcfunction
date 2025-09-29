# meta
execute as @a[scores={game.left=1..}] as @a at @s run playsound block.note_block.chime master @s ~ ~ ~ 1 1
execute as @a[scores={game.left=1..}] as @a at @s run particle heart ^ ^1.5 ^1 0 0 0 0 1
scoreboard players set @a[scores={game.left=1..}] game.left 0