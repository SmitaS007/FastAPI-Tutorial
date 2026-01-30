from pydantic import BaseModel, EmailStr, AnyUrl, Field
from typing import List, Dict, Optional, Annotated

class Patient(BaseModel):

    name: Annotated[str, Field(max_length= 50, title= "Name of the patient",
                               description='Give the name of a patient in less that 50 ch',
                               examples=['Smita', 'Snehal'])]
    #email: EmailStr
    #linkedin_url: AnyUrl
    age: int = Field(gt=0, lt=120)
    weight: float = Field(gt=0)
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