class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_count
    doctors.length
  end

  def universities
    doctors.group(:university).pluck(:university)
  end
end
