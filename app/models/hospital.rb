class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.distinct.pluck(:university)
  end
end
