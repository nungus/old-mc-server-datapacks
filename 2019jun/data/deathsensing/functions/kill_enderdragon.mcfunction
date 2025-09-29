execute as @a[scores={reg.kill.dragon=1..}] run tellraw @a [{"text":"\n"},{"selector":"@s","color":"gold"},{"text":" killed the ender dragon!\n","color":"yellow"}]
execute as @a[scores={reg.kill.dragon=1..}] as @a positioned as @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1000 0
execute as @a[scores={reg.kill.dragon=1..}] as @a positioned as @s run particle heart ^ ^1.25 ^0.25
execute as @a[scores={reg.kill.dragon=1..}] run scoreboard players set @a xp.dynamic 2000

scoreboard players set @a[scores={reg.kill.dragon=1..}] reg.kill.dragon 0