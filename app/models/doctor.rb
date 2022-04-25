class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def hospital_name
    hospital.name
  end

  def active_patients
    patients.where(status: 0)
  end
end
