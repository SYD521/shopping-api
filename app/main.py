from fastapi import FastAPI

app = FastAPI(
    title="Shopping API",
    version="1.0.0"
)


@app.get("/")
def home():
    return {
        "message": "Shopping API funcionando correctamente"
    }
