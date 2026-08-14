from fastapi import APIRouter
from app.schemas.prediction import CustomerInput
router = APIRouter()

@router.post("/get_data_customer")
def get_data_customer(customer_data: CustomerInput):
    return {"result": customer_data}