from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

@app.get("/numero")
def get_number():
    return {"number": 10}

@app.post("/get_numero/{cantidad}")
def create_number(cantidad: int):
    return {"cantidad": cantidad,
            "double": cantidad*2}

@app.get("/double")
def get_double(cantidad: int):
    return {"resultado": cantidad + cantidad}

class Operation(BaseModel):
    number_one: float
    number_two: float

@app.post("/sum")
def sum_numbers(data: Operation):
    result = (data.number_one / data.number_two)**2

    return {"result": result}