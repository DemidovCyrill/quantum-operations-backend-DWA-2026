import os
import shutil
from pathlib import Path

from fastapi import APIRouter, Request, Depends, HTTPException, Form, UploadFile, File
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
from sqlalchemy.ext.asyncio import AsyncSession

from core.config import settings
from db.session import get_db
from repositories import gate_repo, raw_sql

UPLOAD_DIR = Path("static/uploads")
UPLOAD_DIR.mkdir(parents=True, exist_ok=True)

DEFAULT_IMAGE = "img/pauli_x.png"
DEFAULT_VIDEO = "img/video.mp4"

router = APIRouter()
templates = Jinja2Templates(directory="templates")


@router.get("/")
async def root():
    return RedirectResponse(url="/gates/grid")


@router.get("/gates/grid")
async def grid_page(
    request: Request,
    q: str = "",
    angle_x_min: int = 0, angle_x_max: int = 180,
    angle_y_min: int = 0, angle_y_max: int = 180,
    db: AsyncSession = Depends(get_db),
):
    items = await gate_repo.list_published(
        db, q, angle_x_min, angle_x_max, angle_y_min, angle_y_max
    )
    return templates.TemplateResponse(
        request=request, name="gates_grid.html",
        context={
            "gates": items,
            "q": q,
            "angle_x_min": angle_x_min, "angle_x_max": angle_x_max,
            "angle_y_min": angle_y_min, "angle_y_max": angle_y_max,
            "media_prefix": settings.MEDIA_PREFIX,
        },
    )


@router.get("/gates/feed/first")
async def feed_first(
    db: AsyncSession = Depends(get_db),
):
    first_id = await gate_repo.first_published_id(db)
    if first_id is None:
        raise HTTPException(status_code=404, detail="No published gates found")
    return RedirectResponse(url=f"/gates/feed/{first_id}")


@router.get("/gates/feed/{gate_id}")
async def feed_page(
    request: Request,
    gate_id: int,
    next: bool = False,
    db: AsyncSession = Depends(get_db),
):
    if next:
        nid = await gate_repo.next_published_id(db, gate_id)
        if nid is not None:
            return RedirectResponse(url=f"/gates/feed/{nid}")

    gate = await gate_repo.get_published(db, gate_id)
    if not gate:
        raise HTTPException(status_code=404, detail="Gate not found")

    return templates.TemplateResponse(
        request=request, name="gates_feed.html",
        context={
            "gate": gate,
            "likes_count": await gate_repo.likes_count(db, gate_id),
            "media_prefix": settings.MEDIA_PREFIX,
        },
    )


@router.get("/gates/add")
async def add_page(request: Request, db: AsyncSession = Depends(get_db)):
    draft = await gate_repo.get_draft_for_user(db, settings.CURRENT_USER_ID)
    return templates.TemplateResponse(
        request=request, name="gates_add.html",
        context={
            "gate": draft,
            "media_prefix": settings.MEDIA_PREFIX,
        },
    )


@router.post("/gates/add")
async def create_gate(
    title: str = Form(...),
    image: UploadFile | None = File(None),
    video: UploadFile | None = File(None),
    db: AsyncSession = Depends(get_db),
):
    existing = await gate_repo.get_draft_for_user(db, settings.CURRENT_USER_ID)
    if existing:
        return RedirectResponse(url="/gates/add", status_code=303)

    image_url = DEFAULT_IMAGE
    video_url = DEFAULT_VIDEO

    if image and image.filename:
        UPLOAD_DIR.mkdir(parents=True, exist_ok=True)
        safe_filename = image.filename.replace(" ", "_").replace("\\", "_").replace("/", "_")
        image_path = UPLOAD_DIR / safe_filename
        with open(image_path, "wb") as buffer:
            shutil.copyfileobj(image.file, buffer)
        image_url = f"uploads/{safe_filename}"

    if video and video.filename:
        UPLOAD_DIR.mkdir(parents=True, exist_ok=True)
        safe_filename = video.filename.replace(" ", "_").replace("\\", "_").replace("/", "_")
        video_path = UPLOAD_DIR / safe_filename
        with open(video_path, "wb") as buffer:
            shutil.copyfileobj(video.file, buffer)
        video_url = f"uploads/{safe_filename}"

    await gate_repo.create_draft(
        db, settings.CURRENT_USER_ID, title,
        image_url, video_url,
    )
    return RedirectResponse(url="/gates/add", status_code=303)


@router.post("/gates/feed/{gate_id}/publish")
async def publish_gate(
    gate_id: int,
    summary: str = Form(...),
    angle_x: int = Form(0),
    angle_y: int = Form(0),
    image: UploadFile | None = File(None),
    video: UploadFile | None = File(None),
    db: AsyncSession = Depends(get_db),
):
    image_url = DEFAULT_IMAGE
    video_url = DEFAULT_VIDEO

    if image and image.filename:
        UPLOAD_DIR.mkdir(parents=True, exist_ok=True)
        safe_filename = image.filename.replace(" ", "_").replace("\\", "_").replace("/", "_")
        image_path = UPLOAD_DIR / safe_filename
        with open(image_path, "wb") as buffer:
            shutil.copyfileobj(image.file, buffer)
        image_url = f"uploads/{safe_filename}"

    if video and video.filename:
        UPLOAD_DIR.mkdir(parents=True, exist_ok=True)
        safe_filename = video.filename.replace(" ", "_").replace("\\", "_").replace("/", "_")
        video_path = UPLOAD_DIR / safe_filename
        with open(video_path, "wb") as buffer:
            shutil.copyfileobj(video.file, buffer)
        video_url = f"uploads/{safe_filename}"

    gate = await gate_repo.publish_draft(db, gate_id, summary, angle_x, angle_y, image_url, video_url)
    if not gate:
        raise HTTPException(status_code=404, detail="Draft not found")
    return RedirectResponse(url=f"/gates/feed/{gate.id}", status_code=303)


@router.post("/gates/feed/{gate_id}/delete")
async def delete_gate(gate_id: int, db: AsyncSession = Depends(get_db)):
    ok = await raw_sql.soft_delete_gate(db, gate_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Gate not found or not published")
    return RedirectResponse(url="/gates/grid", status_code=303)