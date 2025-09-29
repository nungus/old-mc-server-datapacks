# meta & menu
scoreboard players enable @a purch.elytra
tellraw @a[scores={purch.elytra=1}] [{"text":"You can buy a pair of ","color":"gray"},{"text":"elytra","color":"yellow"},{"text":" for 3 hours worth of mins.\n"},{"text":"[Buy]","color":"green","hoverEvent":{"action":"show_text","value":[{"text":"Cost: ","color":"gray"},{"text":"180","color":"yellow"},{"text":" mins","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger purch.elytra set 2"}}]
execute as @a[scores={purch.elytra=1}] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 1

#~ can't afford purchase
tellraw @a[scores={purch.elytra=2,mins=..179}] [{"text":"You don't have enough mins to purchase this.","color":"red"}]
execute as @a[scores={purch.elytra=2,mins=..179}] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
scoreboard players set @a[scores={purch.elytra=2,mins=..179}] purch.elytra 0


# buy elytra
tellraw @a[scores={purch.elytra=2},nbt=!{Inventory:[{Slot:102b,Count:1b}]}] [{"text":"Suddenly, you felt a pair of elytra hanging from your back!","color":"gray"}]
tellraw @a[scores={purch.elytra=2},nbt={Inventory:[{Slot:102b,Count:1b}]}] [{"text":"You were already wearing something on your back, so a pair\nof elytra descended from above!","color":"gray"}]
give @a[scores={purch.elytra=2},nbt={Inventory:[{Slot:102b,Count:1b}]}] elytra{Unbreakable:1,display:{Name:"{\"text\":\"Elultra\",\"color\":\"gold\",\"italic\":\"false\"}",Lore:["\"Smells like the faeces of an angel.\""]}} 1
replaceitem entity @a[scores={purch.elytra=2},nbt=!{Inventory:[{Slot:102b,Count:1b}]}] armor.chest elytra{Unbreakable:1,display:{Name:"{\"text\":\"Elultra\",\"color\":\"gold\",\"italic\":\"false\"}",Lore:["\"Smells like the faeces of an angel.\""]}} 1
execute as @a[scores={purch.elytra=2}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 2

tag @a[scores={purch.elytra=2}] add elytrue
scoreboard players remove @a[scores={purch.elytra=2}] mins 180
scoreboard players set @a[scores={purch.elytra=1..}] purch.elytra 0


# remove elytra if it has not been bought yet
tag @a[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra"}]},tag=!elytrue] add elyfalse

title @a[tag=elyfalse] times 5 30 5
title @a[tag=elyfalse] actionbar [{"text":"You can't wear this because you haven't unlocked elytra yet.","color":"red"}]
execute as @a[tag=elyfalse] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
give @a[tag=elyfalse] elytra{Unbreakable:1,display:{Name:"{\"text\":\"Elultra\",\"color\":\"gold\",\"italic\":\"false\"}",Lore:["\"Smells like the faeces of an angel.\""]}} 1
replaceitem entity @a[tag=elyfalse] armor.chest air

tag @a[tag=elyfalse] remove elyfalse


# if the player is flying and has nothing equipped in their offhand, pur fireworks in their offhand
tag @a[scores={reg.fly=100..}] add reg.firework

#~ firework tag boilerplate misery (i don't believe there's an easier way to do this on this version...)
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:1b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:2b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:3b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:4b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:5b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:6b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:7b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:8b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:9b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:10b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:11b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:12b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:13b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:14b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:15b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:16b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:17b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:18b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:19b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:20b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:21b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:22b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:23b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:24b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:25b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:26b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:27b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:28b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:29b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:30b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:31b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:32b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:33b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:34b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:35b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:36b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:37b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:38b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:39b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:40b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:41b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:42b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:43b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:44b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:45b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:46b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:47b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:48b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:49b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:50b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:51b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:52b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:53b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:54b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:55b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:56b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:57b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:58b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:59b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:60b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:61b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:62b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:63b}]}] remove reg.firework
tag @a[tag=reg.firework,nbt={Inventory:[{Slot:-106b,Count:64b}]}] remove reg.firework

replaceitem entity @a[tag=reg.firework] weapon.offhand firework_rocket 1
scoreboard players set @a[scores={reg.fly=100..}] reg.fly 0