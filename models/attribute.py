from sqlalchemy import Column, Integer, String, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relationship

from db.base import Base


class Attribute(Base):
    """Справочник наименований атрибутов услуги (не фиксированный набор полей)."""

    __tablename__ = "attributes"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(128), nullable=False, unique=True)

    values = relationship("GateAttribute", back_populates="attribute")


class GateAttribute(Base):
    """Вертикальная таблица значений атрибутов: связь m-m между услугами и атрибутами."""

    __tablename__ = "gate_attributes"

    gate_id = Column(Integer, ForeignKey("gates.id", ondelete="CASCADE"), primary_key=True)
    attribute_id = Column(Integer, ForeignKey("attributes.id", ondelete="CASCADE"), primary_key=True)
    value = Column(String(255), nullable=False, default="")

    gate = relationship("Gate", back_populates="attribute_values")
    attribute = relationship("Attribute", back_populates="values")

    __table_args__ = (
        UniqueConstraint("gate_id", "attribute_id", name="uq_gate_attribute"),
    )
