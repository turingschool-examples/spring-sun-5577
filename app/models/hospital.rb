class Hospital < ApplicationRecord
  has_many :doctors


  def schools 
    doctors.select(:university).distinct
  end
end
