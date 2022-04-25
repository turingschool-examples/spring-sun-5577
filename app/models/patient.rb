class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  validates :name, presence: true
  validates :age, presence: true

  def self.old_to_young
    all.order(age: :desc)
  end
end
