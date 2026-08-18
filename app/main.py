from fastapi import FastAPI

import app.models

from app.api.test_db import router as test_router
from app.api.users import router as user_router
from app.api.auth import router as auth_router
from app.api.categories import router as category_router

app = FastAPI(

    title="Shopping API",

    version="1.0.0"

)


app.include_router(test_router)
app.include_router(user_router)
app.include_router(auth_router)
app.include_router(category_router)


@app.get("/")
def home():

    return {

        "message": "Shopping API funcionando correctamente"

    }