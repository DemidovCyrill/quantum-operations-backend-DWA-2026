"""
REST API для работы с гейтами.
Все методы начинаются с /api/gates.
"""

import uuid
from datetime import datetime
from pathlib import Path
from typing import Optional

from fastapi import APIRouter, Depends, File, Form, HTTPException, Query, UploadFile
from sqlalchemy.ext.asyncio import AsyncSession

from core.auth import get_current_user_optional, get_current_user_required
from core.config import settings
from core.minio_client import upload_file_from_bytes
from db.session import get_db
from models.gate import Gate
from models.user import User
from repositories import gate_repo, raw_sql
from schemas.gate import (
    AttributeResponse,
    AttributeValue,
    GateAttributesUpdate,
    GateListResponse,
    GateResponse,
    LikeResponse,
)

router = APIRouter()

UPLOAD_DIR = Path("static/uploads")
UPLOAD_DIR.mkdir(parents=True, exist_ok=True)

DEFAULT_IMAGE = "img/pauli_x.png"
DEFAULT_VIDEO = "img/video.mp4"


def _attributes(gate: Gate) -> list[AttributeValue]:
    return [
        AttributeValue(
            id=item.attribute.id,
            name=item.attribute.name,
            value=item.value or "",
        )
        for item in gate.attribute_values
        if item.attribute
    ]


def _serialize(
    gate: Gate,
    current_user_id: int | None,
    likes_count: int = 0,
    is_liked: bool = False,
) -> GateResponse:
    return GateResponse(
        id=gate.id,
        title=gate.title,
        summary=gate.summary,
        status=gate.status,
        image_url=gate.image_url,
        video_url=gate.video_url,
        angle_x=gate.angle_x,
        angle_y=gate.angle_y,
        creator_id=gate.creator_id,
        creator_name=gate.creator.username if gate.creator else "",
        is_creator=bool(current_user_id) and gate.creator_id == current_user_id,
        likes_count=likes_count,
        is_liked=is_liked,
        attributes=_attributes(gate),
        created_at=gate.created_at,
        formed_at=gate.formed_at,
    )


async def _save_upload(upload: Optional[UploadFile], default: str) -> str:
    """Сохраняет файл в MinIO или локально (по умолчанию — локально)."""
    if not upload or not upload.filename:
        return default

    ext = Path(upload.filename).suffix.lower()
    filename = f"{uuid.uuid4().hex}{ext}"
    data = await upload.read()

    if settings.USE_MINIO:
        url = upload_file_from_bytes(data, filename)
        return url or default

    path = UPLOAD_DIR / filename
    path.write_bytes(data)
    return f"uploads/{filename}"


@router.get(
    "/api/gates",
    response_model=GateListResponse,
    summary="Список гейтов",
    description="Получить список опубликованных гейтов с фильтрацией",
    tags=["Гейты"],
)
async def list_gates(
    q: str = Query("", max_length=100, description="Поиск по названию"),
    angle_x_min: int = Query(0, ge=0, le=180),
    angle_x_max: int = Query(180, ge=0, le=180),
    angle_y_min: int = Query(0, ge=0, le=180),
    angle_y_max: int = Query(180, ge=0, le=180),
    sort_by: str = Query("id", pattern="^(id|title|created_at)$"),
    sort_order: str = Query("asc", pattern="^(asc|desc)$"),
    limit: int = Query(50, ge=1, le=100),
    offset: int = Query(0, ge=0),
    db: AsyncSession = Depends(get_db),
    current_user: Optional[User] = Depends(get_current_user_optional),
):
    """GET /api/gates — список опубликованных гейтов с фильтрацией."""
    if angle_x_min > angle_x_max:
        raise HTTPException(status_code=400, detail="angle_x_min must be <= angle_x_max")
    if angle_y_min > angle_y_max:
        raise HTTPException(status_code=400, detail="angle_y_min must be <= angle_y_max")

    items = await gate_repo.list_published(
        db, q, angle_x_min, angle_x_max, angle_y_min, angle_y_max
    )

    if sort_by == "id":
        items.sort(key=lambda x: x.id, reverse=(sort_order == "desc"))
    elif sort_by == "title":
        items.sort(key=lambda x: x.title.lower(), reverse=(sort_order == "desc"))
    elif sort_by == "created_at":
        items.sort(key=lambda x: x.created_at or datetime.min, reverse=(sort_order == "desc"))

    total = len(items)
    items = items[offset:offset + limit]

    ids = [gate.id for gate in items]
    counts = await gate_repo.likes_counts(db, ids)
    liked = await gate_repo.liked_gate_ids(db, current_user.id, ids) if current_user else set()
    user_id = current_user.id if current_user else None

    return GateListResponse(
        items=[_serialize(gate, user_id, counts.get(gate.id, 0), gate.id in liked) for gate in items],
        total=total,
    )


