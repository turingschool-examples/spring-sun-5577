require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end
  describe 'instance methods' do
    it '#doctors_count' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
      ploppy= hospital.doctors.create!(name: "Ploppy Gutcutter", specialty: "Gore", university: "Power Butcher University")
      duke = hospital.doctors.create!(name: "Duke Gutcutter", specialty: "Gore", university: "Oregon State University")
      expect(hospital.doctors_count).to eq(4)
    end
    it '#universities' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
      ploppy= hospital.doctors.create!(name: "Ploppy Gutcutter", specialty: "Gore", university: "Power Butcher University")
      duke = hospital.doctors.create!(name: "Duke Gutcutter", specialty: "Gore", university: "Oregon State University")
      expect(hospital.universities).to eq(["Oregon State University", "Power Butcher University", "Stanford University"])
    end
  end

end
