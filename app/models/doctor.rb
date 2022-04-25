class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def remove_patient(name)
    patients.map do |patient|
      if patient.name == name
        patient.doctor_patients.first.destroy
      end
    end.compact
  end
end
