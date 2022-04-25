require 'rails_helper'

RSpec.describe 'patients index page' do 
  it 'lists all patients from oldest to youngest' do 
	  patient1 = Patient.create!(name: 'Katie Bryce', age: 25)
	  patient2 = Patient.create!(name: 'Denny Duquette', age: 30)
	  patient3 = Patient.create!(name: 'Cece Colvin', age: 18)
	  patient4 = Patient.create!(name: 'Henry Burton', age: 72)
	  patient5 = Patient.create!(name: 'Mary Portman', age: 55)

	  visit patients_path 

	  expect('Henry Burton').to appear_before('Mary Portman')
	  expect('Mary Portman').to appear_before('Denny Duquette')
	  expect('Denny Duquette').to appear_before('Katie Bryce')
	  expect('Katie Bryce').to appear_before('Cece Colvin')
  end
end