@router.get(
    "/api/gates/feed",
    summary="Лента гейтов",
    description="Получить ленту опубликованных гейтов",
    tags=["Гейты"],
)
async def feed_gates(
    db: AsyncSession = Depends(get_db),
    current_user: Optional[User] = Depends(get_current_user_optional),
):
    """GET /api/gates/feed — лента опубликованных гейтов с признаком is_creator (0/1)."""
    items = await gate_repo.list_published(db)
    ids = [gate.id for gate in items]
    counts = await gate_repo.likes_counts(db, ids)
    liked = await gate_repo.liked_gate_ids(db, current_user.id, ids) if current_user else set()
    user_id = current_user.id if current_user else None

    return GateListResponse(
        items=[_serialize(gate, user_id, counts.get(gate.id, 0), gate.id in liked) for gate in items],
        total=len(items),
    )


@router.get(
    "/api/gates/draft",
    summary="Черновик гейта",
    description="Получить черновик текущего пользователя",
    tags=["Гейты"],
)
async def get_draft(
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user_required),
):
    """GET /api/gates/draft — получение черновика текущего пользователя."""
    draft = await gate_repo.get_draft_for_user(db, current_user.id)
    if not draft:
        raise HTTPException(status_code=404, detail="Draft not found")

    counts = await gate_repo.likes_counts(db, [draft.id])
    liked = await gate_repo.liked_gate_ids(db, current_user.id, [draft.id])
    return _serialize(draft, current_user.id, counts.get(draft.id, 0), draft.id in liked)


@router.get(
    "/api/gates/{gate_id}",
    response_model=GateResponse,
    summary="Карточка гейта",
    description="Получить полную карточку услуги вместе со списком атрибутов",
    tags=["Гейты"],
)
async def get_gate(
    gate_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: Optional[User] = Depends(get_current_user_optional),
):
    """GET /api/gates/{id} — карточка услуги и её характеристики."""
    gate = await gate_repo.get_any(db, gate_id)
    if not gate or gate.status == "deleted":
        raise HTTPException(status_code=404, detail="Gate not found")

    user_id = current_user.id if current_user else None
    if gate.status == "draft" and gate.creator_id != user_id:
        raise HTTPException(status_code=404, detail="Gate not found")

    counts = await gate_repo.likes_counts(db, [gate.id])
    liked = await gate_repo.liked_gate_ids(db, user_id, [gate.id]) if user_id else set()
    return _serialize(gate, user_id, counts.get(gate.id, 0), gate.id in liked)


@router.post(
    "/api/gates",
    status_code=201,
    response_model=GateResponse,
    summary="Создание гейта",
    description="Создать черновик гейта (multipart: title, image, video)",
    tags=["Гейты"],
)
async def create_gate(
    title: str = Form(..., max_length=128),
    image: Optional[UploadFile] = File(None),
    video: Optional[UploadFile] = File(None),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user_required),
):
    """POST /api/gates — создание черновика (или обновление существующего)."""
    image_url = await _save_upload(image, DEFAULT_IMAGE)
    video_url = await _save_upload(video, DEFAULT_VIDEO)

    existing = await gate_repo.get_draft_for_user(db, current_user.id)
    if existing:
        gate = await gate_repo.update_draft(
            db,
            existing,
            title,
            image_url if image and image.filename else None,
            video_url if video and video.filename else None,
        )
    else:
        gate = await gate_repo.create_draft(db, current_user.id, title, image_url, video_url)

    gate = await gate_repo.get_any(db, gate.id)
    return _serialize(gate, current_user.id)


