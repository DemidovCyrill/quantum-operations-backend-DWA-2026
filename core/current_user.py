"""
Функция-singleton для получения текущего пользователя.
В лабораторной 3 пользователь зафиксирован как константа.
"""

from functools import lru_cache


@lru_cache(maxsize=1)
def get_current_user() -> dict:
    """
    Возвращает текущего пользователя (singleton).
    В лабораторной 3 пользователь зафиксирован как константа.
    """
    return {
        "id": 1,
        "username": "admin",
        "email": "admin@example.com"
    }


def get_current_user_id() -> int:
    """Возвращает ID текущего пользователя."""
    return get_current_user()["id"]
