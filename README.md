# esx_cooldown
- Simple cooldown system for FiveM using ESX and oxmysql

## Requirements
- [ES Extended](https://github.com/esx-framework/esx_core/tree/main/%5Bcore%5D/es_extended)
- [Oxmysql](https://github.com/overextended/oxmysql)

## Installation
- Put the resource in your `resources` folder.
- Import `sql.sql` in your database.
- I recommend to start this resource in your `server.cfg` before the ones that will use the cooldowns.
- [Setup your scripts](#Usage), and you are ready to go.

## Usage

### CreateCooldown
Creates a 15 minute cooldown for the "shop_robbery" event
```lua
exports['esx_cooldown']:createCooldown('shop_robbery', 15)
```

Check the cooldown of the "shop_robbery" event
```lua
exports['esx_cooldown']:checkCooldown('shop_robbery', function(cooldown_time)
    if cooldown_time and cooldown_time > 0 then
        --Notify player that is on cooldown
    else
        exports['esx_cooldown']:createCooldown('shop_robbery', 15)
        -- Do your robbery
    end
end)
```
