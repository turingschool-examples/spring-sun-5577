class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.age_before_beauty
    order(age: :desc)
  end
end
