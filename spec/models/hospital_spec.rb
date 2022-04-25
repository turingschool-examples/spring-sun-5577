require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    describe '.unique_doctor_universities' do
      it "returns a distinct list of the universities where the hospitals doctors studied" do
        hospital_1 = Hospital.create!(name: "Denver Hospital")
        hospital_2 = Hospital.create!(name: "DC Hospital")
        doctor_1 = hospital_1.doctors.create!(name: "Something Kennedy", specialty: "Cancer", university: "VCU")
        doctor_2 = hospital_1.doctors.create!(name: "Bill Notadoctor", specialty: "Gastrointestinal", university: "NYU")
        doctor_3 = hospital_1.doctors.create!(name: "Brian Definitelynotadoctor", specialty: "Sports injuries", university: "Johns Hopkins")
        doctor_4 = hospital_1.doctors.create!(name: "Dr. Strangelove", specialty: "Nuclear Winter", university: "Johns Hopkins")
        doctor_5 = hospital_1.doctors.create!(name: "Dr. Evil", specialty: "Evil", university: "VCU")
        doctor_5 = hospital_2.doctors.create!(name: "Another Doctor", specialty: "Doctoring", university: "Harvard")
        doctor_5 = hospital_2.doctors.create!(name: "YetAnother Doctor", specialty: "More specific doctoring", university: "Yale")

        expect(hospital_1.unique_doctor_universities).to eq(["VCU", "NYU", "Johns Hopkins"])
      end
    end
  end
end
