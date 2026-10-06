"""
REST API для работы с гейтами.
Все методы начинаются с /api/gates.
"""

import os
import shutil
import uuid
from pathlib import Path
from typing import Optional

from fastapi import APIRouter, Depends, HTTPException, Query, UploadFile, File, Form, Request
from sqlalchemy.ext.asyncio import AsyncSession

from core.config import settings
from core.current_user import get_current_user_id
from core.minio_client import upload_file_from_bytes, delete_file, get_file_url
from db.session import get_db
from repositories import gate_repo, raw_sql
from schemas.gate import (
    GateResponse,
    GateListResponse,
    GateCreate,
    GatePublish,
    LikeRequest,
    LikeResponse
)

router = APIRouter()

# Директория для временного хранения файлов
UPLOAD_DIR = Path("static/uploads")
UPLOAD_DIR.mkdir(parents=True, exist_ok=True)

# Локальные файлы по умолчанию (заглушка)
DEFAULT_IMAGE = "img/pauli_x.png"
DEFAULT_VIDEO = "img/video.mp4"


def generate_filename(original_filename: str) -> str:
    """Генерирует уникальное имя файла на латинице."""
    ext = Path(original_filename).suffix
    return f"{uuid.uuid4().hex}{ext}"


@router.get("/api/gates", response_model=GateListResponse)
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
):
    """
    GET /api/gates — список опубликованных гейтов с фильтрацией.
    Признак is_creator: 0/1 если создатель услуги совпадает с текущим пользователем.
    """
    # Проверка min <= max
    if angle_x_min > angle_x_max:
        raise HTTPException(status_code=400, detail="angle_x_min must be <= angle_x_max")
    if angle_y_min > angle_y_max:
        raise HTTPException(status_code=400, detail="angle_y_min must be <= angle_y_max")

    current_user_id = get_current_user_id()
    items = await gate_repo.list_published(
        db, q, angle_x_min, angle_x_max, angle_y_min, angle_y_max
    )

    # Сортировка
    if sort_by == "id":
        items.sort(key=lambda x: x.id, reverse=(sort_order == "desc"))
    elif sort_by == "title":
        items.sort(key=lambda x: x.title, reverse=(sort_order == "desc"))
    elif sort_by == "created_at":
        items.sort(key=lambda x: x.created_at, reverse=(sort_order == "desc"))

    # Пагинация
    total = len(items)
    items = items[offset:offset + limit]

    # Формируем ответ
    response_items = []
    for gate in items:
        gate_dict = {
            "id": gate.id,
            "title": gate.title,
            "summary": gate.summary,
            "status": gate.status,
            "image_url": gate.image_url,
            "video_url": gate.video_url,
            "angle_x": gate.angle_x,
            "angle_y": gate.angle_y,
            "creator_id": gate.creator_id,
            "created_at": gate.created_at,
            "formed_at": gate.formed_at,
            "is_creator": gate.creator_id == current_user_id
        }
        response_items.append(GateResponse(**gate_dict))

    return GateListResponse(items=response_items, total=total)


@router.get("/api/gates/feed")
async def feed_gates(
    db: AsyncSession = Depends(get_db),
):
    """
    GET /api/gates/feed — лента опубликованных гейтов.
    """
    items = await gate_repo.list_published(db)
    current_user_id = get_current_user_id()

    # Добавляем признак is_creator
    response_items = []
    for gate in items:
        gate_dict = {
            "id": gate.id,
            "title": gate.title,
            "summary": gate.summary,
            "status": gate.status,
            "image_url": gate.image_url,
            "video_url": gate.video_url,
            "angle_x": gate.angle_x,
            "angle_y": gate.angle_y,
            "creator_id": gate.creator_id,
            "created_at": gate.created_at,
            "formed_at": gate.formed_at,
            "is_creator": gate.creator_id == current_user_id
        }
        response_items.append(GateResponse(**gate_dict))

    return GateListResponse(items=response_items, total=len(response_items))


@router.get("/api/gates/draft")
async def get_draft(
    db: AsyncSession = Depends(get_db),
):
    """
    GET /api/gates/draft — получение черновика текущего пользователя.
    Возвращает не более 1 записи.
    """
    current_user_id = get_current_user_id()

    draft = await gate_repo.get_draft_for_user(db, current_user_id)
    if not draft:
        raise HTTPException(status_code=404, detail="Draft not found")

    return GateResponse(
        id=draft.id,
        title=draft.title,
        summary=draft.summary,
        status=draft.status,
        image_url=draft.image_url,
        video_url=draft.video_url,
        angle_x=draft.angle_x,
        angle_y=draft.angle_y,
        creator_id=draft.creator_id,
        created_at=draft.created_at,
        formed_at=draft.formed_at,
        is_creator=True
    )


