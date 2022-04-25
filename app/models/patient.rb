class Patient < ApplicationRecord
  has_many :doctors_patients
  has_many :doctors, through: :doctors_patients

  def self.sort_all_by_age
    order(age: :desc)
  end
end