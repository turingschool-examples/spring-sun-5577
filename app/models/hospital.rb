class Hospital < ApplicationRecord
  has_many :doctors


  def unique_universities
    doctors.order(:university)
           .select(:university)
           .group(:university)
           .pluck(:university)
  end
  
end
