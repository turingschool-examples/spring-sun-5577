class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  def universities
    doctors.pluck(:university).uniq
  end
end
