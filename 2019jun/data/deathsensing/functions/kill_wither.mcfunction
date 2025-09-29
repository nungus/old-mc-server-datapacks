execute as @a[scores={reg.kill.wither=1..}] run tellraw @a [{"text":"\n"},{"selector":"@s","color":"gold"},{"text":" killed a wither!\n","color":"yellow"}]
execute as @a[scores={reg.kill.wither=1..}] as @a positioned as @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1000 0.6
execute as @a[scores={reg.kill.wither=1..}] as @a positioned as @s run particle heart ^ ^1.25 ^0.25
execute as @a[scores={reg.kill.wither=1..}] run scoreboard players set @a xp.dynamic 1000

scoreboard players set @a[scores={reg.kill.wither=1..}] reg.kill.wither 0