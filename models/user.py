from datetime import datetime
from sqlalchemy import Column, Integer, String, DateTime, func
from sqlalchemy.orm import relationship
from db.base import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(64), nullable=False, unique=True)
    email = Column(String(128), nullable=False, unique=True)
    created_at = Column(DateTime, server_default=func.now(), nullable=False)

    gates = relationship("Gate", back_populates="creator")
    likes = relationship("Like", back_populates="user")