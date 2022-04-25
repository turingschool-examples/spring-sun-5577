require 'rails_helper'

RSpec.describe 'The patients index page' do
  it 'lists the names of all patients in the system, alphabetically' do
    anthonys = Hospital.create!(name: "St. Anthony's")

    anthony = anthonys.doctors.create!(name: 'St. Anthony', specialty: 'Doctoring', university: 'The Doctoring University')
    bill = anthony.patients.create!(name: 'Billy Bob', age: 30)

    hank = anthonys.doctors.create!(name: 'Hank', specialty: 'Pediatric Care', university: 'The Doctoring University')
    dennis = hank.patients.create!(name: 'Dennis Dinkleburg', age: 40)

    tony = anthonys.doctors.create!(name: 'Regular Tony', specialty: 'Foot Surgeon', university: 'HowtoCutAFoot.com')
    carl = tony.patients.create!(name: 'Carl Christianson', age: 43)

    d_health = Hospital.create!(name: "Denver Health")

    phil = d_health.doctors.create!(name: 'Dr. Phil', specialty: 'Humiliation', university: 'CBS')
    andrew = phil.patients.create!(name: 'Andrew Arnold', age: 25)

    visit '/patients'

    expect('Andrew Arnold').to appear_before('Billy Bob')
    expect('Billy Bob').to appear_before('Carl Christianson')
    expect('Carl Christianson').to appear_before('Dennis Dinkleburg')
  end
end
