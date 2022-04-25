require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients)}
  end

  describe 'instance methods' do
    it '#hospital' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
      expect(bailey.hospital_name).to eq("Grey Sloan Memorial Hospital")
    end
    it '#active_patients' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    patient1 = bailey.patients.create!(name:"Drew", age:27)
    patient2 = bailey.patients.create!(name:"Daver", age:37, status:1)
    patient3 = bailey.patients.create!(name:"Patty", age:69)
      expect(bailey.active_patients).to eq([patient1,patient3])
    end
  end
end
