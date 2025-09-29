scoreboard players enable @a purchaseElytra

tag @a[scores={purchaseElytra=1..,mins=..119}] add purchaseElytraFail
tag @a[scores={purchaseElytra=1..,mins=120..}] add purchaseElytraSuccess

scoreboard players set @a purchaseElytra 0

#fail
title @a[tag=purchaseElytraFail] actionbar [{"text":"You don't have enough mins for the elytra.","color":"red"}]
execute as @a[tag=purchaseElytraFail] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
tag @a remove purchaseElytraFail

#success
title @a[tag=purchaseElytraSuccess,nbt={Inventory:[{Slot:102b,Count:1b}]}] actionbar [{"text":"You received a pair of elytra!","color":"green"}]
title @a[tag=purchaseElytraSuccess,nbt=!{Inventory:[{Slot:102b,Count:1b}]}] actionbar [{"text":"A pair of elytra appeared on your back!","color":"green"}]

give @a[tag=purchaseElytraSuccess,nbt={Inventory:[{Slot:102b,Count:1b}]}] elytra{license_elytra:1b,Unbreakable:1,display:{Name:"{\"text\":\"Licensed Elytra\",\"color\":\"yellow\",\"italic\":\"false\"}",Lore:["\"It's been used by like, at least a dozen other people. It smells so bad.\""]}} 1
replaceitem entity @a[tag=purchaseElytraSuccess,nbt=!{Inventory:[{Slot:102b,Count:1b}]}] armor.chest elytra{license_elytra:1b,Unbreakable:1,display:{Name:"{\"text\":\"Licensed Elytra\",\"color\":\"yellow\",\"italic\":\"false\"}",Lore:["\"It's been used by like, at least a dozen other people. It smells so bad.\""]}} 1

execute as @a[tag=purchaseElytraSuccess] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2

scoreboard players set @a[tag=purchaseElytraSuccess] elytraTimer 1
scoreboard players add @a[scores={elytraTimer=1..}] elytraTimer 1
#~ 864000 ticks is 12 hours
scoreboard players set @a[scores={elytraTimer=864000..}] elytraTimer 0

scoreboard players remove @a[tag=purchaseElytraSuccess] mins 120
scoreboard players set @a[tag=purchaseElytraSuccess] purchaseElytra 0
tag @a remove purchaseElytraSuccess


#invalid license
execute as @a[nbt={Inventory:[{Slot:102b,tag:{license_elytra:1b}}]}] unless score @s elytraTimer matches 1.. run tag @s add elytraInvalid

title @a[tag=elytraInvalid] actionbar [{"text":"You don't have a valid elytra license.","color":"red"}]
execute as @a[tag=elytraInvalid] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
replaceitem entity @a[tag=elytraInvalid] armor.chest air
give @a[tag=elytraInvalid] elytra{license_elytra:1b,Unbreakable:1,display:{Name:"{\"text\":\"Licensed Elytra\",\"color\":\"yellow\",\"italic\":\"false\"}",Lore:["\"It's been used by like, at least a dozen other people. It smells so bad.\""]}} 1

tag @a remove elytraInvalid

#place fireworks in offhand if not holding anything in offhand
tag @a[scores={elytraFlying=1..}] add elytraFirework

execute as @a[tag=elytraFirework] unless entity @s[nbt={Inventory:[{Slot:102b,Count:1b,tag:{license_elytra:1b}}]}] run tag @s remove elytraFirework

#~ holy duplication
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:1b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:2b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:3b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:4b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:5b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:6b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:7b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:8b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:9b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:10b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:11b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:12b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:13b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:14b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:15b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:16b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:17b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:18b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:19b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:20b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:21b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:22b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:23b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:24b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:25b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:26b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:27b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:28b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:29b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:30b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:31b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:32b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:33b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:34b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:35b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:36b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:37b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:38b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:39b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:40b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:41b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:42b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:43b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:44b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:45b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:46b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:47b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:48b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:49b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:50b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:51b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:52b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:53b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:54b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:55b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:56b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:57b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:58b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:59b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:60b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:61b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:62b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:63b}]}] remove elytraFirework
tag @a[tag=elytraFirework,nbt={Inventory:[{Slot:-106b,Count:64b}]}] remove elytraFirework

replaceitem entity @a[tag=elytraFirework] weapon.offhand firework_rocket{license_firework:1b,display:{Name:"{\"text\":\"Licensed Elytra Firework\",\"color\":\"yellow\",\"italic\":\"false\"}",Lore:["\"Disappears into thin air when it serves its purpose.\""]}} 1
kill @e[type=item,nbt={Item:{id:"minecraft:firework_rocket",tag:{license_firework:1b}}}]

execute as @a[nbt={Inventory:[{tag:{license_firework:1b}}]}] unless entity @s[scores={elytraTimer=1..}] run title @s actionbar [{"text":"Nice try! You can't use these fireworks wihout a license!","color":"red"}]
execute as @a[nbt={Inventory:[{tag:{license_firework:1b}}]}] unless entity @s[scores={elytraTimer=1..}] run clear @s firework_rocket{license_firework:1b}

clear @a[scores={elytraFlying=..0}] firework_rocket{license_firework:1b}

scoreboard players set @a[scores={elytraFlying=1..}] elytraFlying 0