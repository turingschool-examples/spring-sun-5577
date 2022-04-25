class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def self.unique_universities
    pluck(:university).uniq

    #wasn't sure if I should use the pluck or something more like
    # select(:university).distinct and then just call .university on it in the view, I was able to get both working but left it this way
  end
end
