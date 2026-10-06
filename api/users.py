"""
REST API для работы с пользователями.
Все методы начинаются с /api/users.
"""

from datetime import datetime

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from db.session import get_db
from models.user import User
from schemas.user import UserCreate, UserLogin, UserResponse, AuthResponse

router = APIRouter()


@router.post("/api/users/register", response_model=UserResponse, status_code=201)
async def register_user(
    user_data: UserCreate,
    db: AsyncSession = Depends(get_db),
):
    """
    POST /api/users/register — регистрация нового пользователя.
    """
    # Проверяем, существует ли пользователь с таким именем или email
    stmt = select(User).where(
        (User.username == user_data.username) | (User.email == user_data.email)
    )
    result = await db.execute(stmt)
    existing_user = result.scalar_one_or_none()

    if existing_user:
        raise HTTPException(status_code=400, detail="Username or email already exists")

    # Создаём нового пользователя
    # В реальном приложении пароль нужно хешировать
    new_user = User(
        username=user_data.username,
        email=user_data.email,
        created_at=datetime.utcnow()
    )
    db.add(new_user)
    await db.commit()
    await db.refresh(new_user)

    return UserResponse(
        id=new_user.id,
        username=new_user.username,
        email=new_user.email,
        created_at=new_user.created_at
    )


@router.post("/api/users/login", response_model=AuthResponse)
async def login_user(
    credentials: UserLogin,
    db: AsyncSession = Depends(get_db),
):
    """
    POST /api/users/login — аутентификация пользователя (заглушка для 4-й лабораторной).
    """
    # Проверяем, существует ли пользователь
    stmt = select(User).where(User.username == credentials.username)
    result = await db.execute(stmt)
    user = result.scalar_one_or_none()

    if not user:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    # Заглушка: в 4-й лабораторной будет реальная аутентификация
    return AuthResponse(
        success=True,
        message="Login successful (stub for lab 4)",
        user=UserResponse(
            id=user.id,
            username=user.username,
            email=user.email,
            created_at=user.created_at
        )
    )


@router.post("/api/users/logout", response_model=AuthResponse)
async def logout_user():
    """
    POST /api/users/logout — деавторизация пользователя (заглушка для 4-й лабораторной).
    """
    # Заглушка: в 4-й лабораторной будет реальная деавторизация
    return AuthResponse(
        success=True,
        message="Logout successful (stub for lab 4)",
        user=None
    )
