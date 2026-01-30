from pydantic import BaseModel
from typing import List, Dict, Optional

class Patient(BaseModel):

    name: str
    age: int
    weight: float
    married: bool = False
    allergies: Optional[List[str]]=None
    contact_details: Dict[str, str]

def insert_patient_data(patient: Patient):

    print(patient.name)
    print(patient.age)
    print('Inserted')

def update_patient_data(patient: Patient):

    print(patient.name)
    print(patient.age)
    print(patient.married)
    print(patient.allergies)
    print('Updated')

patient_info={'name':'Smita', 'age':32, 'weight': 68.45, 'married': True, 
              'allergies':['dust', 'beans'], 'contact_details':{'email':'smitadshinde007@gmail.com', 'phone':'123456789'}}


patient1= Patient(**patient_info)

update_patient_data(patient1)