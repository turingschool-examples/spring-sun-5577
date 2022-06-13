class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.alphabetical
    order(:name)
  end
end
