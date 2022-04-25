require 'rails_helper'

RSpec.describe "patients index page" do
  it "all patients from oldest to youngest" do
    #two doctors at different hospitals with different patients
    hospital_1 = Hospital.create!(name: "Rose Medical")
    hospital_2 = Hospital.create!(name: "Fake Hospital")
    doc_1 = hospital_1.doctors.create!(name: "Dr. Speth", specialty: "Optometry", university: "SCCO")
    doc_2 = hospital_2.doctors.create!(name: "Dr. Dog", specialty: "Music", university: "The Streets")
    patient_4 = doc_2.patients.create!(name: "Guitar Player", age: 100)
    patient_2 = doc_1.patients.create!(name: "Glaucoma Patient", age: 40)
    patient_1 = doc_1.patients.create!(name: "Retina Patient", age: 70)
    patient_3 = doc_2.patients.create!(name: "Bass Player", age: 50)

    visit "/patients"

    expect(page).to have_content("Retina Patient")
    expect(page).to have_content("Glaucoma Patient")
    expect(page).to have_content("Bass Player")
    expect(page).to have_content("Guitar Player")

    expect("Guitar Player").to appear_before("Retina Patient")
    expect("Retina Patient").to appear_before("Bass Player")
    expect("Bass Player").to appear_before("Glaucoma Patient")
  end

  it "all patients from oldest to youngest" do
    #two doctors at different hospitals with overlapping patients
    hospital_1 = Hospital.create!(name: "Rose Medical")
    hospital_2 = Hospital.create!(name: "Fake Hospital")
    doc_1 = hospital_1.doctors.create!(name: "Dr. Speth", specialty: "Optometry", university: "SCCO")
    doc_2 = hospital_2.doctors.create!(name: "Dr. Dog", specialty: "Music", university: "The Streets")
    patient_4 = doc_2.patients.create!(name: "Guitar Player", age: 100)
    patient_2 = doc_1.patients.create!(name: "Glaucoma Patient", age: 40)
    patient_1 = doc_1.patients.create!(name: "Retina Patient", age: 70)
    patient_3 = doc_2.patients.create!(name: "Bass Player", age: 50)
    doc_patient_1 = DoctorPatient.create!(doctor_id: doc_1.id, patient_id: patient_4.id)
    doc_patient_2 = DoctorPatient.create!(doctor_id: doc_2.id, patient_id: patient_2.id)

    visit "/patients"

    expect(page).to have_content("Retina Patient")
    expect(page).to have_content("Glaucoma Patient")
    expect(page).to have_content("Bass Player")
    expect(page).to have_content("Guitar Player")

    expect("Guitar Player").to appear_before("Retina Patient")
    expect("Retina Patient").to appear_before("Bass Player")
    expect("Bass Player").to appear_before("Glaucoma Patient")
  end
end