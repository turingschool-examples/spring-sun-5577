class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :specialty,  presence: true
  validates :university,  presence: true

  belongs_to :hospital

  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
end
