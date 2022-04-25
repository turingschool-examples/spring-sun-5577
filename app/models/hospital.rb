class Hospital < ApplicationRecord
  has_many :doctors

  validates_presence_of :name

  def distinct_universitys
    doctors.university.distinct
  end
end
