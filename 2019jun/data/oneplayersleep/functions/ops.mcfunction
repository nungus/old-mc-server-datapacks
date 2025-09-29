# meta
execute as @a[nbt={SleepTimer:0s},scores={ops.timer=1..}] run title @a actionbar [{"selector":"@s"},{"text":" is no longer sleeping","color":"dark_aqua"}]
execute unless entity @a[scores={ops.timer=1..}] run scoreboard players set @a[nbt={SleepTimer:1s}] ops.timer 1
stopsound @a[nbt={SleepTimer:0s},scores={ops.timer=1..}]
effect clear @a[nbt={SleepTimer:0s},scores={ops.timer=1..}] blindness
effect clear @a[nbt={SleepTimer:0s},scores={ops.timer=1..}] nausea
scoreboard players set @a[nbt={SleepTimer:0s},scores={ops.timer=1..}] ops.timer 0
execute as @a[scores={ops.timer=1}] at @s run playsound block.portal.trigger master @s ~ ~ ~ 1 0.8
effect give @a[scores={ops.timer=1}] blindness 6 0 true
effect give @a[scores={ops.timer=1}] nausea 8 0 true
scoreboard players add @a[scores={ops.timer=1..99}] ops.timer 1


# actionbar
execute as @a[scores={ops.timer=1..}] run title @a actionbar [{"selector":"@s"},{"text":" is sleeping > ","color":"dark_aqua"},{"score":{"name":"@s","objective":"ops.timer"}},{"text":"%"}]


# successful sleep
execute as @a[scores={ops.timer=100}] run time set 23500
execute as @a[scores={ops.timer=100}] run weather clear 999999
execute as @a[scores={ops.timer=100}] as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
execute as @a[scores={ops.timer=100}] run tellraw @a [{"selector":"@s"},{"text":" slept through the night","color":"dark_aqua"}]
scoreboard players set @a[scores={ops.timer=100}] ops.timer 0