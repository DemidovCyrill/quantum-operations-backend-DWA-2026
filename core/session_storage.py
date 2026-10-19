"""
Хранение сессий в Redis.
"""

import uuid
import json
from typing import Optional

import redis

from core.config import settings

# Подключение к Redis
session_storage = redis.StrictRedis(
    host=settings.REDIS_HOST,
    port=settings.REDIS_PORT,
    db=0,
    decode_responses=True
)


def create_session(user_id: int, username: str, email: str) -> str:
    """
    Создаёт новую сессию в Redis.
    Возвращает session_id (ключ для cookie).
    """
    session_id = str(uuid.uuid4())
    session_data = {
        "user_id": user_id,
        "username": username,
        "email": email
    }
    # Сохраняем сессию с TTL 24 часа
    session_storage.setex(
        f"session:{session_id}",
        86400,  # 24 часа
        json.dumps(session_data)
    )
    return session_id


def get_session(session_id: str) -> Optional[dict]:
    """
    Получает данные сессии по session_id.
    Возвращает None, если сессия не найдена или истекла.
    """
    data = session_storage.get(f"session:{session_id}")
    if data:
        return json.loads(data)
    return None


def delete_session(session_id: str) -> bool:
    """
    Удаляет сессию из Redis.
    Возвращает True, если сессия была удалена.
    """
    result = session_storage.delete(f"session:{session_id}")
    return result > 0
