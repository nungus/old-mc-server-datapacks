#self tp
execute as @a if score @s ID = @s tpa run tellraw @s [{"text":"You can't teleport to yourself.","color":"red"}]
execute as @a if score @s ID = @s tpa run scoreboard players reset @s tpa

#request success
execute as @a[scores={tpa=1..}] at @a if score @s tpa = @p ID run scoreboard players operation @p IDreq = @s ID
execute as @a[scores={tpa=1..}] at @a if score @s tpa = @p ID run tellraw @s [{"text":"Requested to teleport to ","color":"gray"},{"selector":"@p"},{"text":"."}]
execute as @a[scores={tpa=1..}] at @a if score @s tpa = @p ID run tellraw @p [{"text":"","color":"gray"},{"selector":"@s"},{"text":" wants to teleport to you. "},{"text":"[Accept]","color":"green","clickEvent":{"action":"run_command","value":"/trigger tpa set 909090"}}]

#accept
execute as @a[scores={tpa=909090}] at @a if score @s IDreq = @p ID run tellraw @s [{"text":"You accepted ","color":"green"},{"selector":"@p"},{"text":"'s request."}]
execute as @a[scores={tpa=909090}] at @a if score @s IDreq = @p ID run tellraw @p [{"text":"","color":"green"},{"selector":"@s"},{"text":" accepted your request."}]
execute as @a[scores={tpa=909090}] at @a if score @s IDreq = @p ID run playsound entity.enderman.teleport master @a ~ ~ ~ 1
execute as @a[scores={tpa=909090}] at @a if score @s IDreq = @p ID run tp @p @s
execute as @a[scores={tpa=909090}] at @s if score @s IDreq matches 1.. run playsound entity.enderman.teleport master @a ~ ~ ~ 1
execute as @a[scores={tpa=909090}] at @s if score @s IDreq matches 1.. run particle dragon_breath ~ ~1 ~ 0 0 0 0.05 20
execute as @a[scores={tpa=909090}] run scoreboard players reset @s IDreq

scoreboard players reset @a tpa