from sqlalchemy import (
    Column, Integer, String, DateTime, ForeignKey, CheckConstraint, func
)
from sqlalchemy.orm import relationship
from db.base import Base


class Gate(Base):
    __tablename__ = "gates"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(128), nullable=False)
    summary = Column(String(512), nullable=True)
    status = Column(String(16), nullable=False, default="draft")
    image_url = Column(String(255), nullable=True)
    video_url = Column(String(255), nullable=True)
    angle_x = Column(Integer, nullable=False, default=0)
    angle_y = Column(Integer, nullable=False, default=0)
    creator_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    created_at = Column(DateTime, server_default=func.now(), nullable=False)
    formed_at = Column(DateTime, nullable=True)

    creator = relationship("User", back_populates="gates")
    likes = relationship("Like", back_populates="gate")

    __table_args__ = (
        CheckConstraint("status IN ('draft','published','deleted')",
                        name="chk_gate_status"),
    )