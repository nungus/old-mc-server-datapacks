# Old Minecraft server datapacks
This is a collection of datapacks used on my private Minecraft servers in 2019-2020.<br>
Everything is handled via scoreboard triggers and NBT.

These MCFunctions are far from perfect, and have most commands running every tick (20TPS).
However, they were also written quickly and worked well, which was more important. Server performance was fine (as far as I remember), using 5GB~>9GB RAM.

Comments beginning with `#~` are ones that have been added to the files in 2025, for this repository.
They have not been added to all files.

[/2019dec](2019dec) had the most time and effort put into it, particularly in [/2019dec/data/teleportation](2019dec/data/teleportation) with Warp balls and TPAsk.

## Content
### 2020jun
- `/trigger tpa set <ID>` - TPAsk: request to teleport to other players (player IDs typically displayed in TAB).
- `/trigger suicide` - Travel to your own spawnpoint.

### 2019dec
- `/trigger help` - In-game interactive help display.
- `/trigger glow` - Toggle glowing effect.
- One-player sleep. Skips to daytime if one player sleeps for 5 seconds.
- `/trigger shop` - A shop with various items. The currency to spend is 'mins', earned from minutes of playtime.
  - Temporary elytra license that expires after 12 hours of playtime.
    - A player is unable to equip a licensed elytra without an active license.
    - Fireworks are placed in your offhand (when empty) during flight _only_.
  - Name colour (permanent unlock per colour).
  - Shulker shell.
  - Villager egg.
  - Warp ball.
- `/trigger tpa set <ID>` - TPAsk: request to teleport to other players (player IDs typically displayed in TAB).
- Warp ball functionality.
  - `/trigger warpList` - List existing Warps. Shows their IDs, Coordinates (if enabled), and whether they have a password or not.
  - `/trigger warp set <ID>` - Travel to a Warp. Will require password entry if the Warp has one enabled.
  - Throw a Warp ball to activate it (only allowed in the Overworld).
  - Crouch near an activated Warp ball to configure it. You are only allowed to configure Warp balls you have activated.
    - A Warp's coordinates may be hidden from the Warp list.
    - A Password may be added to a Warp. If added, it must be entered to travel to the Warp.
    - The Warp ball may be turned back into an item.
- `/trigger setspawn` - Set your own spawnpoint.
- `/trigger suicide` - Travel to your own spawnpoint.
- `/trigger spawn` - Travel to the world spawnpoint.


### 2019jun
- `/trigger colour` - Adjust name colour.
- XP is awarded to all players when a major boss (Wither, Ender dragon) is defeated.
- A chime plays when a player joins the game.
- A toast plays when a player joins the server for the first time.
- One-player sleep. Skips to daytime if one player sleeps for 5 seconds.
- A shop with various items. The currency to spend is 'mins', earned from minutes of playtime.
  - `/trigger purch.elytra` - Purchase a permanent elytra.
    - A player is unable to equip an elytra that came from a purchase unless they have purchased one before.
    - Fireworks are placed in your offhand (when empty) during flight _only_.
  - `/trigger purch.shulker` - Purchase a shulker box of chosen colour.
  - `/trigger purch.villager` - Purchase a villager spawn egg.
- `/trigger spawnwarp` - Travel to the world spawnpoint.
- `/trigger spawnpoint.set` - Set your own spawnpoint.
- `/trigger spawnpoint.trav` - Travel to your own spawnpoint.


## Boilerplate
The MCFunctions contain a lot of boilerplate, some of it unnecessary, caused by the restricted programming environment and 2019 me being an amateur.

Some detail about this:

You'll find many blocks of commands structured with conditions that are shared or slightly different, which prompt slightly different actions.<br>
Shared condition checks are refactorable. Repetition can be reduced by hoisting a condition shared by many different commands into one command, and dispatching to another `.mcfunction` file when it is met.<br>
This is the only way to simulate scope - each line is simply a command so there are no structured scope braces/blocks within files.

After hoisting, if multiple conditions are shared in the new MCFunction, they can just have more nested dispatches to more and more MCFunctions, and so on... But, this is exponential in the number of files. Albeit, you'd need an unrealistic number of shared/nested conditions for this to be too problematic.

The required number of commands could end up being the same, though.
For example, the block in `2019dec/data/shop/function/elytra.mcfunction` could have the `tag=elytraFirework` hoisted into a single check. But, the `Count:XXb` checks (to be placed in in another file) are already unique to each command, which require the same number of commands as before.
The number of condition checks would still be reduced, though (by 63)!<br>

All of that being said, it can be reasonable to just have duplicate conditions because they work and are compact to deal with.<br>
This would be even more fine if you didn't run every command every tick... Every half-second or so would be appropriate, bar all the tick-driven animations.

### Remarks

Some of the animations are over-the-top and take ages because they look cool (...no regrets). I've since come to appreciate snappier experiences - you'll get bored sooner or later when something is unnecessarily dragged out.

I'll consider rewriting Warp balls as a Spigot plugin one day.<br><br><br><br>
(...one day Not Soon.)
