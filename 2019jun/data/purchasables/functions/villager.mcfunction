# meta & menu
scoreboard players enable @a purch.villager
tellraw @a[scores={purch.villager=1}] [{"text":"You can buy a ","color":"gray"},{"text":"villager spawn egg","color":"yellow"},{"text":" for 16 hours worth of mins.\n"},{"text":"[Buy]","color":"green","hoverEvent":{"action":"show_text","value":[{"text":"Cost: ","color":"gray"},{"text":"960","color":"yellow"},{"text":" mins","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger purch.villager set 2"}}]
execute as @a[scores={purch.villager=1}] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 1
scoreboard players set @a[scores={purch.villager=1}] purch.villager 0

#~ can't afford purchase
tellraw @a[scores={purch.villager=2,mins=..959}] [{"text":"You don't have enough mins to purchase this.","color":"red"}]
execute as @a[scores={purch.villager=2,mins=..959}] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
scoreboard players set @a[scores={purch.villager=2,mins=..959}] purch.villager 0

# buy villager spawn egg
title @a[scores={purch.villager=2}] actionbar [{"text":"You received the villager spawn egg!","color":"gold"}]
give @a[scores={purch.villager=2}] villager_spawn_egg 1
execute as @a[scores={purch.villager=2}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
scoreboard players remove @a[scores={purch.villager=2}] mins 960
scoreboard players set @a[scores={purch.villager=2}] purch.villager 0