-- ============================================================
-- Lua скрипт для управления сессиями в Redis (Лабораторная 4)
-- Создает сессию с ключом session:{session_id} и значением 
-- в формате JSON: {"user_id": 1, "username": "admin"}
-- TTL 86400 секунд (24 часа)
-- ============================================================

-- Пример 1: Создание сессии (SET с истечением времени)
-- KEYS[1] = session:{session_id}
-- ARGV[1] = JSON строка с данными пользователя
-- ARGV[2] = TTL в секундах

-- redis.call("SET", KEYS[1], ARGV[1], "EX", ARGV[2])
-- redis.call("EXPIRE", KEYS[1], ARGV[2])

-- Пример 2: Получение сессии
-- KEYS[1] = session:{session_id}
-- return redis.call("GET", KEYS[1])

-- Пример 3: Удаление сессии (logout)
-- KEYS[1] = session:{session_id}
-- return redis.call("DEL", KEYS[1])

-- Пример 4: Проверка существования сессии
-- KEYS[1] = session:{session_id}
-- return redis.call("EXISTS", KEYS[1])

-- Пример 5: Получение всех сессий (pattern)
-- return redis.call("KEYS", "session:*")

-- Пример 6: Сложная операция с HMSET и hgetall (пример из методички)
-- EVAL "local key_name = 'example_key'; for iterated_value=0,4 do redis.call('hmset', KEYS[1], key_name .. tostring(iterated_value), iterated_value) end; return redis.call('hgetall', KEYS[1])" 1 example_hash

-- ============================================================
-- Использование в приложении (Python + redis-py):
--
-- import redis
-- r = redis.Redis(host='127.0.0.1', port=6379, decode_responses=True)
--
-- # Создать сессию
-- session_id = "abc123"
-- user_data = '{"user_id": 1, "username": "admin"}'
-- r.eval("redis.call('SET', KEYS[1], ARGV[1], 'EX', ARGV[2])", 1, 
--        f"session:{session_id}", user_data, 86400)
--
-- # Получить сессию
-- data = r.eval("return redis.call('GET', KEYS[1])", 1, f"session:{session_id}")
--
-- # Удалить сессию
-- r.eval("return redis.call('DEL', KEYS[1])", 1, f"session:{session_id}")
-- ============================================================
