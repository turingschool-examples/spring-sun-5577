require 'rails_helper'

RSpec.describe 'A doctors show page' do
  it 'has the name of the hospital the doctor works at' do
    anthonys = Hospital.create!(name: "St. Anthony's")
    d_health = Hospital.create!(name: "Denver Health")

    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')

    visit "/doctors/#{anthony.id}/"

    expect(page).to have_content("Works at: St. Anthony's")
    expect(page).to_not have_content("Works at: Denver Health")
  end

  it 'has all the information on the doctor' do
    anthonys = Hospital.create!(name: "St. Anthony's")
    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
    tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')

    visit "/doctors/#{anthony.id}"

    expect(page).to have_content('St. Anthony')
    expect(page).to have_content('Specialty: Doctoring')
    expect(page).to have_content("University: The Doctoring University")

    expect(page).to_not have_content('Regular Tony')
    expect(page).to_not have_content('Specialty: Foot Surgeon')
    expect(page).to_not have_content('University: HowtoCutAFoot.com')
  end

  it 'has names of all patients the doctor is treating' do
    anthonys = Hospital.create!(name: "St. Anthony's")

    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
    billy = anthony.patients.create!(name: 'Billy Jonson', age: 25)
    shane = anthony.patients.create!(name: 'Shane Jonson', age: 2)

    tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')
    harold = tony.patients.create!(name: 'Harold Hurtsfoot', age: 28)

    visit "/doctors/#{anthony.id}"

    within '#patients' do
      expect(page).to have_content('Billy Jonson')
      expect(page).to have_content('Shane Jonson')

      expect(page).to_not have_content('Harold Hurtsfoot')
    end
  end

  context 'patient removal' do
    it 'shows a remove patient button next to each patient' do
      anthonys = Hospital.create!(name: "St. Anthony's")

      anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
      billy = anthony.patients.create!(name: 'Billy Jonson', age: 25)
      shane = anthony.patients.create!(name: 'Shane Jonson', age: 2)

      visit "/doctors/#{anthony.id}"

      expect(page).to have_content('Billy Jonson')
      expect(page).to have_content('Shane Jonson')

      within "#patient-#{billy.id}" do
        click_link 'Remove Billy Jonson'
      end
      expect(current_path).to eq("/doctors/#{anthonys.id}")

      expect(page).to_not have_content('Billy Jonson')
      expect(page).to have_content('Shane Jonson')

      within "#patient-#{shane.id}" do
        click_link 'Remove Shane Jonson'
      end
      expect(current_path).to eq("/doctors/#{anthonys.id}")

      expect(page).to_not have_content('Billy Jonson')
      expect(page).to_not have_content('Shane Jonson')
    end

    it 'removing a patient does not remove its record from the database' do
      anthonys = Hospital.create!(name: "St. Anthony's")

      anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
      billy = anthony.patients.create!(name: 'Billy Jonson', age: 25)
      shane = anthony.patients.create!(name: 'Shane Jonson', age: 2)

      visit "/doctors/#{anthony.id}"
      click_link 'Remove Shane Jonson'

      expect(Patient.find(shane.id)).to eq(shane)
    end
  end
end
