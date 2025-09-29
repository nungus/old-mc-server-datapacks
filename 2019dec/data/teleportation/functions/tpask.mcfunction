#entity receives teleportation ID if they don't have one already

execute as @a unless entity @s[scores={teleportID=1..}] run tag @s add falseID
execute as @a[tag=falseID] store result score @s teleportID run data get storage minecraft:idmang idCount
scoreboard players add @a[tag=falseID] teleportID 1
execute as @a[tag=falseID] store result storage minecraft:idmang idCount int 1 run scoreboard players get @s teleportID
tag @a[tag=falseID] remove falseID



#requesting teleportation

scoreboard players enable @a tpa
scoreboard players enable @a[scores={teleportTimer=1..}] tpyes

execute as @a if score @s tpa = @s teleportID run tellraw @s [{"text":"You can't teleport to yourself!","color":"red"}]
execute as @a if score @s tpa = @s teleportID run scoreboard players set @s tpa 0

execute as @a if score @s teleportID = @a[scores={tpa=1..},limit=1] tpa run scoreboard players set @s teleportTimer 1
execute as @a if score @s teleportID = @a[scores={tpa=1..},limit=1] tpa run scoreboard players set @a[scores={tpa=1..},limit=1] teleportTimer 1
execute as @a if score @s teleportID = @a[scores={tpa=1..},limit=1] tpa run tellraw @s [{"selector":"@a[scores={tpa=1..,teleportTimer=1}]","color":"yellow"},{"text":" wants to teleport to you. "},{"text":"[ACCEPT]","color":"green","clickEvent":{"action":"run_command","value":"/trigger tpa set 125000"}}]
execute as @a if score @s teleportID = @a[scores={tpa=1..},limit=1] tpa run tellraw @a[scores={teleportTimer=1,tpa=1..}] [{"text":"You sent a teleport request to ","color":"yellow"},{"selector":"@s"},{"text":"."}]

tag @a[scores={tpa=125000,teleportTimer=1..}] add tpaccepted

scoreboard players add @a[scores={teleportTimer=1..}] teleportTimer 1
scoreboard players set @a tpa 0



#accepting teleportation

tellraw @a[tag=tpaccepted] [{"text":"You accepted the request.","color":"green"}]
execute as @a[tag=tpaccepted] as @a at @s if score @s teleportTimer = @a[tag=tpaccepted,limit=1] teleportTimer run playsound entity.enderman.teleport master @a ~ ~ ~ 3 1.2
execute as @a[tag=tpaccepted] as @a if score @s teleportTimer = @a[tag=tpaccepted,limit=1] teleportTimer run tp @s @a[tag=tpaccepted,limit=1]
execute as @a[tag=tpaccepted] as @a if score @s teleportTimer = @a[tag=tpaccepted,limit=1] teleportTimer unless entity @s[tag=tpaccepted] run tellraw @s [{"selector":"@p[tag=tpaccepted]","color":"green"},{"text":" accepted the request."}]
execute as @a[tag=tpaccepted] as @a if score @s teleportTimer = @a[tag=tpaccepted,limit=1] teleportTimer run scoreboard players set @s teleportTimer 0

tag @a remove tpaccepted