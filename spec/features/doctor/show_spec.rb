require 'rails_helper'

RSpec.describe "Doctor show page" do 
    it 'displays doctors info' do 
        hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
        visit "/doctors/#{bailey.id}"
        expect(page).to have_content("Bailey")
        expect(page).to have_content("Surgery")
        expect(page).to have_content("Stanford")
    end

    it 'displays hospital' do 
        hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        hospital2 = Hospital.create!(name: "The other hospital")
        bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
        visit "/doctors/#{bailey.id}"
        within("#hospital")do 
            expect(page).to have_content('Grey Sloan')
            expect(page).to_not have_content('other')
        end
    end

    it 'displays the names of the patients' do 
        hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
        patient1 = Patient.create!(name: "Becky", age: 17)
        patient2 = Patient.create!(name: "Bruce", age: 32)
        patient3 = Patient.create!(name: "Rod", age: 43)
        patient4 = Patient.create!(name: "Rick", age: 25)
        PatientDoctor.create!(patient_id: patient1.id, doctor_id: bailey.id)
        PatientDoctor.create!(patient_id: patient2.id, doctor_id: bailey.id)
        PatientDoctor.create!(patient_id: patient3.id, doctor_id: bailey.id)
        visit "/doctors/#{bailey.id}"
        within("#patients") do 
            expect(page).to have_content("Becky")
            expect(page).to have_content("Bruce")
            expect(page).to have_content("Rod")
            expect(page).to_not have_content("Rick")
        end

    end
end