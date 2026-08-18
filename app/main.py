from fastapi import FastAPI

from app.api.test_db import router as test_router

app = FastAPI(
    title="Shopping API",
    version="1.0.0"
)


app.include_router(test_router)


@app.get("/")
def home():

    return {
        "message": "Shopping API funcionando correctamente"
    }
