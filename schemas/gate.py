"""
Схемы Pydantic для сериализации данных гейтов.
"""

from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field


class GateBase(BaseModel):
    """Базовая схема гейта."""
    title: str = Field(..., max_length=128)
    summary: Optional[str] = Field(None, max_length=512)
    angle_x: int = Field(0, ge=0, le=180)
    angle_y: int = Field(0, ge=0, le=180)


class GateCreate(BaseModel):
    """Схема для создания гейта."""
    title: str = Field(..., max_length=128)


class GateUpdate(BaseModel):
    """Схема для обновления гейта."""
    summary: Optional[str] = Field(None, max_length=512)
    angle_x: Optional[int] = Field(None, ge=0, le=180)
    angle_y: Optional[int] = Field(None, ge=0, le=180)


class GatePublish(BaseModel):
    """Схема для публикации гейта."""
    summary: str = Field(..., max_length=512)
    angle_x: int = Field(0, ge=0, le=180)
    angle_y: int = Field(0, ge=0, le=180)


class AttributeValue(BaseModel):
    """Наименование и значение атрибута услуги."""
    id: int
    name: str
    value: str = ""


class AttributeInput(BaseModel):
    """Входная пара «название — значение» для сохранения атрибутов."""
    name: str = Field(..., min_length=1, max_length=128)
    value: str = Field("", max_length=255)


class GateAttributesUpdate(BaseModel):
    """Полный набор атрибутов услуги (m-m)."""
    attributes: list[AttributeInput] = Field(default_factory=list)


class AttributeResponse(BaseModel):
    """Элемент справочника атрибутов."""
    id: int
    name: str

    class Config:
        from_attributes = True


class GateResponse(BaseModel):
    """Схема для ответа с данными гейта."""
    id: int
    title: str
    summary: Optional[str] = None
    status: str
    image_url: str
    video_url: str
    angle_x: int
    angle_y: int
    creator_id: int
    creator_name: str = ""
    is_creator: bool = False  # True, если создатель услуги совпадает с текущим пользователем
    likes_count: int = 0
    is_liked: bool = False
    attributes: list[AttributeValue] = Field(default_factory=list)
    created_at: Optional[datetime] = None
    formed_at: Optional[datetime] = None

    class Config:
        from_attributes = True


class GateListResponse(BaseModel):
    """Схема для ответа со списком гейтов."""
    items: list[GateResponse]
    total: int


class LikeRequest(BaseModel):
    """Схема для запроса лайка."""
    value: int = Field(..., ge=0, le=1)  # 0 — отменить лайк, 1 — поставить лайк


class LikeResponse(BaseModel):
    """Схема для ответа после лайка."""
    gate_id: int
    likes_count: int
    is_liked: bool
