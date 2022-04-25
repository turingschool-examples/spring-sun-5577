class Hospital < ApplicationRecord
  has_many :doctors

  def list_of_uni
    doctors.select(:university).distinct
  end
end
