require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do 
    it 'returns unique list of schools' do 
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      bethany = hospital.doctors.create!(name: "Bethany", specialty: "General Surgery", university: "Stanford University")
      frank = hospital.doctors.create!(name: "Frank", specialty: "Nurse", university: "Sydney School")
       binding.pry
      expect(hospital.schools.count).to eq(2)
    end
  end
end
