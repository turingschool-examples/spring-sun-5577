class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_unis
    doctors
    .select(:university)
    .distinct
  end
end
