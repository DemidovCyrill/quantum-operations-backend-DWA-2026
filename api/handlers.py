from fastapi import APIRouter, Request, Depends, HTTPException, Form
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
from sqlalchemy.ext.asyncio import AsyncSession

from core.config import settings
from db.session import get_db
from repositories import gate_repo, raw_sql

router = APIRouter()
templates = Jinja2Templates(directory="templates")


@router.get("/")
async def root():
    return RedirectResponse(url="/gates")


@router.get("/gates")
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
        request=request, name="grid.html",
        context={
            "gates": items,
            "q": q,
            "angle_x_min": angle_x_min, "angle_x_max": angle_x_max,
            "angle_y_min": angle_y_min, "angle_y_max": angle_y_max,
            "media_prefix": settings.MEDIA_PREFIX,
        },
    )


@router.get("/gates/{gate_id}")
async def feed_page(
    request: Request,
    gate_id: int,
    next: bool = False,
    db: AsyncSession = Depends(get_db),
):
    if next:
        nid = await gate_repo.next_published_id(db, gate_id)
        if nid is not None:
            return RedirectResponse(url=f"/gates/{nid}")

    gate = await gate_repo.get_published(db, gate_id)
    if not gate:
        raise HTTPException(status_code=404, detail="Gate not found")

    return templates.TemplateResponse(
        request=request, name="feed.html",
        context={
            "gate": gate,
            "likes_count": await gate_repo.likes_count(db, gate_id),
            "media_prefix": settings.MEDIA_PREFIX,
        },
    )


@router.get("/add")
async def add_page(request: Request, db: AsyncSession = Depends(get_db)):
    draft = await gate_repo.get_draft_for_user(db, settings.CURRENT_USER_ID)
    return templates.TemplateResponse(
        request=request, name="add.html",
        context={
            "gate": draft,
            "media_prefix": settings.MEDIA_PREFIX,
        },
    )


@router.post("/gates")
async def create_gate(
    title: str = Form(...),
    image_url: str = Form(""),
    video_url: str = Form(""),
    db: AsyncSession = Depends(get_db),
):
    existing = await gate_repo.get_draft_for_user(db, settings.CURRENT_USER_ID)
    if existing:
        return RedirectResponse(url="/add", status_code=303)

    await gate_repo.create_draft(
        db, settings.CURRENT_USER_ID, title,
        image_url or None, video_url or None,
    )
    return RedirectResponse(url="/add", status_code=303)


@router.post("/gates/{gate_id}/publish")
async def publish_gate(
    gate_id: int,
    summary: str = Form(...),
    angle_x: int = Form(0),
    angle_y: int = Form(0),
    db: AsyncSession = Depends(get_db),
):
    gate = await gate_repo.publish_draft(db, gate_id, summary, angle_x, angle_y)
    if not gate:
        raise HTTPException(status_code=404, detail="Draft not found")
    return RedirectResponse(url=f"/gates/{gate.id}", status_code=303)


@router.post("/gates/{gate_id}/delete")
async def delete_gate(gate_id: int, db: AsyncSession = Depends(get_db)):
    ok = await raw_sql.soft_delete_gate(db, gate_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Gate not found or not published")
    return RedirectResponse(url="/gates", status_code=303)