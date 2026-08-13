from fastapi import FastAPI

app = FastAPI()

@app.get("/numero")
def get_number():
    return {"number": 10}

@app.post("/get_numero/{cantidad}")
def create_number(cantidad: int):
    return {"cantidad": cantidad,
            "double": cantidad*2}