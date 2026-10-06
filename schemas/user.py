"""
Схемы Pydantic для сериализации данных пользователей.
"""

from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field, EmailStr


class UserBase(BaseModel):
    """Базовая схема пользователя."""
    username: str = Field(..., max_length=64)
    email: str = Field(..., max_length=128)


class UserCreate(UserBase):
    """Схема для регистрации пользователя."""
    password: str = Field(..., min_length=6)


class UserLogin(BaseModel):
    """Схема для аутентификации пользователя."""
    username: str
    password: str


class UserResponse(BaseModel):
    """Схема для ответа с данными пользователя."""
    id: int
    username: str
    email: str
    created_at: datetime

    class Config:
        from_attributes = True


class AuthResponse(BaseModel):
    """Схема для ответа после аутентификации."""
    success: bool
    message: str
    user: Optional[UserResponse] = None
