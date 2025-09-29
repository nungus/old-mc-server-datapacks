execute as @a unless entity @s[tag=hascolourWhite] run tag @s add hascolourWhite
scoreboard players enable @a colour_menu

title @a[scores={colour_menu=18}] times 0 100 20

tellraw @a[scores={colour_menu=18}] [{"text":"Colour shop - click a colour to preview it.\n"},{"text":"[+]","color":"red","hoverEvent":{"action":"show_text","value":[{"text":"Red","color":"red"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 2"}},{"text":"[+]","color":"dark_red","hoverEvent":{"action":"show_text","value":[{"text":"Dark Red","color":"dark_red"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 3"}},{"text":"[+]","color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Gold","color":"gold"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 4"}},{"text":"[+]","color":"yellow","hoverEvent":{"action":"show_text","value":[{"text":"Yellow","color":"yellow"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 5"}},{"text":"[+]","color":"green","hoverEvent":{"action":"show_text","value":[{"text":"Green","color":"green"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 6"}},{"text":"[+]","color":"dark_green","hoverEvent":{"action":"show_text","value":[{"text":"Dark Green","color":"dark_green"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 7"}},{"text":"[+]","color":"aqua","hoverEvent":{"action":"show_text","value":[{"text":"Aqua","color":"aqua"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 8"}},{"text":"[+]","color":"dark_aqua","hoverEvent":{"action":"show_text","value":[{"text":"Dark Aqua","color":"dark_aqua"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 9"}},{"text":"       Each colour costs "},{"text":"150","color":"yellow"},{"text":" mins.\n","color":"white"},{"text":"[+]","color":"blue","hoverEvent":{"action":"show_text","value":[{"text":"Blue","color":"blue"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 10"}},{"text":"[+]","color":"dark_blue","hoverEvent":{"action":"show_text","value":[{"text":"Dark Blue","color":"dark_blue"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 11"}},{"text":"[+]","color":"light_purple","hoverEvent":{"action":"show_text","value":[{"text":"Pink","color":"light_purple"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 12"}},{"text":"[+]","color":"dark_purple","hoverEvent":{"action":"show_text","value":[{"text":"Purple","color":"dark_purple"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 13"}},{"text":"[+]","color":"black","hoverEvent":{"action":"show_text","value":[{"text":"Black","color":"black"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 14"}},{"text":"[+]","color":"dark_gray","hoverEvent":{"action":"show_text","value":[{"text":"Dark Grey","color":"dark_gray"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 15"}},{"text":"[+]","color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Light Grey","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 16"}},{"text":"[+]","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"White","color":"white"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 17"}},{"text":"                     "},{"text":"[Buy]","color":"green","clickEvent":{"action":"run_command","value":"/trigger colour_menu set 125000"}}]

execute as @a[scores={colour_menu=18}] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 1

execute as @a[scores={colour_menu=2..}] unless score @s colour_menu matches 125000.. store result score @s colour_selected run scoreboard players get @s colour_menu
#selection

execute as @a[scores={colour_menu=2..18}] run team leave @s

#~ displaying a selection of colours on a scroller for a preview
execute as @a[scores={colour_menu=2}] run title @s title [{"text":"<"},{"selector":"@s","color":"red"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=3}] run title @s title [{"text":"<"},{"selector":"@s","color":"dark_red"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=4}] run title @s title [{"text":"<"},{"selector":"@s","color":"gold"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=5}] run title @s title [{"text":"<"},{"selector":"@s","color":"yellow"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=6}] run title @s title [{"text":"<"},{"selector":"@s","color":"green"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=7}] run title @s title [{"text":"<"},{"selector":"@s","color":"dark_green"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=8}] run title @s title [{"text":"<"},{"selector":"@s","color":"aqua"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=9}] run title @s title [{"text":"<"},{"selector":"@s","color":"dark_aqua"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=10}] run title @s title [{"text":"<"},{"selector":"@s","color":"blue"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=11}] run title @s title [{"text":"<"},{"selector":"@s","color":"dark_blue"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=12}] run title @s title [{"text":"<"},{"selector":"@s","color":"light_purple"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=13}] run title @s title [{"text":"<"},{"selector":"@s","color":"dark_purple"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=14}] run title @s title [{"text":"<"},{"selector":"@s","color":"black"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=15}] run title @s title [{"text":"<"},{"selector":"@s","color":"dark_gray"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=16}] run title @s title [{"text":"<"},{"selector":"@s","color":"gray"},{"text":">","color":"white"}]
execute as @a[scores={colour_menu=17..18}] run title @s title [{"text":"<"},{"selector":"@s","color":"white"},{"text":">","color":"white"}]


execute as @a[scores={colour_menu=2}] run title @s subtitle [{"text":"Red"}]
execute as @a[scores={colour_menu=3}] run title @s subtitle [{"text":"Dark Red"}]
execute as @a[scores={colour_menu=4}] run title @s subtitle [{"text":"Gold"}]
execute as @a[scores={colour_menu=5}] run title @s subtitle [{"text":"Yellow"}]
execute as @a[scores={colour_menu=6}] run title @s subtitle [{"text":"Green"}]
execute as @a[scores={colour_menu=7}] run title @s subtitle [{"text":"Dark Green"}]
execute as @a[scores={colour_menu=8}] run title @s subtitle [{"text":"Aqua"}]
execute as @a[scores={colour_menu=9}] run title @s subtitle [{"text":"Dark Aqua"}]
execute as @a[scores={colour_menu=10}] run title @s subtitle [{"text":"Blue"}]
execute as @a[scores={colour_menu=11}] run title @s subtitle [{"text":"Dark Blue"}]
execute as @a[scores={colour_menu=12}] run title @s subtitle [{"text":"Pink"}]
execute as @a[scores={colour_menu=13}] run title @s subtitle [{"text":"Purple"}]
execute as @a[scores={colour_menu=14}] run title @s subtitle [{"text":"Black"}]
execute as @a[scores={colour_menu=15}] run title @s subtitle [{"text":"Dark Grey"}]
execute as @a[scores={colour_menu=16}] run title @s subtitle [{"text":"Light Grey"}]
execute as @a[scores={colour_menu=17}] run title @s subtitle [{"text":"White"}]
execute as @a[scores={colour_menu=18}] run title @s subtitle [{"text":"(Select a colour)"}]

#fail

tag @a[scores={colour_menu=125000,colour_selected=2..17,mins=..149}] add purchaseColourFailMins

execute as @a[scores={colour_menu=125000,colour_selected=2}] if entity @s[tag=hascolourRed] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=3}] if entity @s[tag=hascolourDarkRed] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=4}] if entity @s[tag=hascolourGold] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=5}] if entity @s[tag=hascolourYellow] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=6}] if entity @s[tag=hascolourGreen] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=7}] if entity @s[tag=hascolourDarkGreen] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=8}] if entity @s[tag=hascolourAqua] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=9}] if entity @s[tag=hascolourDarkAqua] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=10}] if entity @s[tag=hascolourBlue] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=11}] if entity @s[tag=hascolourDarkBlue] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=12}] if entity @s[tag=hascolourPink] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=13}] if entity @s[tag=hascolourPurple] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=14}] if entity @s[tag=hascolourBlack] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=15}] if entity @s[tag=hascolourDarkGrey] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=16}] if entity @s[tag=hascolourLightGrey] run tag @s add purchaseColourFailDuplicate
execute as @a[scores={colour_menu=125000,colour_selected=17}] if entity @s[tag=hascolourWhite] run tag @s add purchaseColourFailDuplicate

