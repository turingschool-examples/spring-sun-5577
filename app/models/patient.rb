class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  #def find_me(this_doctor)
  #  DoctorPatient.where(doctor_id: this_doctor.id, patient_id: self.id).first.id
  #end
end
