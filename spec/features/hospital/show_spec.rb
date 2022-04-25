require 'rails_helper'

RSpec.describe 'Hospital Show page' do 
    it 'has the name of the Hospital' do 
        hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
        bethany = hospital.doctors.create!(name: "Bethany", specialty: "General Surgery", university: "Stanford University")
        frank = hospital.doctors.create!(name: "Frank", specialty: "Nurse", university: "Sydney School")
        patient1 = Patient.create!(name: "Becky", age: 17)
        patient2 = Patient.create!(name: "Bruce", age: 32)
        patient3 = Patient.create!(name: "Rod", age: 43)
        patient4 = Patient.create!(name: "Rick", age: 25)
        PatientDoctor.create!(patient_id: patient1.id, doctor_id: bailey.id)
        PatientDoctor.create!(patient_id: patient2.id, doctor_id: bailey.id)
        PatientDoctor.create!(patient_id: patient3.id, doctor_id: bailey.id)
        visit "/hospitals/#{hospital.id}"

        expect(page).to have_content("Grey Sloan Memorial Hospital")
    end
end