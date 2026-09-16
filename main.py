from fastapi import FastAPI
import uvicorn
from fastapi.staticfiles import StaticFiles
from api.handlers import router

app = FastAPI(title="Quantum Gates App")
app.mount("/static", StaticFiles(directory="static"), name="static")
app.include_router(router)

if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)