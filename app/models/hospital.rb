class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.map do |doctor|
      doctor.university
    end.uniq
  end
end
