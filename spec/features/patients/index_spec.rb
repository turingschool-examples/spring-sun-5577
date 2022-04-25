require 'rails_helper'

RSpec.describe 'the patient index page' do
  it 'I see the names of all patients listed from oldest to youngest' do
    hospital_1 = Hospital.create!(name: "General Hospital")
    doctor_1 = hospital_1.doctors.create!(name: "Garth Marengi", specialty: "Emergency Medicine", university: "Darkplace University")
    doctor_2 = hospital_1.doctors.create!(name: "Steve Stone", specialty: "Pediatric Medicine", university: "Medex Washington")
    patient_3 = Patient.create!(name: "Chuck", age: 18)
    patient_2 = Patient.create!(name: "Bob", age: 28)
    patient_1 = Patient.create!(name: "Alex", age: 38)
    patient_4 = Patient.create!(name: "Monica", age: 40)
    patient_5 = Patient.create!(name: "Jessica", age: 52)
    patient_6 = Patient.create!(name: "Seymour", age: 59)
    patient_7 = Patient.create!(name: "Rick", age: 79)
    patient_8 = Patient.create!(name: "Sal", age: 89)
    doc_pat_1 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_1.id)
    doc_pat_2 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_2.id)
    doc_pat_3 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_3.id)
    doc_pat_4 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_4.id)
    doc_pat_5 = DoctorPatient.create!(doctor_id: doctor_1.id, patient_id: patient_5.id)
    doc_pat_6 = DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_6.id)
    doc_pat_7 = DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_7.id)
    doc_pat_8 = DoctorPatient.create!(doctor_id: doctor_2.id, patient_id: patient_8.id)

    visit patients_path

    # expect(patient_8.name).to appear_before(patient_7.name)
    # expect(patient_7.name).to appear_before(patient_6.name)
    # expect(patient_6.name).to appear_before(patient_5.name)
    # expect(patient_5.name).to appear_before(patient_4.name)
    # expect(patient_4.name).to appear_before(patient_1.name)
    # expect(patient_1.name).to appear_before(patient_2.name)
    # expect(patient_2.name).to appear_before(patient_3.name)
    expect(page.text.index(patient_8.name)).to be < (page.text.index(patient_7.name))
    expect(page.text.index(patient_7.name)).to be < (page.text.index(patient_6.name))
    expect(page.text.index(patient_6.name)).to be < (page.text.index(patient_5.name))
    expect(page.text.index(patient_5.name)).to be < (page.text.index(patient_4.name))
    expect(page.text.index(patient_4.name)).to be < (page.text.index(patient_1.name))
    expect(page.text.index(patient_1.name)).to be < (page.text.index(patient_2.name))
    expect(page.text.index(patient_1.name)).to be < (page.text.index(patient_3.name))

  end
end
