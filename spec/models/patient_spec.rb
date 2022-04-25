require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'class methods' do
    it '.age_order' do
      kimmy = Patient.create!(name: "Kimmy", age: 14)
      frank = Patient.create!(name: "Frank", age: 45)
      nick = Patient.create!(name: "Nick", age: 8)
      amy = Patient.create!(name: "Amy", age: 43)
      subia = Patient.create!(name: "Subia", age: 34)
      joe = Patient.create!(name: "Joe", age: 52)

      expect(Patient.age_order).to eq([joe, frank, amy, subia, kimmy, nick])
    end
  end
end
