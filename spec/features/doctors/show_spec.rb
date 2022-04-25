require 'rails_helper'

RSpec.describe 'the doctor show page', type: :feature do
  before do
    hospital_1 = Hospital.create!(name: "General Hospital")
    doctor_1 = hospital_1.doctors.create!(name: "Garth Marengi", specialty: "Emergency Medicine", university: "Darkplace University")
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

    visit "/doctors/#{doctor_1.id}"
    # require 'pry'; binding.pry
    # visit doctors_path(doctor1)
  end

  it 'I see all of that doctors information and the name of the hospital where this doctor works and all of the names of the patients this doctor has' do
    expect(page).to have_content("Garth Marengi")
    expect(page).to have_content("Emergency Medicine")
    expect(page).to have_content("Darkplace University")
    expect(page).to have_content("General Hospital")

    within("#patients") do
      expect(page).to have_content("Alex")
      expect(page).to have_content("Bob")
      expect(page).to have_content("Chuck")
      expect(page).to have_content("Monica")
      expect(page).to have_content("Jessica")
    end
  end

  it 'next to each patients name is a button to remove that patient, when I click that button for one patient I am brought back to the doctors show page and I no longer see that patients name listed' do
    within("#patients") do
      expect(page).to have_button("Remove Alex")
      click_button("Remove Alex")
      expect(current_path).to eq("/doctors/#{doctor_1.id}")
      expect(page).to_not have_content("Alex")
  end
end
