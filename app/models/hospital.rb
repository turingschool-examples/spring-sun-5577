class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def unique_uni
    doctors.distinct.pluck(:university)
  end
end
