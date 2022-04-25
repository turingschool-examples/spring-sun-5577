class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.distinct(:university)
           .pluck(:university)
  end
end