title @a[tag=purchaseColourFailMins] actionbar [{"text":"You don't have enough mins for the colour.","color":"red"}]
execute as @a[tag=purchaseColourFailMins] unless entity @s[tag=purchaseColourFailDuplicate] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
scoreboard players set @a[tag=purchaseColourFailMins] colour_menu 0
tag @a remove purchaseColourFailMins

title @a[tag=purchaseColourFailDuplicate] actionbar [{"text":"You already have this colour!","color":"red"}]
execute as @a[tag=purchaseColourFailDuplicate] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
scoreboard players set @a[tag=purchaseColourFailDuplicate] colour_menu 0
tag @a remove purchaseColourFailDuplicate


#success

execute as @a[scores={colour_menu=125000,colour_selected=2}] unless entity @s[tag=hascolourRed] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=3}] unless entity @s[tag=hascolourDarkRed] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=4}] unless entity @s[tag=hascolourGold] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=5}] unless entity @s[tag=hascolourYellow] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=6}] unless entity @s[tag=hascolourGreen] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=7}] unless entity @s[tag=hascolourDarkGreen] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=8}] unless entity @s[tag=hascolourAqua] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=9}] unless entity @s[tag=hascolourDarkAqua] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=10}] unless entity @s[tag=hascolourBlue] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=11}] unless entity @s[tag=hascolourDarkBlue] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=12}] unless entity @s[tag=hascolourPink] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=13}] unless entity @s[tag=hascolourPurple] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=14}] unless entity @s[tag=hascolourBlack] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=15}] unless entity @s[tag=hascolourDarkGrey] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=16}] unless entity @s[tag=hascolourLightGrey] run tag @s add purchaseColourSuccess
execute as @a[scores={colour_menu=125000,colour_selected=17}] unless entity @s[tag=hascolourWhite] run tag @s add purchaseColourSuccess

