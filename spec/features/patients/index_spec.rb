require 'rails_helper'

RSpec.describe 'The patients index page' do
  it 'lists the names of all patients in the system, alphabetically' do
    anthonys = Hospital.create!(name: "St. Anthony's")
    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
    hank = anthonys.doctors.create!(name: 'Hank', specialty: 'Pediatric Care', university: 'The Doctoring University')
    tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')

    d_health = Hospital.create!(name: "Denver Health")
    phil = d_health.doctors.create!(name: 'Dr. Phil', specialty: 'Humiliation', university: 'CBS')

    visit '/patients'

    expect('Dr. Phil').to appear_before('Hank')
    expect('Hank').to appear_before('Regular Tony')
    expect('Regular Tony').to appear_before('St. Anthony')
  end
end
