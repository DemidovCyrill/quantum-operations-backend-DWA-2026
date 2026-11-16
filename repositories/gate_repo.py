from datetime import datetime

from sqlalchemy import delete, func, select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import selectinload

from models.attribute import Attribute, GateAttribute
from models.gate import Gate
from models.like import Like


def _gate_options():
    """Жадно загружаем автора и атрибуты, чтобы не было ленивых запросов в async."""
    return [
        selectinload(Gate.creator),
        selectinload(Gate.attribute_values).selectinload(GateAttribute.attribute),
    ]


async def list_published(
    db: AsyncSession,
    q: str = "",
    angle_x_min: int = 0, angle_x_max: int = 180,
    angle_y_min: int = 0, angle_y_max: int = 180,
):
    stmt = (
        select(Gate)
        .options(*_gate_options())
        .where(Gate.status == "published")
    )
    if q:
        stmt = stmt.where(Gate.title.ilike(f"%{q}%"))
    stmt = stmt.where(
        Gate.angle_x.between(angle_x_min, angle_x_max),
        Gate.angle_y.between(angle_y_min, angle_y_max),
    ).order_by(Gate.id)
    result = await db.execute(stmt)
    return result.scalars().all()


async def get_published(db: AsyncSession, gate_id: int):
    stmt = (
        select(Gate)
        .options(*_gate_options())
        .where(Gate.id == gate_id, Gate.status == "published")
    )
    result = await db.execute(stmt)
    return result.scalar_one_or_none()


async def get_any(db: AsyncSession, gate_id: int):
    stmt = (
        select(Gate)
        .options(*_gate_options())
        .where(Gate.id == gate_id)
        .execution_options(populate_existing=True)
    )
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


async def likes_counts(db: AsyncSession, gate_ids: list[int]) -> dict[int, int]:
    """Количество лайков для набора услуг одним запросом."""
    if not gate_ids:
        return {}
    stmt = (
        select(Like.gate_id, func.count(Like.id))
        .where(Like.gate_id.in_(gate_ids))
        .group_by(Like.gate_id)
    )
    rows = await db.execute(stmt)
    return {gate_id: count for gate_id, count in rows.all()}


async def liked_gate_ids(db: AsyncSession, user_id: int, gate_ids: list[int]) -> set[int]:
    """Какие из услуг уже лайкнуты пользователем."""
    if not user_id or not gate_ids:
        return set()
    stmt = select(Like.gate_id).where(
        Like.user_id == user_id,
        Like.gate_id.in_(gate_ids),
    )
    rows = await db.execute(stmt)
    return set(rows.scalars().all())


async def like_gate(db: AsyncSession, user_id: int, gate_id: int) -> None:
    """Ставит лайк гейту (повторный лайк игнорируется)."""
    exists = await db.execute(
        select(Like.id).where(Like.user_id == user_id, Like.gate_id == gate_id)
    )
    if exists.scalar_one_or_none():
        return
    db.add(Like(user_id=user_id, gate_id=gate_id))
    await db.commit()


async def unlike_gate(db: AsyncSession, user_id: int, gate_id: int) -> None:
    """Отменяет лайк гейту."""
    stmt = delete(Like).where(Like.user_id == user_id, Like.gate_id == gate_id)
    await db.execute(stmt)
    await db.commit()


async def get_draft_for_user(db: AsyncSession, user_id: int):
    """Получает черновик текущего пользователя (не более одного)."""
    stmt = (
        select(Gate)
        .options(*_gate_options())
        .where(Gate.creator_id == user_id, Gate.status == "draft")
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


async def update_draft(db: AsyncSession, gate: Gate, title: str,
                       image_url: str | None, video_url: str | None) -> Gate:
    gate.title = title
    if image_url:
        gate.image_url = image_url
    if video_url:
        gate.video_url = video_url
    await db.commit()
    await db.refresh(gate)
    return gate


async def publish_draft(db: AsyncSession, gate_id: int, summary: str,
                        angle_x: int, angle_y: int,
                        image_url: str | None = None,
                        video_url: str | None = None) -> Gate | None:
    stmt = select(Gate).where(Gate.id == gate_id, Gate.status == "draft")
    result = await db.execute(stmt)
    gate = result.scalar_one_or_none()
    if not gate:
        return None
    gate.summary = summary
    gate.angle_x = angle_x
    gate.angle_y = angle_y
    if image_url:
        gate.image_url = image_url
    if video_url:
        gate.video_url = video_url
    gate.status = "published"
    gate.formed_at = datetime.utcnow()
    await db.commit()
    await db.refresh(gate)
    return gate


async def get_or_create_attribute(db: AsyncSession, name: str) -> Attribute:
    """Находит атрибут по названию или создаёт новый (набор не фиксирован)."""
    stmt = select(Attribute).where(func.lower(Attribute.name) == name.lower())
    result = await db.execute(stmt)
    attribute = result.scalar_one_or_none()
    if attribute:
        return attribute

    attribute = Attribute(name=name)
    db.add(attribute)
    await db.flush()
    return attribute


async def set_gate_attributes(db: AsyncSession, gate_id: int, items) -> None:
    """
    Полностью заменяет набор атрибутов услуги.
    Позволяет добавлять и удалять характеристики без изменения структуры БД.
    """
    existing_result = await db.execute(
        select(GateAttribute)
        .options(selectinload(GateAttribute.attribute))
        .where(GateAttribute.gate_id == gate_id)
    )
    existing = {item.attribute.name.lower(): item for item in existing_result.scalars().all()}

    keep: set[str] = set()
    for item in items:
        name = (item.name or "").strip()
        if not name:
            continue
        key = name.lower()
        keep.add(key)

        attribute = await get_or_create_attribute(db, name)
        current = existing.get(key)
        if current:
            current.attribute_id = attribute.id
            current.value = item.value or ""
        else:
            db.add(GateAttribute(gate_id=gate_id, attribute_id=attribute.id, value=item.value or ""))

    for key, current in existing.items():
        if key not in keep:
            await db.delete(current)

    await db.commit()


async def list_attributes(db: AsyncSession):
    result = await db.execute(select(Attribute).order_by(Attribute.name))
    return result.scalars().all()
