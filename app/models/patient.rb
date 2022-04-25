class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.oldest_first
    Patient.order(age: :desc) 
  end
end
