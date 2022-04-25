class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :patients
end
