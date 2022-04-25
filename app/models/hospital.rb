class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.map { |doctor| doctor.university}.uniq
  end
    

end
