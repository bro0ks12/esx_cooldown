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
- `exports['esx_cooldown']:createCooldown('shop_robbery', 15)`

Verificar o cooldown do evento "shop_robbery"
- `exports['hrc_cooldown']:checkCooldown('shop_robbery', function(cooldown_time)
    if cooldown_time and cooldown_time > 0 then
        xPlayer.showNotification('Assalto', "A loja não pode ser assaltada agora", 'error')
    else
        exports['hrc_cooldown']:createCooldown('shop_robbery', 30)
        -- Do your robbery
    end
end)`
