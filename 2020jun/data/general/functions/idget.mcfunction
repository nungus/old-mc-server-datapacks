tag @r[tag=!IDgot] add IDget
execute as @a[tag=IDget] run scoreboard players add ID_placehold IDcount 1
execute store result score @a[tag=IDget] ID run scoreboard players get ID_placehold IDcount
tag @a[tag=IDget] add IDgot
tag @a remove IDget