class Patient < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
end
