"""
REST API для работы с пользователями.
Все методы начинаются с /api/users.
"""

from fastapi import APIRouter, Depends, HTTPException, Request, Response
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from core.auth import get_current_user_required
from core.session_storage import create_session, delete_session
from db.session import get_db
from models.user import User
from schemas.user import UserCreate, UserLogin, UserResponse

router = APIRouter()

SESSION_COOKIE = "session_id"
SESSION_TTL = 86400  # 24 часа


@router.post(
    "/api/users/register",
    response_model=UserResponse,
    status_code=201,
    summary="Регистрация",
    description="Регистрация нового пользователя",
    tags=["Пользователи"],
)
async def register_user(
    user_data: UserCreate,
    db: AsyncSession = Depends(get_db),
):
    """POST /api/users/register — регистрация нового пользователя."""
    stmt = select(User).where(
        (User.username == user_data.username) | (User.email == user_data.email)
    )
    result = await db.execute(stmt)
    existing_user = result.scalar_one_or_none()

    if existing_user:
        raise HTTPException(status_code=400, detail="Username or email already exists")

    new_user = User(
        username=user_data.username,
        email=user_data.email,
        password=user_data.password,
    )
    db.add(new_user)
    await db.commit()
    await db.refresh(new_user)

    return UserResponse(id=new_user.id, username=new_user.username, email=new_user.email)


@router.post(
    "/api/users/login",
    summary="Аутентификация",
    description="Аутентификация пользователя. Создаёт сессию в Redis и устанавливает cookie session_id.",
    tags=["Пользователи"],
)
async def login_user(
    credentials: UserLogin,
    response: Response,
    db: AsyncSession = Depends(get_db),
):
    """POST /api/users/login — вход и создание сессии."""
    stmt = select(User).where(User.username == credentials.username)
    result = await db.execute(stmt)
    user = result.scalar_one_or_none()

    if not user or user.password != credentials.password:
        raise HTTPException(status_code=401, detail="Invalid username or password")

    session_id = create_session(
        user_id=user.id,
        username=user.username,
        email=user.email,
    )

    response.set_cookie(
        key=SESSION_COOKIE,
        value=session_id,
        httponly=True,
        samesite="lax",
        max_age=SESSION_TTL,
        path="/",
    )

    return {
        "status": "success",
        "data": {
            "id": user.id,
            "username": user.username,
            "email": user.email,
        },
    }


@router.post(
    "/api/users/logout",
    summary="Деавторизация",
    description="Деавторизация пользователя. Удаляет сессию из Redis и очищает cookie.",
    tags=["Пользователи"],
)
async def logout_user(request: Request, response: Response):
    """POST /api/users/logout — выход и удаление сессии из Redis."""
    session_id = request.cookies.get(SESSION_COOKIE)
    if session_id:
        delete_session(session_id)

    response.delete_cookie(key=SESSION_COOKIE, path="/")
    return {"status": "success", "data": {"logged_out": True}}


@router.get(
    "/api/users/me",
    response_model=UserResponse,
    summary="Текущий пользователь",
    description="Данные пользователя по cookie-сессии",
    tags=["Пользователи"],
)
async def me(current_user: User = Depends(get_current_user_required)):
    """GET /api/users/me — проверка активной сессии."""
    return UserResponse(id=current_user.id, username=current_user.username, email=current_user.email)
