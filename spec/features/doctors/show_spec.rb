require 'rails_helper'

RSpec.describe 'doctors show page' do
  describe 'as a user' do
    describe 'when i visit a doctors show page' do
      before :each do
        @hospital_1 = Hospital.create!(name: "Denver Hospital")
        @hospital_2 = Hospital.create!(name: "DC Hospital")
        @doctor_1 = @hospital_1.doctors.create!(name: "Something Kennedy", specialty: "Cancer", university: "VCU")
        @doctor_2 = @hospital_1.doctors.create!(name: "Bill Notadoctor", specialty: "Gastrointestinal", university: "NYU")
        @doctor_3 = @hospital_2.doctors.create!(name: "Brian Definitelynotadoctor", specialty: "Sports injuries", university: "Johns Hopkins")
        @patient_1 = @doctor_1.patients.create!(name: "Junior Soprano", age: 68)
        @patient_2 = @doctor_1.patients.create!(name: "Janice Soprano", age: 43)
        @patient_3 = @doctor_1.patients.create!(name: "Lyvia Soprano", age: 65)
        @patient_4 = @doctor_2.patients.create!(name: "Mikey Palmice", age: 34)
        @patient_5 = @doctor_3.patients.create!(name: "Ralphie Cifaretto", age: 39)

        visit "/doctors/#{@doctor_1.id}"
      end

      it 'i see all of that doctors information including name, specialty, university' do
        expect(page).to have_content("Something Kennedy")
        expect(page).to have_content("Cancer")
        expect(page).to have_content("VCU")
        expect(page).not_to have_content("Bill Notadoctor")
        expect(page).not_to have_content("Gastrointestinal")
        expect(page).not_to have_content("NYU")
        expect(page).not_to have_content("Brian Definitelynotadoctor")
        expect(page).not_to have_content("Sports injuries")
        expect(page).not_to have_content("Johns Hopkins")
      end

      it 'and i see the name of the hospital where the doctor works' do
        expect(page).to have_content("Hospital: Denver Hospital")
        expect(page).not_to have_content("Hospital: DC Hospital")
      end

      it 'and i see the names of all the patients this doctor has' do
        expect(page).to have_content("Junior Soprano")
        expect(page).to have_content("Janice Soprano")
        expect(page).to have_content("Lyvia Soprano")
        expect(page).not_to have_content("Mikey Palmice")
        expect(page).not_to have_content("Ralphie Cifaretto")
      end

      it 'next to each patients name, i see a button to remove that patient from the doctors caseload' do
        within "#patient-#{@patient_1.id}" do
          expect(page).to have_button("Remove this Patient from Caseload")
        end

        within "#patient-#{@patient_2.id}" do
          expect(page).to have_button("Remove this Patient from Caseload")
        end

        within "#patient-#{@patient_3.id}" do
          expect(page).to have_button("Remove this Patient from Caseload")
        end
      end

      it 'when i click the button for one patient, i am brought back to the same doctors show page and that patient is no longer listed' do
        within "#patient-#{@patient_2.id}" do
          click_button("Remove this Patient from Caseload")
        end

        expect(current_path).to eq("/doctors/#{@doctor_1.id}")
        expect(page).to have_content("Junior Soprano")
        expect(page).not_to have_content("Janice Soprano")
        expect(page).to have_content("Lyvia Soprano")
        expect(page).not_to have_content("Mikey Palmice")
        expect(page).not_to have_content("Ralphie Cifaretto")
      end
    end
  end
end
