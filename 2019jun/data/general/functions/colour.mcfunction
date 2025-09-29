# meta
scoreboard players enable @a colour.up
scoreboard players enable @a colour.down

execute as @a[scores={colour.timer=1,colour.type=1}] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 1

scoreboard players add @a[scores={colour.timer=1..}] colour.timer 1
scoreboard players set @a[scores={colour.timer=50}] colour.timer 0
scoreboard players set @a[scores={colour.timer=1..}] colour.type 1
title @a[scores={colour.timer=1..}] times 0 10 10

scoreboard players set @a[scores={colour=..0,colour.type=1}] colour 17
scoreboard players set @a[scores={colour=18..,colour.type=1}] colour 1


# colour up
scoreboard players set @a[scores={colour.up=1..}] colour.timer 1
scoreboard players add @a[scores={colour.up=1..}] colour 1
scoreboard players set @a[scores={colour.up=1..}] colour.up 0

# colour down
scoreboard players set @a[scores={colour.down=1..}] colour.timer 1
scoreboard players remove @a[scores={colour.down=1..}] colour 1
scoreboard players set @a[scores={colour.down=1..}] colour.down 0


# titles
title @a[scores={colour.timer=1..,colour.type=1}] title [{"text":"Colour:"}]
title @a[scores={colour.timer=1..,colour=1,colour.type=1}] subtitle [{"text":"default","color":"dark_purple"}]
title @a[scores={colour.timer=1..,colour=2,colour.type=1}] subtitle [{"text":"white","color":"white"}]
title @a[scores={colour.timer=1..,colour=3,colour.type=1}] subtitle [{"text":"orange","color":"gold"}]
title @a[scores={colour.timer=1..,colour=4,colour.type=1}] subtitle [{"text":"magenta","color":"light_purple"}]
title @a[scores={colour.timer=1..,colour=5,colour.type=1}] subtitle [{"text":"light blue","color":"aqua"}]
title @a[scores={colour.timer=1..,colour=6,colour.type=1}] subtitle [{"text":"yellow","color":"yellow"}]
title @a[scores={colour.timer=1..,colour=7,colour.type=1}] subtitle [{"text":"lime","color":"green"}]
title @a[scores={colour.timer=1..,colour=8,colour.type=1}] subtitle [{"text":"pink","color":"light_purple"}]
title @a[scores={colour.timer=1..,colour=9,colour.type=1}] subtitle [{"text":"grey","color":"dark_gray"}]
title @a[scores={colour.timer=1..,colour=10,colour.type=1}] subtitle [{"text":"light grey","color":"gray"}]
title @a[scores={colour.timer=1..,colour=11,colour.type=1}] subtitle [{"text":"cyan","color":"dark_aqua"}]
title @a[scores={colour.timer=1..,colour=12,colour.type=1}] subtitle [{"text":"purple","color":"dark_purple"}]
title @a[scores={colour.timer=1..,colour=13,colour.type=1}] subtitle [{"text":"blue","color":"blue"}]
title @a[scores={colour.timer=1..,colour=14,colour.type=1}] subtitle [{"text":"brown","color":"dark_red"}]
title @a[scores={colour.timer=1..,colour=15,colour.type=1}] subtitle [{"text":"green","color":"dark_green"}]
title @a[scores={colour.timer=1..,colour=16,colour.type=1}] subtitle [{"text":"red","color":"red"}]
title @a[scores={colour.timer=1..,colour=17,colour.type=1}] subtitle [{"text":"black","color":"black"}]