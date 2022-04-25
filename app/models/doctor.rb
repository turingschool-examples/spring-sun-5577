class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients, source: :patient

  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :university
end