@router.put(
    "/api/gates/{gate_id}/publish",
    response_model=GateResponse,
    summary="Публикация гейта",
    description="Опубликовать черновик гейта (multipart: summary, angle_x, angle_y)",
    tags=["Гейты"],
)
async def publish_gate(
    gate_id: int,
    summary: str = Form(..., max_length=512),
    angle_x: int = Form(0, ge=0, le=180),
    angle_y: int = Form(0, ge=0, le=180),
    image: Optional[UploadFile] = File(None),
    video: Optional[UploadFile] = File(None),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user_required),
):
    """PUT /api/gates/{id}/publish — заполнение и публикация своего черновика."""
    draft = await gate_repo.get_draft_for_user(db, current_user.id)
    if not draft or draft.id != gate_id:
        raise HTTPException(status_code=404, detail="Draft not found or not yours")

    image_url = await _save_upload(image, "") if image and image.filename else None
    video_url = await _save_upload(video, "") if video and video.filename else None

    published = await gate_repo.publish_draft(
        db, gate_id, summary, angle_x, angle_y, image_url, video_url
    )
    if not published:
        raise HTTPException(status_code=404, detail="Draft not found")

    gate = await gate_repo.get_any(db, gate_id)
    return _serialize(gate, current_user.id)


@router.put(
    "/api/gates/{gate_id}/attributes",
    response_model=GateResponse,
    summary="Атрибуты услуги",
    description="Полностью заменить набор характеристик услуги (m-m)",
    tags=["Атрибуты"],
)
async def update_gate_attributes(
    gate_id: int,
    payload: GateAttributesUpdate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user_required),
):
    """PUT /api/gates/{id}/attributes — сохранение списка «название — значение»."""
    gate = await gate_repo.get_any(db, gate_id)
    if not gate or gate.status == "deleted":
        raise HTTPException(status_code=404, detail="Gate not found")
    if gate.creator_id != current_user.id:
        raise HTTPException(status_code=403, detail="You can only edit your own gates")

    await gate_repo.set_gate_attributes(db, gate_id, payload.attributes)
    gate = await gate_repo.get_any(db, gate_id)
    counts = await gate_repo.likes_counts(db, [gate.id])
    liked = await gate_repo.liked_gate_ids(db, current_user.id, [gate.id])
    return _serialize(gate, current_user.id, counts.get(gate.id, 0), gate.id in liked)


@router.delete(
    "/api/gates/{gate_id}",
    summary="Удаление гейта",
    description="Удалить гейт (soft delete)",
    tags=["Гейты"],
)
async def delete_gate(
    gate_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user_required),
):
    """DELETE /api/gates/{id} — логическое удаление своего гейта."""
    gate = await gate_repo.get_published(db, gate_id)
    if not gate:
        raise HTTPException(status_code=404, detail="Gate not found")
    if gate.creator_id != current_user.id:
        raise HTTPException(status_code=403, detail="You can only delete your own gates")

    ok = await raw_sql.soft_delete_gate(db, gate_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Gate not found or not published")

    return {"status": "success", "data": {"deleted": True}}


@router.post(
    "/api/gates/{gate_id}/likes",
    response_model=LikeResponse,
    summary="Лайк гейта",
    description="Поставить или отменить лайк гейту",
    tags=["Гейты"],
)
@router.post(
    "/api/gates/{gate_id}/like",
    response_model=LikeResponse,
    include_in_schema=False,
)
async def like_gate(
    gate_id: int,
    value: int = Form(..., ge=0, le=1),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user_required),
):
    gate = await gate_repo.get_published(db, gate_id)
    if not gate:
        raise HTTPException(status_code=404, detail="Gate not found")

    if gate.creator_id == current_user.id:
        raise HTTPException(status_code=400, detail="You cannot like your own gate")

    if value == 1:
        await gate_repo.like_gate(db, current_user.id, gate_id)
    else:
        await gate_repo.unlike_gate(db, current_user.id, gate_id)

    likes_count = await gate_repo.likes_count(db, gate_id)
    return LikeResponse(gate_id=gate_id, likes_count=likes_count, is_liked=(value == 1))


# Справочник атрибутов (для формы добавления услуги).
attributes_router = APIRouter()


@attributes_router.get(
    "/api/attributes",
    response_model=list[AttributeResponse],
    summary="Справочник атрибутов",
    description="Список всех наименований атрибутов услуг",
    tags=["Атрибуты"],
)
async def list_attributes(db: AsyncSession = Depends(get_db)):
    return await gate_repo.list_attributes(db)
