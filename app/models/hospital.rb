class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def doctors_uniq_universities
    doctors.pluck(:university).uniq
  end
end
