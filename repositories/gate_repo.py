from datetime import datetime
from sqlalchemy import select, func, delete
from sqlalchemy.ext.asyncio import AsyncSession
from models.gate import Gate
from models.like import Like


async def list_published(
    db: AsyncSession,
    q: str = "",
    angle_x_min: int = 0, angle_x_max: int = 180,
    angle_y_min: int = 0, angle_y_max: int = 180,
):
    stmt = select(Gate).where(Gate.status == "published")
    if q:
        stmt = stmt.where(Gate.title.ilike(f"%{q}%"))
    stmt = stmt.where(
        Gate.angle_x.between(angle_x_min, angle_x_max),
        Gate.angle_y.between(angle_y_min, angle_y_max),
    ).order_by(Gate.id)
    result = await db.execute(stmt)
    return result.scalars().all()


async def get_published(db: AsyncSession, gate_id: int):
    stmt = select(Gate).where(Gate.id == gate_id, Gate.status == "published")
    result = await db.execute(stmt)
    return result.scalar_one_or_none()


async def first_published_id(db: AsyncSession):
    stmt = select(func.min(Gate.id)).where(Gate.status == "published")
    result = await db.execute(stmt)
    return result.scalar_one_or_none()


async def next_published_id(db: AsyncSession, gate_id: int):
    stmt = select(func.min(Gate.id)).where(
        Gate.id > gate_id,
        Gate.status == "published"
    )
    result = await db.execute(stmt)
    next_id = result.scalar_one_or_none()

    if next_id is None:
        stmt = select(func.min(Gate.id)).where(Gate.status == "published")
        result = await db.execute(stmt)
        next_id = result.scalar_one_or_none()
    
    return next_id


async def likes_count(db: AsyncSession, gate_id: int) -> int:
    stmt = select(func.count()).select_from(Like).where(Like.gate_id == gate_id)
    result = await db.execute(stmt)
    return result.scalar_one()


async def like_gate(db: AsyncSession, user_id: int, gate_id: int) -> None:
    """Ставит лайк гейту."""
    like = Like(user_id=user_id, gate_id=gate_id)
    db.add(like)
    await db.commit()


async def unlike_gate(db: AsyncSession, user_id: int, gate_id: int) -> None:
    """Отменяет лайк гейту."""
    stmt = delete(Like).where(Like.user_id == user_id, Like.gate_id == gate_id)
    await db.execute(stmt)
    await db.commit()


async def get_draft_for_user(db: AsyncSession, user_id: int):
    """Получает последний гейт пользователя (черновик или любой другой)."""
    stmt = (
        select(Gate)
        .where(Gate.creator_id == user_id)
        .order_by(Gate.id.desc())
        .limit(1)
    )
    result = await db.execute(stmt)
    return result.scalar_one_or_none()


async def create_draft(db: AsyncSession, user_id: int, title: str,
                       image_url: str, video_url: str) -> Gate:
    gate = Gate(
        title=title,
        status="draft",
        image_url=image_url,
        video_url=video_url,
        creator_id=user_id,
        angle_x=0,
        angle_y=0,
    )
    db.add(gate)
    await db.commit()
    await db.refresh(gate)
    return gate


async def publish_draft(db: AsyncSession, gate_id: int, summary: str,
                        angle_x: int, angle_y: int, image_url: str, video_url: str) -> Gate | None:
    stmt = select(Gate).where(Gate.id == gate_id, Gate.status == "draft")
    result = await db.execute(stmt)
    gate = result.scalar_one_or_none()
    if not gate:
        return None
    gate.summary = summary
    gate.angle_x = angle_x
    gate.angle_y = angle_y
    gate.image_url = image_url
    gate.video_url = video_url
    gate.status = "published"
    gate.formed_at = datetime.utcnow()
    await db.commit()
    await db.refresh(gate)
    return gate

"""
class Settings(BaseSettings):
    # ... другие настройки ...
    
    MINIO_URL: str = "http://127.0.0.1:9000/quantum-operations"
    USE_MINIO: bool = False  # ← По умолчанию НЕ MinIO, а локальные файлы
"""