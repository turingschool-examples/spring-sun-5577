class Hospital < ApplicationRecord
  has_many :doctors

  def unique_doctor_universities
    # doctors.select(:university).distinct
    doctors.pluck(:university).uniq
  end

  def doctor_count
    doctors.count
  end
end
