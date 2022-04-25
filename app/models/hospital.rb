class Hospital < ApplicationRecord
  has_many :doctors

  validates_presence_of :name

  def alma_mater
    self.doctors.map do |doctor|
      doctor.university
    end.uniq
  end
end
