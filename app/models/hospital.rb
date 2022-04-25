class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count(:doctors)
  end

  def unique_univs
    doctors.select(:university).distinct.pluck(:university)
  end
end
