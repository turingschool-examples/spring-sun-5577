require 'rails_helper'

RSpec.describe "Hospital show page" do
  before :each do
    @hospital1 = Hospital.create!(name: "Animal Hospital")
    @hospital2 = Hospital.create!(name: "Greys Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Pabu", specialty: "Chemistry", university: "Stanford")
    @doctor2 = @hospital2.doctors.create!(name: "Loki", specialty: "Biology", university: "Stanford")

    @patient1 = Patient.create!(name: "Thor", age: "21")
    @patient2 = Patient.create!(name: "Apollo", age: "18")
    @patient3 = Patient.create!(name: "Ian", age: "18")

    @joins1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @joins2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    @joins3 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient3.id)

    visit "/hospital/#{@hospital1.id}"
  end

  describe 'User story 2' do
    xit 'lists hospitals attributes' do
      within("#hospital") do

      end
    end
  end
end
