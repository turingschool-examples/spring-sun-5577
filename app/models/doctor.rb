class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  # 
  # def patient_list
  #   Doctor.select('patients.*').joins(:patient_doctor)
  #   # require "pry"; binding.pry
  # end
end
