class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def this_doctor_patient(doctor)
    doctor_patients
    .where("doctor_id = #{doctor.id}")
    .first
  end

  def self.sort_by_age
    order("age DESC")
  end
end
