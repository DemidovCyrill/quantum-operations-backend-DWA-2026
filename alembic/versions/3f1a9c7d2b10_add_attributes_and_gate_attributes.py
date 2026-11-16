"""add attributes and gate_attributes (m-m)

Revision ID: 3f1a9c7d2b10
Revises: 2d87ef59e2c4
Create Date: 2026-11-16 20:00:00.000000

"""
from typing import Sequence, Union

import sqlalchemy as sa
from alembic import op

revision: str = "3f1a9c7d2b10"
down_revision: Union[str, Sequence[str], None] = "2d87ef59e2c4"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


ATTRIBUTES = [
    "Тип вентиля",
    "Матрица",
    "Ось поворота",
    "Угол поворота",
    "Обратимость",
    "Фазовый сдвиг",
    "Создаёт суперпозицию",
    "Управляемый",
    "Количество кубитов",
]

GATE_ATTRIBUTES = {
    "паули-x": [
        ("Тип вентиля", "Однокубитовый"),
        ("Матрица", "[[0, 1], [1, 0]]"),
        ("Ось поворота", "X"),
        ("Угол поворота", "180°"),
        ("Обратимость", "Да"),
    ],
    "паули-y": [
        ("Тип вентиля", "Однокубитовый"),
        ("Матрица", "[[0, -i], [i, 0]]"),
        ("Ось поворота", "Y"),
        ("Угол поворота", "180°"),
        ("Обратимость", "Да"),
    ],
    "паули-z": [
        ("Тип вентиля", "Однокубитовый"),
        ("Матрица", "[[1, 0], [0, -1]]"),
        ("Ось поворота", "Z"),
        ("Угол поворота", "180°"),
        ("Фазовый сдвиг", "π"),
    ],
    "хадамард": [
        ("Тип вентиля", "Однокубитовый"),
        ("Матрица", "1/√2 · [[1, 1], [1, -1]]"),
        ("Создаёт суперпозицию", "Да"),
        ("Обратимость", "Да"),
    ],
    "phase": [
        ("Тип вентиля", "Однокубитовый"),
        ("Матрица", "[[1, 0], [0, i]]"),
        ("Фазовый сдвиг", "90°"),
        ("Обратимость", "Да"),
    ],
    "cnot": [
        ("Тип вентиля", "Двукубитовый"),
        ("Управляемый", "Да"),
        ("Количество кубитов", "2"),
        ("Обратимость", "Да"),
    ],
}


def upgrade() -> None:
    op.create_table(
        "attributes",
        sa.Column("id", sa.Integer(), primary_key=True, nullable=False),
        sa.Column("name", sa.String(length=128), nullable=False),
        sa.UniqueConstraint("name", name="uq_attributes_name"),
    )
    op.create_index("ix_attributes_id", "attributes", ["id"])

    op.create_table(
        "gate_attributes",
        sa.Column("gate_id", sa.Integer(), nullable=False),
        sa.Column("attribute_id", sa.Integer(), nullable=False),
        sa.Column("value", sa.String(length=255), nullable=False, server_default=""),
        sa.ForeignKeyConstraint(["gate_id"], ["gates.id"], ondelete="CASCADE"),
        sa.ForeignKeyConstraint(["attribute_id"], ["attributes.id"], ondelete="CASCADE"),
        sa.PrimaryKeyConstraint("gate_id", "attribute_id"),
        sa.UniqueConstraint("gate_id", "attribute_id", name="uq_gate_attribute"),
    )

    connection = op.get_bind()
    attributes_table = sa.table("attributes", sa.column("id"), sa.column("name"))
    values_table = sa.table(
        "gate_attributes",
        sa.column("gate_id"),
        sa.column("attribute_id"),
        sa.column("value"),
    )

    for name in ATTRIBUTES:
        connection.execute(attributes_table.insert().values(name=name))

    rows = connection.execute(sa.text("SELECT id, name FROM attributes")).fetchall()
    attribute_ids = {name: attribute_id for attribute_id, name in rows}

    gates = connection.execute(sa.text("SELECT id, title FROM gates")).fetchall()
    for gate_id, title in gates:
        title_lower = (title or "").lower()
        matched = None
        for key, items in GATE_ATTRIBUTES.items():
            if key in title_lower:
                matched = items
                break
        if matched is None:
            matched = [("Тип вентиля", "Квантовый вентиль")]

        for name, value in matched:
            attribute_id = attribute_ids.get(name)
            if not attribute_id:
                continue
            connection.execute(
                values_table.insert().values(
                    gate_id=gate_id,
                    attribute_id=attribute_id,
                    value=value,
                )
            )


def downgrade() -> None:
    op.drop_table("gate_attributes")
    op.drop_index("ix_attributes_id", table_name="attributes")
    op.drop_table("attributes")
