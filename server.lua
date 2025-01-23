-- Export para criar ou atualizar um cooldown
exports('createCooldown', function(id, cooldown_time)
    -- Insere ou atualiza o cooldown para evitar duplicatas
    exports.oxmysql:execute('INSERT INTO cooldowns (id, cooldown_time) VALUES (?, ?) ON DUPLICATE KEY UPDATE cooldown_time = ?', {
        id, cooldown_time, cooldown_time
    })
end)

-- Export para verificar se existe um cooldown
exports('checkCooldown', function(id, callback)
    -- Busca o cooldown_time do ID fornecido
    exports.oxmysql:scalar('SELECT cooldown_time FROM cooldowns WHERE id = ?', { id }, function(result)
        if result then
            callback(tonumber(result)) -- Retorna o tempo de cooldown em minutos
        else
            callback(nil) -- Retorna nil se não houver cooldown
        end
    end)
end)

-- Função para decrementar o cooldown a cada minuto
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000) -- 1 minuto

        -- Atualiza todos os cooldowns na tabela
        exports.oxmysql:execute('UPDATE cooldowns SET cooldown_time = GREATEST(0, cooldown_time - 1)', {})

        -- Log para depuração
        --print("Cooldowns atualizados!")
    end
end)
