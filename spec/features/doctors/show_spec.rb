require 'rails_helper'

RSpec.describe "Doctor show page" do
  before :each do
    @hospital1 = Hospital.create!(name: "Animal Hospital")
    @hospital2 = Hospital.create!(name: "Greys Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Pabu", specialty: "Chemistry", university: "Stanford")
    @doctor2 = @hospital2.doctors.create!(name: "Loki", specialty: "Biology", university: "Harvard")

    @patient1 = Patient.create!(name: "Thor", age: "21")
    @patient2 = Patient.create!(name: "Apollo", age: "18")
    @patient3 = Patient.create!(name: "Ian", age: "18")

    @joins1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @joins2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    @joins3 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient3.id)

    visit "/doctor/#{@doctor1.id}"
  end

  describe 'User story 1' do
    it 'lists doctors attributes' do
      within("#doctor") do
        expect(page).to have_content(@doctor1.name)
        expect(page).to have_content(@doctor1.specialty)
        expect(page).to have_content(@doctor1.university)

        expect(page).to_not have_content(@doctor2.name)
        expect(page).to_not have_content(@doctor2.specialty)
        expect(page).to_not have_content(@doctor2.university)
      end
    end
    it 'displays hospital name' do
      within("#hospital") do
        expect(page).to have_content(@hospital1.name)

        expect(page).to_not have_content(@hospital2.name)
      end
    end
    it 'displays patients name' do
      within("#patients") do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)

        expect(page).to_not have_content(@patient3.name)
      end
    end
  end
end
