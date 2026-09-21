from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


async def soft_delete_gate(db: AsyncSession, gate_id: int) -> bool:
    query = text("""
        UPDATE gates
        SET status = 'deleted'
        WHERE id = :id AND status = 'published'
    """)
    result = await db.execute(query, {"id": gate_id})
    await db.commit()
    return result.rowcount > 0