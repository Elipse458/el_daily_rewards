# el_daily_rewards
Daily rewards for FiveM  
Reward your players for playing on your server

## Installation
1. Download the [resource](https://github.com/Elipse458/el_daily_rewards/archive/master.zip)
2. Rename it to `el_daily_rewards` and put it into your resources folder
3. Import sql.sql into your database
4. Edit the config to your liking
5. Add `start el_daily_rewards` into your server.cfg **Make sure to add this after mysql-async and es_extended**
6. Start it and you're good to go

## Documentation
Commands:
- /daily <- opens daily rewards menu

## Errors? Read this first before complaining
If you're getting something like this:
```
SCRIPT ERROR: @es_extended/server/classes/player.lua:320: attempt to index a nil value (local 'item')
> ref (@es_extended/server/classes/player.lua:320)
> giveItem (@el_daily_rewards/server.lua:57)
> claimRewards (@el_daily_rewards/server.lua:71)
> ref (@el_daily_rewards/server.lua:103)
> setImmediate (@mysql-async/mysql-async.js:14898)
```
that means that one or more items in your config don't exist in your database

## Important notes
This also silently stores how many times a player has redeemed their reward, i thought it could be useful. *(only in database)*  
If you rename the folder to something else than `el_daily_rewards`, **it will break things**.  
To rename it successfully you'll have to do some additional stuff as well. First of all, make sure the new name is in lowercase.  
To do this, open `html/script.js` and replace every occurence of `el_daily_rewards` with your new folder name, it should only be these lines
```
37 -> $.post('http://el_daily_rewards/collect', JSON.stringify({ "t": new Date().getTime() }));
42 -> $.post('http://el_daily_rewards/hidemenu', JSON.stringify({}));
```
After replacing it should look like this
```
37 -> $.post('http://<YOUR FOLDER NAME>/collect', JSON.stringify({ "t": new Date().getTime() }));
42 -> $.post('http://<YOUR FOLDER NAME>/hidemenu', JSON.stringify({}));
```

If find any bugs, please join my [discord server](https://discord.gg/GbT49uH) and report it in the #bug-reports channel  
If you like my work, please check out [my page](https://elipse458.me), i'll probably release a few more things if i have the time and feel like it
