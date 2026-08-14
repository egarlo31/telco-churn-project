from pydantic import BaseModel, Field
from enum import Enum
from typing import Literal

class Yes_No(str, Enum):
    YES = "Yes"
    NO = "No"

class Yes_No_NoPhoneService(str, Enum):
    YES = "Yes"
    NO = "No"
    NO_PHONE_SERVICE = "No phone service"

class Yes_No_NoInternetService(str, Enum):
    YES = "Yes"
    NO = "No"
    NO_INTERNET_SERVICE = "No internet service"

class CustomerInput(BaseModel):
    gender: Literal["Male","Female"]
    SeniorCitizen: Literal[0,1]
    Partner: Yes_No
    Dependents: Yes_No
    tenure: int = Field(ge=0)
    PhoneService: Yes_No
    MultipleLines: Yes_No_NoPhoneService
    InternetService: Literal["No","DSL","Fiber optic"]
    OnlineSecurity: Yes_No_NoInternetService
    OnlineBackup: Yes_No_NoInternetService
    DeviceProtection: Yes_No_NoInternetService
    TechSupport: Yes_No_NoInternetService
    StreamingTV: Yes_No_NoInternetService
    StreamingMovies: Yes_No_NoInternetService
    Contract: Literal["Two year","One year","Month-to-month"]
    PaperlessBilling: Yes_No
    PaymentMethod: Literal["Electronic check","Mailed check","Bank transfer (automatic)","Credit card (automatic)"]
    MonthlyCharges: float = Field(ge=0)
    TotalCharges: float = Field(ge=0)