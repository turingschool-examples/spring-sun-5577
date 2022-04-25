require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
  end

  describe 'class methods' do
    it '.unique_universities' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      alex = hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Iowa State")
      yang = hospital.doctors.create!(name: "Christina Yang", specialty: "Cardio", university: "Colombia")
      avery = hospital.doctors.create!(name: "Jackson Avery", specialty: "Plastics", university: "Stanford University")
      april = hospital.doctors.create!(name: "April Kepner", specialty: "Trauma", university: "Boston University")

      hospital2 = Hospital.create!(name: "Mercy West")
      doctor = hospital2.doctors.create!(name: "Unimportant", specialty: "Neuro", university: "Harvard")

      expect(Doctor.unique_universities).to eq(["Stanford University", "Iowa State", "Colombia", "Boston University", "Harvard"])
      expect(hospital.doctors.unique_universities).to eq(["Stanford University", "Iowa State", "Colombia", "Boston University"])
    end
  end
end
