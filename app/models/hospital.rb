class Hospital < ApplicationRecord
  validates :name, presence: true

  has_many :doctors
  has_many :doctor_patients, through: :doctors
  #while it seems redundant it tossed me an error in my test when I removed the through association
  has_many :patients, through: :doctor_patients

  def unique_universities
    doctors.map { |doctor| doctor.university}.uniq
  end
end
