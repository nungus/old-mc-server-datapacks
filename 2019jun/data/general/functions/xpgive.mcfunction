#~ gives players a lot of exp when someone defeats a boss
#~ negative exp was never used
xp add @a[scores={xp.dynamic=1..}] 10 points
scoreboard players remove @a[scores={xp.dynamic=10..}] xp.dynamic 10
xp add @a[scores={xp.dynamic=..-1}] -10 points
scoreboard players add @a[scores={xp.dynamic=..-10}] xp.dynamic 10

execute as @a[scores={xp.dynamic=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 0.05 1
execute as @a[scores={xp.dynamic=..-1}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 0.05 0

#~ obviously could have been done better with some iteration
#~ e.g. xp.dynamic.timer increases to 50; xp.dynamic.loop is incremented by 1
#~ and xp.dynamic.timer is reset; repeat until xp.dynamic.loop is 10

execute as @a[scores={xp.dynamic=1..,ticks=100}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=150}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=200}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=250}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=300}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=350}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=400}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=450}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=500}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=550}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=600}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=650}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=700}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=750}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=800}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=850}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=900}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=950}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=1000}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=1050}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=1100}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=1150}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1
execute as @a[scores={xp.dynamic=1..,ticks=1199}] at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.2 1