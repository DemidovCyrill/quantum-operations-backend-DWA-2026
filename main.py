from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
import uvicorn

import models  # noqa: F401

from api.handlers import router
from api.gates import router as gates_router
from api.users import router as users_router

app = FastAPI(
    title="Quantum Gates API",
    description="REST API для работы с квантовыми вентилями",
    version="4.0.0",
)

app.mount("/static", StaticFiles(directory="static"), name="static")
app.include_router(router)
app.include_router(gates_router)
app.include_router(users_router)

if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)