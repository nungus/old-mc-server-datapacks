scoreboard players enable @a purchaseWarp

tag @a[scores={purchaseWarp=1..,mins=..479}] add purchaseWarpFail
tag @a[scores={purchaseWarp=1..,mins=480..}] add purchaseWarpSuccess

scoreboard players set @a purchaseWarp 0

#fail
title @a[tag=purchaseWarpFail] actionbar [{"text":"You don't have enough mins for the warp ball.","color":"red"}]
execute as @a[tag=purchaseWarpFail] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
tag @a remove purchaseWarpFail

#success
title @a[tag=purchaseWarpSuccess] actionbar [{"text":"You received a warp ball!","color":"green"}]
give @a[tag=purchaseWarpSuccess] snowball{warp_ball:1b,display:{Name:"{\"text\":\"Warp ball\",\"color\":\"gold\",\"italic\":\"false\"}",Lore:["\"Throw it to create a warping outpost.\""]}} 1

execute as @a[tag=purchaseWarpSuccess] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

scoreboard players remove @a[tag=purchaseWarpSuccess] mins 480
tag @a remove purchaseWarpSuccess