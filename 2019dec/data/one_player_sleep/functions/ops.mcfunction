execute unless entity @a[scores={opsTimer=1..}] run scoreboard players set @a[nbt={SleepTimer:1s}] opsTimer 1
scoreboard players add @a[scores={opsTimer=1..}] opsTimer 1

execute as @a[scores={opsTimer=1..},nbt={SleepTimer:0s}] run title @a actionbar [{"selector":"@s","color":"gray"},{"text":" is no longer sleeping.","color":"dark_aqua"}]
scoreboard players set @a[scores={opsTimer=1..},nbt={SleepTimer:0s}] opsTimer 0

execute as @a[scores={opsTimer=1..99}] run title @a actionbar [{"selector":"@s","color":"gray"},{"text":" is sleeping. ","color":"dark_aqua"},{"score":{"name":"@s","objective":"opsTimer"}},{"text":"%"}]
execute as @a[scores={opsTimer=100}] run title @a actionbar [{"selector":"@s","color":"gray"},{"text":" is sleeping. ","color":"dark_aqua"},{"score":{"name":"@s","objective":"opsTimer"},"color":"gold"},{"text":"%","color":"gold"}]

execute as @a[scores={opsTimer=100}] run time set 0
execute as @a[scores={opsTimer=100}] run weather clear 9999
execute as @a[scores={opsTimer=100}] as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 2
scoreboard players set @a[scores={opsTimer=100}] opsTimer 0