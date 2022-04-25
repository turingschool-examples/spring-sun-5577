class Doctor < ApplicationRecord

  has_many :patient_doctors
  has_many :patients, through: :patient_doctors
  belongs_to :hospital

end
