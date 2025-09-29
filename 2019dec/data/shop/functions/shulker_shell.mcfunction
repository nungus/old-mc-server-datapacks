scoreboard players enable @a purchaseShulker

tag @a[scores={purchaseShulker=1..,mins=..49}] add purchaseShulkerFail
tag @a[scores={purchaseShulker=1..,mins=50..}] add purchaseShulkerSuccess

scoreboard players set @a purchaseShulker 0

#fail
title @a[tag=purchaseShulkerFail] actionbar [{"text":"You don't have enough mins for the shulker shell.","color":"red"}]
execute as @a[tag=purchaseShulkerFail] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
tag @a remove purchaseShulkerFail

#success
title @a[tag=purchaseShulkerSuccess] actionbar [{"text":"You received a shulker shell!","color":"green"}]
give @a[tag=purchaseShulkerSuccess] shulker_shell

execute as @a[tag=purchaseShulkerSuccess] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

scoreboard players remove @a[tag=purchaseShulkerSuccess] mins 50
tag @a remove purchaseShulkerSuccess