@router.post("/api/gates", status_code=201)
async def create_gate(
    request: Request,
    db: AsyncSession = Depends(get_db),
    image: Optional[UploadFile] = File(None),
    video: Optional[UploadFile] = File(None),
):
    """
    POST /api/gates — добавление нового гейта с файлами.
    Файлы изображения и видео загружаются в MinIO.
    Названия файлов генерируются на латинице.
    """
    current_user_id = get_current_user_id()

    # Получаем title из query parameters или form data
    title = request.query_params.get("title", "")
    if not title:
        form = await request.form()
        title = form.get("title", "")

    if not title:
        raise HTTPException(status_code=400, detail="Title is required")

    # Проверяем, нет ли уже черновика
    existing = await gate_repo.get_draft_for_user(db, current_user_id)
    if existing:
        raise HTTPException(status_code=400, detail="Draft already exists")

    # Обрабатываем файлы
    image_url = DEFAULT_IMAGE
    video_url = DEFAULT_VIDEO

    if image and image.filename:
        filename = generate_filename(image.filename)
        file_data = await image.read()
        image_url = upload_file_from_bytes(file_data, filename)
        if not image_url:
            raise HTTPException(status_code=500, detail="Failed to upload image")

    if video and video.filename:
        filename = generate_filename(video.filename)
        file_data = await video.read()
        video_url = upload_file_from_bytes(file_data, filename)
        if not video_url:
            raise HTTPException(status_code=500, detail="Failed to upload video")

    # Создаём черновик
    gate = await gate_repo.create_draft(
        db, current_user_id, title, image_url, video_url
    )

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
        created_at=gate.created_at,
        formed_at=gate.formed_at,
        is_creator=True
    )


@router.put("/api/gates/{gate_id}/publish")
async def publish_gate(
    gate_id: int,
    request: Request,
    db: AsyncSession = Depends(get_db),
    image: Optional[UploadFile] = File(None),
    video: Optional[UploadFile] = File(None),
):
    """
    PUT /api/gates/{gate_id}/publish — публикация гейта (смена статуса).
    """
    current_user_id = get_current_user_id()

    # Получаем данные из query parameters или form data
    summary = request.query_params.get("summary", "")
    angle_x = request.query_params.get("angle_x", "0")
    angle_y = request.query_params.get("angle_y", "0")

    if not summary:
        form = await request.form()
        summary = form.get("summary", "")
        angle_x = form.get("angle_x", "0")
        angle_y = form.get("angle_y", "0")

    if not summary:
        raise HTTPException(status_code=400, detail="Summary is required")

    try:
        angle_x = int(angle_x)
        angle_y = int(angle_y)
    except ValueError:
        raise HTTPException(status_code=400, detail="angle_x and angle_y must be integers")

    # Проверяем, что черновик существует и принадлежит текущему пользователю
    draft = await gate_repo.get_draft_for_user(db, current_user_id)
    if not draft or draft.id != gate_id:
        raise HTTPException(status_code=404, detail="Draft not found or not yours")

    # Обрабатываем файлы
    image_url = DEFAULT_IMAGE
    video_url = DEFAULT_VIDEO

    if image and image.filename:
        filename = generate_filename(image.filename)
        file_data = await image.read()
        image_url = upload_file_from_bytes(file_data, filename)
        if not image_url:
            raise HTTPException(status_code=500, detail="Failed to upload image")

    if video and video.filename:
        filename = generate_filename(video.filename)
        file_data = await video.read()
        video_url = upload_file_from_bytes(file_data, filename)
        if not video_url:
            raise HTTPException(status_code=500, detail="Failed to upload video")

    # Публикуем гейт
    published = await gate_repo.publish_draft(
        db, gate_id, summary, angle_x, angle_y, image_url, video_url
    )
    if not published:
        raise HTTPException(status_code=404, detail="Draft not found")

    return GateResponse(
        id=published.id,
        title=published.title,
        summary=published.summary,
        status=published.status,
        image_url=published.image_url,
        video_url=published.video_url,
        angle_x=published.angle_x,
        angle_y=published.angle_y,
        creator_id=published.creator_id,
        created_at=published.created_at,
        formed_at=published.formed_at,
        is_creator=True
    )


@router.delete("/api/gates/{gate_id}")
async def delete_gate(
    gate_id: int,
    db: AsyncSession = Depends(get_db),
):
    """
    DELETE /api/gates/{gate_id} — удаление гейта (soft delete).
    Только услуги этого пользователя.
    """
    current_user_id = get_current_user_id()

    # Проверяем, что гейт существует, опубликован и принадлежит текущему пользователю
    gate = await gate_repo.get_published(db, gate_id)
    if not gate:
        raise HTTPException(status_code=404, detail="Gate not found")
    if gate.creator_id != current_user_id:
        raise HTTPException(status_code=403, detail="You can only delete your own gates")

    # Soft delete
    ok = await raw_sql.soft_delete_gate(db, gate_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Gate not found or not published")

    return {"success": True, "message": "Gate deleted"}


@router.post("/api/gates/{gate_id}/like")
async def like_gate(
    gate_id: int,
    value: int = Form(..., ge=0, le=1),
    db: AsyncSession = Depends(get_db),
):
    """
    POST /api/gates/{gate_id}/like — поставить/отменить лайк.
    value: 0 — отменить лайк, 1 — поставить лайк.
    """
    current_user_id = get_current_user_id()

    # Проверяем, что гейт существует и опубликован
    gate = await gate_repo.get_published(db, gate_id)
    if not gate:
        raise HTTPException(status_code=404, detail="Gate not found")

    # Проверяем, не пытается ли пользователь лайкнуть свой гейт
    if gate.creator_id == current_user_id:
        raise HTTPException(status_code=400, detail="You cannot like your own gate")

    # Ставим или отменяем лайк
    if value == 1:
        await gate_repo.like_gate(db, current_user_id, gate_id)
    else:
        await gate_repo.unlike_gate(db, current_user_id, gate_id)

    # Получаем обновлённое количество лайков
    likes_count = await gate_repo.likes_count(db, gate_id)

    return LikeResponse(
        gate_id=gate_id,
        likes_count=likes_count,
        is_liked=(value == 1)
    )
