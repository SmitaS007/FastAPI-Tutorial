from pydantic import BaseModel, EmailStr, AnyUrl, Field, field_validator, model_validator
from typing import List, Dict, Optional, Annotated

class Patient(BaseModel):

    name: str
    email: EmailStr
    age: int
    weight: float
    married: bool
    allergies: List[str]
    contact_details: Dict[str, str]

    @model_validator(mode='after')
    def validate_emergency_contact(cls, model):
        if model.age > 60 and 'emergency' not in model.contact_details:
            raise ValueError('Patient older than 60 must have emergency contact details.')
        return model

    
def insert_patient_data(patient: Patient):

    print(patient.name)
    print(patient.age)
    print('Inserted')

def update_patient_data(patient: Patient):

    print(patient.name)
    print(patient.age)
    print(patient.allergies)
    print(patient.married)
    print('Updated')


patient_info={'name':'Smita', 'email': 'smita@icici.com', 'age':62, 
              'weight': 66, 'married': True, 'allergies': ['dust', 'beans'],
              'contact_details': {'phone': '12345566', 'emergency':'12345456'}}

patient1= Patient(**patient_info)

update_patient_data(patient1)