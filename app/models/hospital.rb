class Hospital < ApplicationRecord
  has_many :doctors

  def doc_count
    doctors.count
  end

  def doc_unis
    doctors.pluck(:university).uniq
  end
end
