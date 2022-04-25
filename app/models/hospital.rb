class Hospital < ApplicationRecord
  has_many :doctors

  def university_list
    doctor_list = doctors.select(:university).distinct
    doctor_list.map {|doctor| doctor.university}
  end
end
