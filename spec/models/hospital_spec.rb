require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    before :each do
      @hospital1 = Hospital.create!(name: "Animal Hospital")
      @hospital2 = Hospital.create!(name: "Greys Hospital")

      @doctor1 = @hospital1.doctors.create!(name: "Pabu", specialty: "Chemistry", university: "Stanford")
      @doctor2 = @hospital1.doctors.create!(name: "Ian", specialty: "Surgery", university: "Stanford")
      @doctor3 = @hospital1.doctors.create!(name: "Alex", specialty: "Genetics", university: "Boulder")
      @doctor4 = @hospital2.doctors.create!(name: "Loki", specialty: "Biology", university: "CSU")

      @patient1 = Patient.create!(name: "Thor", age: "21")
      @patient2 = Patient.create!(name: "Apollo", age: "18")

      @joins1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
      @joins2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    end

    it 'lists amount of doctors' do
      expect(@hospital1.doctor_count).to eq(3)
    end

    it 'lists unique universities for hospitals doctors' do
      expect(@hospital1.unique_uni).to eq(["Boulder", "Stanford"])
    end
  end
end
