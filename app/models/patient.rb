class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.oldest_to_youngest
    order(age: :desc)
  end 
end 