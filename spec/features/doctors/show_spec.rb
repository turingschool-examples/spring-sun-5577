require 'rails_helper'

RSpec.describe 'doctor show page' do
  # User Story 1, Doctors Show Page
  # As a visitor
  # When I visit a doctor's show page
  # I see all of that doctor's information including:
  #  - name
  #  - specialty
  #  - university where they got their doctorate
  # And I see the name of the hospital where this doctor works
  # And I see the names of all of the patients this doctor has
  it 'displays all of the doctor information' do
    hospital = Hospital.create!(name: 'UC Denver')
    hospital_2 = Hospital.create!(name: 'SLC')
    doctor_1 = hospital.doctors.create!(name: 'Chris', specialty: 'ER', university: 'UT')
    doctor_2 = hospital_2.doctors.create!(name: 'Sophie', specialty: 'PCP', university: 'Harvard')
    patient_1 = doctor_1.patients.create!(name: 'John', age: 30)
    patient_2 = doctor_1.patients.create!(name: 'Mary', age: 25)
    patient_3 = doctor_1.patients.create!(name: 'Dave', age: 60)
    visit "doctor/#{doctor_1.id}"

    expect(page).to have_content('Chris')
    expect(page).to have_content('ER')
    expect(page).to have_content('UT')
    expect(page).to have_content('UC Denver')

    expect(page).to_not have_content('Sophie')
    expect(page).to_not have_content('PCP')
    expect(page).to_not have_content('Harvard')
    expect(page).to_not have_content('SLC')

  end
end
