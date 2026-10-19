"""
Проверка авторизации через cookie session_id.
"""

from typing import Optional

from fastapi import Request, HTTPException, Depends
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from core.session_storage import get_session
from db.session import get_db
from models.user import User


async def get_current_user_optional(
    request: Request,
    db: AsyncSession = Depends(get_db),
) -> Optional[User]:
    """
    Получает текущего пользователя из cookie session_id.
    Возвращает None, если пользователь не авторизован.
    """
    session_id = request.cookies.get("session_id")
    if not session_id:
        return None

    session_data = get_session(session_id)
    if not session_data:
        return None

    stmt = select(User).where(User.id == session_data["user_id"])
    result = await db.execute(stmt)
    return result.scalar_one_or_none()


async def get_current_user_required(
    request: Request,
    db: AsyncSession = Depends(get_db),
) -> User:
    """
    Получает текущего пользователя из cookie session_id.
    Выбрасывает 401, если пользователь не авторизован.
    """
    session_id = request.cookies.get("session_id")
    if not session_id:
        raise HTTPException(status_code=401, detail="Authentication required")

    session_data = get_session(session_id)
    if not session_data:
        raise HTTPException(status_code=401, detail="Session expired")

    stmt = select(User).where(User.id == session_data["user_id"])
    result = await db.execute(stmt)
    user = result.scalar_one_or_none()

    if not user:
        raise HTTPException(status_code=401, detail="User not found")

    return user
