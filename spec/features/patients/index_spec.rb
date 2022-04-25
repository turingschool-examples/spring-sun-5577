require 'rails_helper'

RSpec.describe "Patient index page" do
  before :each do
    @hospital1 = Hospital.create!(name: "Animal Hospital")
    @hospital2 = Hospital.create!(name: "Greys Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Pabu", specialty: "Chemistry", university: "Stanford")
    @doctor2 = @hospital2.doctors.create!(name: "Loki", specialty: "Biology", university: "Harvard")

    @patient1 = Patient.create!(name: "Thor", age: "21")
    @patient2 = Patient.create!(name: "Apollo", age: "18")
    @patient3 = Patient.create!(name: "Ian", age: "19")
    @patient4 = Patient.create!(name: "Pabu", age: "30")

    @joins1 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    @joins2 = DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    @joins3 = DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient3.id)

    visit "/patients"
  end

  describe 'Extenstion' do
    it 'lists all patients oldest to youngest' do
      within("#patients") do
        expect(page).to have_content(@patient1.name)
        expect(page).to have_content(@patient2.name)
        expect(page).to have_content(@patient3.name)
        expect(page).to have_content(@patient4.name)

        expect("Pabu").to appear_before("Thor")
        expect("Thor").to appear_before("Ian")
        expect("Ian").to appear_before("Apollo")
      end
    end
  end
end
