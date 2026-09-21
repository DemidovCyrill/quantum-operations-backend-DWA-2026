from datetime import datetime
from sqlalchemy import select, func
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


async def next_published_id(db: AsyncSession, gate_id: int):
    stmt = select(Gate.id).where(Gate.status == "published").order_by(Gate.id)
    result = await db.execute(stmt)
    ids = [row[0] for row in result.all()]
    if not ids:
        return None
    if gate_id not in ids:
        return ids[0]
    return ids[(ids.index(gate_id) + 1) % len(ids)]


async def likes_count(db: AsyncSession, gate_id: int) -> int:
    stmt = select(func.count()).select_from(Like).where(Like.gate_id == gate_id)
    result = await db.execute(stmt)
    return result.scalar_one()


async def get_draft_for_user(db: AsyncSession, user_id: int):
    stmt = select(Gate).where(Gate.creator_id == user_id, Gate.status == "draft")
    result = await db.execute(stmt)
    return result.scalar_one_or_none()


async def create_draft(db: AsyncSession, user_id: int, title: str,
                       image_url: str | None, video_url: str | None) -> Gate:
    gate = Gate(
        title=title,
        status="draft",
        image_url=image_url or None,
        video_url=video_url or None,
        creator_id=user_id,
        angle_x=0,
        angle_y=0,
    )
    db.add(gate)
    await db.commit()
    await db.refresh(gate)
    return gate


async def publish_draft(db: AsyncSession, gate_id: int, summary: str,
                        angle_x: int, angle_y: int) -> Gate | None:
    stmt = select(Gate).where(Gate.id == gate_id, Gate.status == "draft")
    result = await db.execute(stmt)
    gate = result.scalar_one_or_none()
    if not gate:
        return None
    gate.summary = summary
    gate.angle_x = angle_x
    gate.angle_y = angle_y
    gate.status = "published"
    gate.formed_at = datetime.utcnow()
    await db.commit()
    await db.refresh(gate)
    return gate