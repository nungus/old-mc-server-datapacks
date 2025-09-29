scoreboard players enable @a purchaseVillager

tag @a[scores={purchaseVillager=1..,mins=..239}] add purchaseVillagerFail
tag @a[scores={purchaseVillager=1..,mins=240..}] add purchaseVillagerSuccess

scoreboard players set @a purchaseVillager 0

#fail
title @a[tag=purchaseVillagerFail] actionbar [{"text":"You don't have enough mins for the villager egg.","color":"red"}]
execute as @a[tag=purchaseVillagerFail] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
tag @a remove purchaseVillagerFail

#success
title @a[tag=purchaseVillagerSuccess] actionbar [{"text":"You received a villager egg!","color":"green"}]
give @a[tag=purchaseVillagerSuccess] villager_spawn_egg

execute as @a[tag=purchaseVillagerSuccess] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

scoreboard players remove @a[tag=purchaseVillagerSuccess] mins 240
tag @a remove purchaseVillagerSuccess