require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'methods' do

    it "#unique_universities" do
      hospital_1 = Hospital.create!(name: "St Francis Hospital")
      doctor_1 = hospital_1.doctors.create!(name: "Freddy", specialty: "family practice", university: "University of Colorado Fort Collins")
      doctor_2 = hospital_1.doctors.create!(name: "Franko", specialty: "family practice", university: "University of Colorado Fort Collins")
      doctor_3 = hospital_1.doctors.create!(name: "Fiona", specialty: "family practice", university: "Northwestern University")
      hospital_2 = Hospital.create!(name: "Hunter Medical")
      doctor_4 = hospital_2.doctors.create!(name: "Guilaine", specialty: "physical therapy", university: "University of Vermont")

      actual = hospital_1.unique_universities
      expect(actual.include?(@doctor_1.university)).to eq(true)
      expect(actual.include?(@doctor_3.university)).to eq(true)
      expect(actual.count("University of colorado Fort Collins")).to eq(1)
      expect(actual.include?(@doctor_4.university)).to eq(false)
      
    end

  end
end
