# meta & menu
scoreboard players enable @a purch.shulker
tellraw @a[scores={purch.shulker=1}] [{"text":"You can buy a ","color":"gray"},{"text":"shulker box","color":"yellow"},{"text":" for 80 mins.\n"},{"text":"[Buy]","color":"green","hoverEvent":{"action":"show_text","value":[{"text":"Cost: ","color":"gray"},{"text":"80","color":"yellow"},{"text":" mins","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger purch.shulker set 2"}},{"text":" - "},{"text":"[<]","color":"aqua","hoverEvent":{"action":"show_text","value":[{"text":"Previous colour","color":"dark_aqua"}]},"clickEvent":{"action":"run_command","value":"/trigger colour.down"}},{"text":" "},{"text":"[>]","color":"aqua","hoverEvent":{"action":"show_text","value":[{"text":"Next colour","color":"dark_aqua"}]},"clickEvent":{"action":"run_command","value":"/trigger colour.up set 1"}}]
scoreboard players set @a[scores={purch.shulker=1}] colour.timer 1

scoreboard players set @a[scores={purch.shulker=1}] purch.shulker 0

#~ can't afford purchase
tellraw @a[scores={purch.shulker=2,mins=..79}] [{"text":"You don't have enough mins to purchase this.","color":"red"}]
execute as @a[scores={purch.shulker=2,mins=..79}] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
scoreboard players set @a[scores={purch.shulker=2,mins=..79}] purch.shulker 0


# buy shulker box
title @a[scores={purch.shulker=2,colour.type=1}] actionbar [{"text":"You received the shulker box!","color":"dark_purple"}]

#~ delicious boilerplate
give @a[scores={purch.shulker=2,colour=1,colour.type=1}] shulker_box
give @a[scores={purch.shulker=2,colour=2,colour.type=1}] white_shulker_box
give @a[scores={purch.shulker=2,colour=3,colour.type=1}] orange_shulker_box
give @a[scores={purch.shulker=2,colour=4,colour.type=1}] magenta_shulker_box
give @a[scores={purch.shulker=2,colour=5,colour.type=1}] light_blue_shulker_box
give @a[scores={purch.shulker=2,colour=6,colour.type=1}] yellow_shulker_box
give @a[scores={purch.shulker=2,colour=7,colour.type=1}] lime_shulker_box
give @a[scores={purch.shulker=2,colour=8,colour.type=1}] pink_shulker_box
give @a[scores={purch.shulker=2,colour=9,colour.type=1}] gray_shulker_box
give @a[scores={purch.shulker=2,colour=10,colour.type=1}] light_gray_shulker_box
give @a[scores={purch.shulker=2,colour=11,colour.type=1}] cyan_shulker_box
give @a[scores={purch.shulker=2,colour=12,colour.type=1}] purple_shulker_box
give @a[scores={purch.shulker=2,colour=13,colour.type=1}] blue_shulker_box
give @a[scores={purch.shulker=2,colour=14,colour.type=1}] brown_shulker_box
give @a[scores={purch.shulker=2,colour=15,colour.type=1}] green_shulker_box
give @a[scores={purch.shulker=2,colour=16,colour.type=1}] red_shulker_box
give @a[scores={purch.shulker=2,colour=17,colour.type=1}] black_shulker_box

scoreboard players remove @a[scores={purch.shulker=2,colour.type=1}] mins 80
execute as @a[scores={purch.shulker=2,colour.type=1}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2
scoreboard players set @a[scores={purch.shulker=2}] purch.shulker 0