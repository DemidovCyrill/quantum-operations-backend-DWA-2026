from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates
from data.collections import quantum_db

router = APIRouter()
templates = Jinja2Templates(directory="templates")

@router.get("/")
def get_catalog(request: Request):
    # Добавляем context явно
    return templates.TemplateResponse(
        request=request,
        name="index.html",
        context={"quantums": quantum_db}
    )


# код необходимо ДОБАВИТЬ к существующим маршрутам в файле
@router.get("/quantum/{quantum_id}")
def get_hotel_detail(request: Request, quantum_id: int):
    quantum = next((h for h in quantum_db if h["id"] == quantum_id), None)

    return templates.TemplateResponse(
        request=request,
        name="operations.html",
        context={"quantum": quantum}
    )
