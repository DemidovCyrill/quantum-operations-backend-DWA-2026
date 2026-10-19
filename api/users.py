"""
REST API для работы с пользователями.
Все методы начинаются с /api/users.
"""

from fastapi import APIRouter, Depends, HTTPException, Response
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from db.session import get_db
from models.user import User
from schemas.user import UserCreate, UserLogin, UserResponse, AuthResponse
from core.session_storage import create_session, delete_session

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
    new_user = User(
        username=user_data.username,
        email=user_data.email,
        password=user_data.password
    )
    db.add(new_user)
    await db.commit()
    await db.refresh(new_user)

    return UserResponse(
        id=new_user.id,
        username=new_user.username,
        email=new_user.email
    )


@router.post("/api/users/login")
async def login_user(
    credentials: UserLogin,
    db: AsyncSession = Depends(get_db),
    response: Response = None,
):
    """
    POST /api/users/login — аутентификация пользователя.
    Создаёт сессию в Redis и устанавливает cookie session_id.
    """
    # Проверяем пользователя
    stmt = select(User).where(User.username == credentials.username)
    result = await db.execute(stmt)
    user = result.scalar_one_or_none()

    if not user or user.password != credentials.password:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    # Создаём сессию в Redis
    session_id = create_session(
        user_id=user.id,
        username=user.username,
        email=user.email
    )

    # Устанавливаем cookie
    response = Response(content="")
    response.set_cookie(
        key="session_id",
        value=session_id,
        httponly=True,
        max_age=86400
    )
    response.status_code = 200
    response.body = b'{"success": true, "message": "Login successful"}'
    response.headers["content-type"] = "application/json"
    return response


@router.post("/api/users/logout")
async def logout_user(
    session_id: str = None,
    response: Response = None,
):
    """
    POST /api/users/logout — деавторизация пользователя.
    Удаляет сессию из Redis и очищает cookie.
    """
    if session_id:
        delete_session(session_id)

    response = Response(content="")
    response.status_code = 200
    response.body = b'{"success": true, "message": "Logout successful"}'
    response.headers["content-type"] = "application/json"
    response.delete_cookie(key="session_id")
    return response