execute as @a[tag=purchaseColourSuccess] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2
title @a[tag=purchaseColourSuccess] subtitle [{"text":"Purchased!","color":"green"}]
title @a[tag=purchaseColourSuccess] actionbar [{"text":"You got the colour!","color":"green"}]

execute as @a[scores={colour_selected=2},tag=purchaseColourSuccess] run tag @s add hascolourRed
execute as @a[scores={colour_selected=3},tag=purchaseColourSuccess] run tag @s add hascolourDarkRed
execute as @a[scores={colour_selected=4},tag=purchaseColourSuccess] run tag @s add hascolourGold
execute as @a[scores={colour_selected=5},tag=purchaseColourSuccess] run tag @s add hascolourYellow
execute as @a[scores={colour_selected=6},tag=purchaseColourSuccess] run tag @s add hascolourGreen
execute as @a[scores={colour_selected=7},tag=purchaseColourSuccess] run tag @s add hascolourDarkGreen
execute as @a[scores={colour_selected=8},tag=purchaseColourSuccess] run tag @s add hascolourAqua
execute as @a[scores={colour_selected=9},tag=purchaseColourSuccess] run tag @s add hascolourDarkAqua
execute as @a[scores={colour_selected=10},tag=purchaseColourSuccess] run tag @s add hascolourBlue
execute as @a[scores={colour_selected=11},tag=purchaseColourSuccess] run tag @s add hascolourDarkBlue
execute as @a[scores={colour_selected=12},tag=purchaseColourSuccess] run tag @s add hascolourPink
execute as @a[scores={colour_selected=13},tag=purchaseColourSuccess] run tag @s add hascolourPurple
execute as @a[scores={colour_selected=14},tag=purchaseColourSuccess] run tag @s add hascolourBlack
execute as @a[scores={colour_selected=15},tag=purchaseColourSuccess] run tag @s add hascolourDarkGrey
execute as @a[scores={colour_selected=16},tag=purchaseColourSuccess] run tag @s add hascolourLightGrey
execute as @a[scores={colour_selected=17},tag=purchaseColourSuccess] run tag @s add hascolourWhite

scoreboard players remove @a[tag=purchaseColourSuccess] mins 150
tag @a remove purchaseColourSuccess


#apply colour to name
tellraw @a[scores={colour_menu=1}] [{"text":"Colours - Apply your unlocked colours to your name.\n"},{"text":"[+]","color":"red","hoverEvent":{"action":"show_text","value":[{"text":"Red","color":"red"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 2"}},{"text":"[+]","color":"dark_red","hoverEvent":{"action":"show_text","value":[{"text":"Dark Red","color":"dark_red"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 3"}},{"text":"[+]","color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Gold","color":"gold"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 4"}},{"text":"[+]","color":"yellow","hoverEvent":{"action":"show_text","value":[{"text":"Yellow","color":"yellow"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 5"}},{"text":"[+]","color":"green","hoverEvent":{"action":"show_text","value":[{"text":"Green","color":"green"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 6"}},{"text":"[+]","color":"dark_green","hoverEvent":{"action":"show_text","value":[{"text":"Dark Green","color":"dark_green"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 7"}},{"text":"[+]","color":"aqua","hoverEvent":{"action":"show_text","value":[{"text":"Aqua","color":"aqua"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 8"}},{"text":"[+]\n","color":"dark_aqua","hoverEvent":{"action":"show_text","value":[{"text":"Dark Aqua","color":"dark_aqua"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 9"}},{"text":"[+]","color":"blue","hoverEvent":{"action":"show_text","value":[{"text":"Blue","color":"blue"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 10"}},{"text":"[+]","color":"dark_blue","hoverEvent":{"action":"show_text","value":[{"text":"Dark Blue","color":"dark_blue"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 11"}},{"text":"[+]","color":"light_purple","hoverEvent":{"action":"show_text","value":[{"text":"Pink","color":"light_purple"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 12"}},{"text":"[+]","color":"dark_purple","hoverEvent":{"action":"show_text","value":[{"text":"Purple","color":"dark_purple"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 13"}},{"text":"[+]","color":"black","hoverEvent":{"action":"show_text","value":[{"text":"Black","color":"black"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 14"}},{"text":"[+]","color":"dark_gray","hoverEvent":{"action":"show_text","value":[{"text":"Dark Grey","color":"dark_gray"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 15"}},{"text":"[+]","color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Light Grey","color":"gray"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 16"}},{"text":"[+]","color":"white","hoverEvent":{"action":"show_text","value":[{"text":"White","color":"white"}]},"clickEvent":{"action":"run_command","value":"/trigger colour_menu set 17"}},{"text":"                    "},{"text":"[Apply]","color":"green","clickEvent":{"action":"run_command","value":"/trigger colour_menu set 125001"}}]

execute as @a[scores={colour_menu=125001,colour_selected=2}] if entity @s[tag=hascolourRed] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=3}] if entity @s[tag=hascolourDarkRed] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=4}] if entity @s[tag=hascolourGold] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=5}] if entity @s[tag=hascolourYellow] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=6}] if entity @s[tag=hascolourGreen] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=7}] if entity @s[tag=hascolourDarkGreen] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=8}] if entity @s[tag=hascolourAqua] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=9}] if entity @s[tag=hascolourDarkAqua] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=10}] if entity @s[tag=hascolourBlue] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=11}] if entity @s[tag=hascolourDarkBlue] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=12}] if entity @s[tag=hascolourPink] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=13}] if entity @s[tag=hascolourPurple] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=14}] if entity @s[tag=hascolourBlack] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=15}] if entity @s[tag=hascolourDarkGrey] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=16}] if entity @s[tag=hascolourLightGrey] run tag @s add colourApplySuccess
execute as @a[scores={colour_menu=125001,colour_selected=17}] if entity @s[tag=hascolourWhite] run tag @s add colourApplySuccess

