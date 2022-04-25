require 'rails_helper'

RSpec.describe Hospital do

  before :each do
    @hospital1 = Hospital.create!(name: "St. Judes")
    @hospital2 = Hospital.create!(name: "Hospice")
    @doctor1 = @hospital1.doctors.create!(name: "Cory", specialty: "Bones", university: "Armstrong")
    @doctor2 = @hospital1.doctors.create!(name: "Sherman", specialty: "Skin", university: "Johnson")
    @doctor3 = @hospital1.doctors.create!(name: "Will", specialty: "Skin", university: "Johnson")
    @doctor4 = @hospital1.doctors.create!(name: "Chris", specialty: "Skin", university: "Johnson")
    @doctor5 = @hospital2.doctors.create!(name: "Kim", specialty: "Cancer", university: "Xing")
    @patient1 = Patient.create!(name: "Susan", age: 10)
    @patient2 = Patient.create!(name: "Ben", age: 11)
    @patient3 = Patient.create!(name: "Alice", age: 12)
    @patient4 = Patient.create!(name: "Brittany", age: 13)
    @patient5 = Patient.create!(name: "Janice", age: 14)
    @dp1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @dp2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
  end

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "instance methods" do
    it "gets the alma mater of all the doctors at the hospital" do

      expect(@hospital1.alma_mater).to eq(["Armstrong", "Johnson"])
    end


  end
end
