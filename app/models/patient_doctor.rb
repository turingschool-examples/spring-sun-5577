class PatientDoctor < ApplicationRecord
  has_many :patients
  has_many :doctors
end