-- ============================================================
-- Lua-скрипт управления сессиями в Redis (Лабораторная 4, ЛР-6)
-- Один скрипт выполняет все операции атомарно на стороне Redis.
--
-- KEYS[1] — ключ сессии session:{session_id}
-- ARGV[1] — JSON с данными пользователя
-- ARGV[2] — TTL в секундах (24 часа = 86400)
-- ARGV[3] — операция: create | get | delete | exists
-- ============================================================

local operation = ARGV[3]

if operation == 'create' then
    redis.call('SET', KEYS[1], ARGV[1], 'EX', ARGV[2])
    return 1
end

if operation == 'get' then
    local value = redis.call('GET', KEYS[1])
    if value then
        -- продлеваем жизнь активной сессии
        redis.call('EXPIRE', KEYS[1], ARGV[2])
    end
    return value
end

if operation == 'delete' then
    return redis.call('DEL', KEYS[1])
end

if operation == 'exists' then
    return redis.call('EXISTS', KEYS[1])
end

return redis.error_reply('unknown session operation: ' .. tostring(operation))
