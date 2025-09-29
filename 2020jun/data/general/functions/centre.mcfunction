#ops
execute as @a[nbt={SleepTimer:10s}] run time set day
execute as @a[nbt={SleepTimer:10s}] run tellraw @a [{"selector":"@s","color":"gray"},{"text":" slept."}]

#suicide
scoreboard players enable @a suicide
execute as @a[scores={suicide=1..}] run function general:suicide

#tpa
##get ID
execute if entity @a[tag=!IDgot] run function general:idget
##teleport
scoreboard players enable @a tpa
execute if entity @a[scores={tpa=1..}] run function general:tpa