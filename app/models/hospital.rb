class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors
     .pluck('university')
     .uniq
  end
end
