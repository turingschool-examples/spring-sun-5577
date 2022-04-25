class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    Doctor.where(hospital_id: id).count
  end

  def list_doctor_universities
    Doctor.where(hospital_id: id).distinct.pluck(:university)
  end
end
