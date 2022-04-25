class Hospital < ApplicationRecord
  has_many :doctors

  def unique_doctor_universities
    doctors.pluck(:university).uniq
  end
end
