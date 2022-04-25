class Patient < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.age_order
    order(age: :desc)
  end
end
