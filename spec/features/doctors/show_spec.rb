require 'rails_helper'

RSpec.describe 'doctors show page' do
  it 'displays a doctors information' do
    hosp_1 = Hospital.create!(name: 'City Health')
    hosp_2 = Hospital.create!(name: 'County Medical')
    doc_1 = hosp_1.doctors.create(name: 'Jim Pfeiffer', specialty: 'Pediatrics', university: 'Vanderbilt')
    doc_2 = hosp_1.doctors.create(name: 'Ted Leftwich', specialty: 'Proctology', university: 'Emory')
    doc_3 = hosp_2.doctors.create(name: 'Brian Grimes', specialty: 'Sports Medicine', university: 'University of Tennessee')
    pat_1 = Patient.create!(name: 'Justin Hill', age: 39)
    pat_2 = Patient.create!(name: 'Mark Gainey', age: 46)
    pat_3 = Patient.create!(name: 'Liz Hagler', age: 35)
    PatientDoctor.create!(doctor_id: doc_1.id, patient_id: pat_1.id)
    PatientDoctor.create!(doctor_id: doc_1.id, patient_id: pat_2.id)
    PatientDoctor.create!(doctor_id: doc_2.id, patient_id: pat_3.id)

    visit "hospitals/doctors/#{doc_1.id}"

    expect(page).to have_content('Jim Pfeiffer')
    expect(page).to have_content('Pediatrics')
    expect(page).to have_content('Vanderbilt')
    expect(page).to have_content('City Health')
    expect(page).to have_content('Justin Hill')
    expect(page).to have_content('Mark Gainey')
    expect(page).to have_no_content('Ted Leftwich')
    expect(page).to have_no_content('Brian Grimes')
    expect(page).to have_no_content('County Medical')
    expect(page).to have_no_content('Liz Hagler')
    expect(page).to have_no_content('Proctology')
    expect(page).to have_no_content('Sports Medicine')
    expect(page).to have_no_content('35')
  end

  it 'has a button to remove a patient' do
    hosp_1 = Hospital.create!(name: 'City Health')
    doc_1 = hosp_1.doctors.create(name: 'Jim Pfeiffer', specialty: 'Pediatrics', university: 'Vanderbilt')
    doc_2 = hosp_1.doctors.create(name: 'Ted Leftwich', specialty: 'Proctology', university: 'Emory')
    pat_1 = Patient.create!(name: 'Justin Hill', age: 39)
    pat_2 = Patient.create!(name: 'Mark Gainey', age: 46)
    pat_3 = Patient.create!(name: 'Liz Hagler', age: 35)
    PatientDoctor.create!(doctor_id: doc_1.id, patient_id: pat_1.id)
    PatientDoctor.create!(doctor_id: doc_1.id, patient_id: pat_2.id)
    PatientDoctor.create!(doctor_id: doc_1.id, patient_id: pat_3.id)

    visit "hospitals/doctors/#{doc_1.id}"
    expect(page).to have_content('Justin Hill')
    expect(page).to have_content('Mark Gainey')
    expect(page).to have_content('Liz Hagler')

    click_button "Remove Justin Hill"
    expect(current_path).to eq("hospitals/doctors/#{doc_1.id}")

    expect(page).to have_no_content('Justin Hill')
    expect(page).to have_content('Mark Gainey')
    expect(page).to have_content('Liz Hagler')
  end
end
