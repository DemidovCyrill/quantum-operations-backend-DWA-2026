from fastapi import APIRouter, Request, HTTPException
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
from data.collections import gates, CURRENT_USER_ID

router = APIRouter()
templates = Jinja2Templates(directory="templates")

# --- Настройка медиа ---
USE_MINIO = True                                            # True → картинки из MinIO
MINIO_URL = "http://localhost:9000/quantum-operations"      # имя вашего бакета
MEDIA_PREFIX = MINIO_URL if USE_MINIO else "/static/img"


def published_gates():
    """Только опубликованные гейты (draft и deleted скрыты)."""
    return [g for g in gates if g["status"] == "published"]


def find_gate(gate_id: int):
    return next((g for g in gates if g["id"] == gate_id), None)


def next_gate_id(gate_id: int):
    """ID следующего опубликованного гейта (по кругу)."""
    pub = published_gates()
    if not pub:
        return None
    ids = [g["id"] for g in pub]
    if gate_id not in ids:
        return ids[0]
    i = ids.index(gate_id)
    return ids[(i + 1) % len(ids)]


@router.get("/")
def root():
    return RedirectResponse(url="/gates")


# --- GET №1: плитка + фильтры ---
@router.get("/gates")
def grid_page(
    request: Request,
    q: str = "",
    angle_x_min: int = 0,
    angle_x_max: int = 180,
    angle_y_min: int = 0,
    angle_y_max: int = 180,
):
    items = published_gates()

    if q:
        items = [g for g in items if q.lower() in g["title"].lower()]

    items = [
        g for g in items
        if angle_x_min <= g["angle_x"] <= angle_x_max
        and angle_y_min <= g["angle_y"] <= angle_y_max
    ]

    return templates.TemplateResponse(
        request=request,
        name="grid.html",
        context={
            "gates": items,
            "q": q,
            "angle_x_min": angle_x_min,
            "angle_x_max": angle_x_max,
            "angle_y_min": angle_y_min,
            "angle_y_max": angle_y_max,
            "media_prefix": MEDIA_PREFIX,
        },
    )


# --- GET №2: лента ---
@router.get("/gates/{gate_id}")
def feed_page(request: Request, gate_id: int, next: bool = False):
    if next:
        nid = next_gate_id(gate_id)
        if nid is not None:
            return RedirectResponse(url=f"/gates/{nid}")

    gate = find_gate(gate_id)
    if not gate or gate["status"] != "published":
        raise HTTPException(status_code=404, detail="Gate not found")

    is_liked = CURRENT_USER_ID in gate["likes"]

    return templates.TemplateResponse(
        request=request,
        name="feed.html",
        context={
            "gate": gate,
            "likes_count": len(gate["likes"]),
            "is_liked": is_liked,
            "next_id": next_gate_id(gate_id),
            "media_prefix": MEDIA_PREFIX,
        },
    )


# --- GET №2.5: переключение лайка (учебный компромисс) ---
@router.get("/gates/{gate_id}/like-toggle")
def like_toggle(gate_id: int):
    """
    Учебное упрощение: лайк переключается через GET + редирект.
    В реальном приложении это должен быть POST (мутация состояния).
    """
    gate = find_gate(gate_id)
    if not gate or gate["status"] != "published":
        raise HTTPException(status_code=404, detail="Gate not found")

    if CURRENT_USER_ID in gate["likes"]:
        gate["likes"].remove(CURRENT_USER_ID)
    else:
        gate["likes"].append(CURRENT_USER_ID)

    return RedirectResponse(url=f"/gates/{gate_id}")


# --- GET №3: добавление (черновик) ---
@router.get("/add")
def add_page(request: Request):
    draft = next((g for g in gates if g["status"] == "draft"), None)
    return templates.TemplateResponse(
        request=request,
        name="add.html",
        context={"gate": draft, "media_prefix": MEDIA_PREFIX},
    )