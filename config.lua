local type = {money=1,item=2,weapon=3} -- no touchey, thank you
Config = {}

Config.claimed = "~g~You claimed your daily reward"
Config.rewards = {
    {
        type = type.money,
        value = 1000
    },
    {
        type = type.item,
        item = "test",
        count = 3
    },
    {
        type = type.item,
        item = "test2",
        count = 5
    },
    {
        type = type.weapon,
        weapon = "WEAPON_PISTOL", -- if they already have the weapon, they'll only get the ammo
        ammo = 10
    }
}

Config.random_rewards_enabled = false
Config.random_rewards = {
    {
        {
            type = type.money,
            value = 1000
        },
        {
            type = type.money,
            value = 2500
        },
        {
            type = type.money,
            value = 5000
        }
    },
    {
        {
            type = type.item,
            item = "test",
            count = 5
        },
        {
            type = type.weapon,
            weapon = "WEAPON_PISTOL", -- if they already have the weapon, they'll only get the ammo
            ammo = 100
        }
    }
}