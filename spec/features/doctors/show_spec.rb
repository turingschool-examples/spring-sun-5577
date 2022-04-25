require 'rails_helper'

RSpec.describe 'the doctor show page', type: :feature do
  before do
    hospital_1 = Hospital.create!(name: "General Hospital")
    doctor_1 = hospital_1.doctors.create!(name: "Garth Marengi", specialty: "Emergency Medicine", university: "Darkplace University")
    doctor_2 = hospital_1.doctors.create!(name: "Steve Stone", specialty: "Pediatric Medicine", university: "Medex Washington")
    patient_1 = Patient.create!(name: "Alex", age: 38)
    patient_2 = Patient.create!(name: "Bob", age: 28)
    patient_3 = Patient.create!(name: "Chuck", age: 18)
    patient_4 = Patient.create!(name: "Monica", age: 40)
    patient_5 = Patient.create!(name: "Jessica", age: 32)
    doc_pat_1 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)
    doc_pat_2 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_2.id)
    doc_pat_3 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_3.id)
    doc_pat_4 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_4.id)
    doc_pat_5 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_5.id)


    visit doctor_path(doctor_1)
  end

  it 'I see all of that doctors information and the name of the hospital where this doctor works and all of the names of the patients this doctor has' do
    expect(page).to have_content("Garth Marengi")
    expect(page).to_not have_content("Steve Stone")

    expect(page).to have_content("Emergency Medicine")
    expect(page).to have_content("Darkplace University")
    expect(page).to have_content("General Hospital")

    within("#patients") do
      expect(page).to have_content("Alex")
      expect(page).to have_content("Bob")
      expect(page).to have_content("Chuck")
      expect(page).to have_content("Monica")
      expect(page).to have_content("Jessica")
      expect(page).to_not have_content("This doctor has no patients")
    end
  end


end
