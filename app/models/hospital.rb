class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.select(:university).distinct.pluck(:university)
  end

  def doctor_count
    Doctor.where(hospital_id: self.id).count
  end
end
