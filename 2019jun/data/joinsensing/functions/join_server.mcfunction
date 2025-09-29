scoreboard players set @a[tag=!member] mins 0

execute as @a[tag=!member] run tellraw @a [{"text":"\n"},{"selector":"@s","color":"gold"},{"text":" joined the server for the first time\n","color":"yellow"}]
execute as @a[tag=!member] as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 0.8
execute as @a[tag=!member] as @a at @s run particle heart ^ ^1.5 ^1 0 0 0 0 1

tag @a[tag=!member] add member