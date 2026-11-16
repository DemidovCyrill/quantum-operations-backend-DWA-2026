"""
Хранение сессий в Redis через Lua-скрипт (Лабораторная 4).
"""

import json
import uuid
from pathlib import Path
from typing import Optional

import redis

from core.config import settings

SESSION_TTL = 86400  # 24 часа

session_storage = redis.StrictRedis(
    host=settings.REDIS_HOST,
    port=settings.REDIS_PORT,
    db=0,
    decode_responses=True,
)

LUA_PATH = Path(__file__).resolve().parent.parent / "lua" / "session_lua.lua"
SESSION_SCRIPT = session_storage.register_script(LUA_PATH.read_text(encoding="utf-8"))


def _run(operation: str, session_id: str, payload: str = "", ttl: int = SESSION_TTL):
    return SESSION_SCRIPT(
        keys=[f"session:{session_id}"],
        args=[payload, ttl, operation],
    )


def create_session(user_id: int, username: str, email: str) -> str:
    """Создаёт новую сессию в Redis и возвращает session_id для cookie."""
    session_id = str(uuid.uuid4())
    session_data = {
        "user_id": user_id,
        "username": username,
        "email": email,
    }
    _run("create", session_id, json.dumps(session_data, ensure_ascii=False), SESSION_TTL)
    return session_id


def get_session(session_id: str) -> Optional[dict]:
    """Возвращает данные сессии или None, если сессия истекла/удалена."""
    data = _run("get", session_id)
    if data:
        return json.loads(data)
    return None


def delete_session(session_id: str) -> bool:
    """Удаляет сессию из Redis."""
    result = _run("delete", session_id)
    return int(result) > 0


def session_exists(session_id: str) -> bool:
    return int(_run("exists", session_id)) > 0
