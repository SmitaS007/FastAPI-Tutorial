from pydantic import BaseModel

class Address(BaseModel):
    city: str
    state: str
    pin: str

class Patient(BaseModel):

    name: str
    gender: str
    age: int
    address: Address

address_dict = {'city': 'Pune', 'state': 'Maharashtra', 'pin': '411033'}
address1= Address(**address_dict)

patient_dict = {'name': 'Smita', 'gender': 'female', 'age': 35, 'address': address1}
patient1= Patient(**patient_dict)

print(patient1)