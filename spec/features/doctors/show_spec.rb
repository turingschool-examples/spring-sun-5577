require 'rails_helper'

RSpec.describe 'doctor show page' do

  it 'displays all of the doctor information' do
    hospital = Hospital.create!(name: 'UC Denver')
    hospital_2 = Hospital.create!(name: 'SLC')
    doctor_1 = hospital.doctors.create!(name: 'Chris', specialty: 'ER', university: 'UT')
    doctor_2 = hospital_2.doctors.create!(name: 'Sophie', specialty: 'PCP', university: 'Harvard')
    patient_1 = doctor_1.patients.create!(name: 'John', age: 30)
    patient_2 = doctor_1.patients.create!(name: 'Mary', age: 25)
    patient_3 = doctor_1.patients.create!(name: 'Dave', age: 60)
    patient_4 = doctor_2.patients.create!(name: 'Dave', age: 60)

    visit "doctors/#{doctor_1.id}"

    expect(page).to have_content('Chris')
    expect(page).to have_content('ER')
    expect(page).to have_content('UT')
    expect(page).to have_content('UC Denver')
    expect(page).to have_content('John')
    expect(page).to have_content('Mary')
    expect(page).to have_content('Dave')

    expect(page).to_not have_content('Sophie')
    expect(page).to_not have_content('PCP')
    expect(page).to_not have_content('Harvard')
    expect(page).to_not have_content('SLC')
    expect(page).to_not have_content('James')
  end

  # ```
  # User Story 3, Remove a Patient from a Doctor
  # ​
  # As a visitor
  # When I visit a Doctor's show page
  # Next to each patient's name, I see a button to remove that patient from that doctor's caseload
  # When I click that button for one patient
  # I'm brought back to the Doctor's show page
  # And I no longer see that patient's name listed
  #
  # NOTE: the patient record should not be deleted entirely
  # ```
  it 'allows the user to remove a patient from a doctor' do
    hospital = Hospital.create!(name: 'UC Denver')
    hospital_2 = Hospital.create!(name: 'SLC')
    doctor_1 = hospital.doctors.create!(name: 'Chris', specialty: 'ER', university: 'UT')
    doctor_2 = hospital_2.doctors.create!(name: 'Sophie', specialty: 'PCP', university: 'Harvard')
    patient_1 = doctor_1.patients.create!(name: 'John', age: 30)
    patient_2 = doctor_1.patients.create!(name: 'Mary', age: 25)
    patient_3 = doctor_1.patients.create!(name: 'Dave', age: 60)

    visit "/doctors/#{doctor_1.id}"

    within "#patient-#{patient_1.id}" do
      click_link 'Remove Patient'
    end
    expect(current_path).to eq("/doctors/#{doctor_1.id}")
    expect(page).to_not have_content(patient_1.name)
    expect(patient_1.name).to eq('John')
    expect(doctor_1.patients.count).to eq(2)

    within "#patient-#{patient_2.id}" do
      click_link 'Remove Patient'
    end
    expect(current_path).to eq("/doctors/#{doctor_1.id}")
    expect(page).to_not have_content(patient_2.name)

    within "#patient-#{patient_3.id}" do
      click_link 'Remove Patient'
    end
    expect(current_path).to eq("/doctors/#{doctor_1.id}")
    expect(page).to_not have_content(patient_3.name)
  end
end
