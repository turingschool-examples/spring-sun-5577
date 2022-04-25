class Hospital < ApplicationRecord
  has_many :doctors

  def unique_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end
