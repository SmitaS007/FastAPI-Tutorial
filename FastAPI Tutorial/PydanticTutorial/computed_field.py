from pydantic import BaseModel, EmailStr, AnyUrl, Field, field_validator, model_validator, computed_field
from typing import List, Dict, Optional, Annotated

class Patient(BaseModel):

    name: str
    email: EmailStr
    age: int
    weight: float
    height: float
    married: bool
    allergies: List[str]
    contact_details: Dict[str, str]

    @computed_field
    @property
    def bmi(self)-> float:
        bmi = round(self.weight/(self.height**2),2)
        return bmi

    

def update_patient_data(patient: Patient):

    print(patient.name)
    print(patient.age)
    print(patient.allergies)
    print(patient.married)
    print('BMI', patient.bmi)
    print('Updated')


patient_info={'name':'Smita', 'email': 'smita@icici.com', 'age':62, 
              'weight': 66, 'height': 1.65,'married': True, 'allergies': ['dust', 'beans'],
              'contact_details': {'phone': '12345566', 'emergency':'12345456'}}

patient1= Patient(**patient_info)

update_patient_data(patient1)