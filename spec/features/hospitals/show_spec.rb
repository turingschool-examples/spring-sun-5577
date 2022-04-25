require 'rails_helper'

RSpec.describe 'A hospital show page' do
  it 'has the name of the hospital' do
    anthonys = Hospital.create!(name: "St. Anthony's")
    d_health = Hospital.create!(name: "Denver Health")

    visit "/hospitals/#{anthonys.id}"

    expect(page).to have_content("St. Anthony's")
    expect(page).to_not have_content("Denver Health")
  end

  it 'has the number of doctors that work for the hospital' do
    anthonys = Hospital.create!(name: "St. Anthony's")
    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
    tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')

    d_health = Hospital.create!(name: "Denver Health")
    hank = d_health.doctors.create!(name: 'Hank', specialty: 'Doctoring', university: 'The Doctoring University')

    visit "/hospitals/#{anthonys.id}"

    expect(page).to have_content('Number of doctors: 2')
    expect(page).to_not have_content('Number of doctors: 3')
  end

  it 'has a unique list of universities its doctors attended' do
    anthonys = Hospital.create!(name: "St. Anthony's")
    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
    hank = d_health.doctors.create!(name: 'Hank', specialty: 'Pediatric Care', university: 'The Doctoring University')
    tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')

    d_health = Hospital.create!(name: "Denver Health")
    phil = d_health.doctors.create!(name: 'Dr. Phil', specialty: 'Humiliation', university: 'CBS')
    visit "/hospitals/#{anthonys.id}"

    within '#universities' do
      expect(page).to have_content('The Doctoring University', count: 1)
      expect(page).to have_content('HowtoCutAFoot.com')

      expect(page).to_not have_content('CBS')
    end
  end
end
