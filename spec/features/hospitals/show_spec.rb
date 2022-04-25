require 'rails_helper'

RSpec.describe "Hospital show page" do
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

    visit "/hospital/#{@hospital1.id}"
  end

  describe 'User story 2' do
    it 'lists hospitals attributes' do
      within("#hospital") do
        expect(page).to have_content(@hospital1.name)

        expect(page).to_not have_content(@hospital2.name)
      end
    end
    it 'lists hospitals doctors' do
      within("#doctors") do
        expect(page).to have_content(@hospital1.doctor_count)
      end
    end
    it 'lists unique hospital universities' do
      within("#universities") do
        expect(page).to have_content(@doctor1.university)
        expect(page).to have_content(@doctor2.university)
        expect(page).to have_content(@doctor3.university)

        expect(page).to_not have_content(@doctor4.university)
      end
    end
  end
end
