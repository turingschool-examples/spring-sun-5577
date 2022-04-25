require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end
  before :each do
    @hospital = Hospital.create!(name: "St. Hospital")
    @doctor = Doctor.create!(name: "Doc Holiday", specialty: "ENT", university: "UC", hospital: @hospital)
    @patient1 = Patient.create!(name:"Jim", age: 18)
    @patient2 = Patient.create!(name:"Tim", age: 20)
    @doctorpatient1 = DoctorPatient.create!(doctor: @doctor, patient: @patient1)
    @doctorpatient2 = DoctorPatient.create!(doctor: @doctor, patient: @patient2)
    @doctor4 = Doctor.create!(name: "Another Doc", specialty: "ENT", university: "UC", hospital: @hospital)


    @patient3 = Patient.create!(name:"Pam", age: 22)
    @doctor2 = Doctor.create!(name: "Bad Doc", specialty: "ENT", university: "Illinois", hospital: @hospital)
    @doctorpatient3 = DoctorPatient.create!(doctor: @doctor2, patient: @patient3)

    @hospital2 = Hospital.create!(name: "Bad Hospital")
    @patient4 = Patient.create!(name:"Pam", age: 22)
    @doctor3 = Doctor.create!(name: "Bad Doc", specialty: "ENT", university: "DeVry", hospital: @hospital2)
    @doctorpatient4 = DoctorPatient.create!(doctor: @doctor3, patient: @patient4)

  end
  describe 'methods' do

    it 'returns number of doctors' do
      expect(@hospital.number_of_doctors).to eq(3)
    end

    it 'returns unique universities' do
      expect(@hospital.list_doctor_universities.count).to eq(2)
    end
  end
end