execute as @a[tag=colourApplySuccess] at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 2
title @a[tag=colourApplySuccess] actionbar [{"text":"You updated your colour.","color":"green"}]

execute as @a[scores={colour_selected=2},tag=colourApplySuccess] run team join Red @s
execute as @a[scores={colour_selected=3},tag=colourApplySuccess] run team join DarkRed @s
execute as @a[scores={colour_selected=4},tag=colourApplySuccess] run team join Gold @s
execute as @a[scores={colour_selected=5},tag=colourApplySuccess] run team join Yellow @s
execute as @a[scores={colour_selected=6},tag=colourApplySuccess] run team join Green @s
execute as @a[scores={colour_selected=7},tag=colourApplySuccess] run team join DarkGreen @s
execute as @a[scores={colour_selected=8},tag=colourApplySuccess] run team join Aqua @s
execute as @a[scores={colour_selected=9},tag=colourApplySuccess] run team join DarkAqua @s
execute as @a[scores={colour_selected=10},tag=colourApplySuccess] run team join Blue @s
execute as @a[scores={colour_selected=11},tag=colourApplySuccess] run team join DarkBlue @s
execute as @a[scores={colour_selected=12},tag=colourApplySuccess] run team join Pink @s
execute as @a[scores={colour_selected=13},tag=colourApplySuccess] run team join Purple @s
execute as @a[scores={colour_selected=14},tag=colourApplySuccess] run team join Black @s
execute as @a[scores={colour_selected=15},tag=colourApplySuccess] run team join DarkGrey @s
execute as @a[scores={colour_selected=16},tag=colourApplySuccess] run team join LightGrey @s
execute as @a[scores={colour_selected=17},tag=colourApplySuccess] run team leave @s

tag @a remove colourApplySuccess

#fail applying colour to name

execute as @a[scores={colour_menu=125001,colour_selected=2}] unless entity @s[tag=hascolourRed] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=3}] unless entity @s[tag=hascolourDarkRed] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=4}] unless entity @s[tag=hascolourGold] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=5}] unless entity @s[tag=hascolourYellow] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=6}] unless entity @s[tag=hascolourGreen] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=7}] unless entity @s[tag=hascolourDarkGreen] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=8}] unless entity @s[tag=hascolourAqua] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=9}] unless entity @s[tag=hascolourDarkAqua] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=10}] unless entity @s[tag=hascolourBlue] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=11}] unless entity @s[tag=hascolourDarkBlue] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=12}] unless entity @s[tag=hascolourPink] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=13}] unless entity @s[tag=hascolourPurple] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=14}] unless entity @s[tag=hascolourBlack] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=15}] unless entity @s[tag=hascolourDarkGrey] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=16}] unless entity @s[tag=hascolourLightGrey] run tag @s add colourApplyFail
execute as @a[scores={colour_menu=125001,colour_selected=17}] unless entity @s[tag=hascolourWhite] run tag @s add colourApplyFail

execute as @a[tag=colourApplyFail] at @s run playsound block.note_block.guitar master @s ~ ~ ~ 1 0
title @a[tag=colourApplyFail] actionbar [{"text":"You haven't unlocked this colour.","color":"red"}]

tag @a remove colourApplyFail

scoreboard players set @a colour_menu 0