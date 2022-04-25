require 'rails_helper'

RSpec.describe 'hospital show page' do 
  it 'displays hospital name, number of doctors and unique univiersties these doctors attended' do 
	hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
	hospital2 = Hospital.create!(name: 'The Mayo Clinic')
	bailey = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
	christina = hospital1.doctors.create!(name: "Cristina Yang", specialty: "Cardiothoracic Surgery", university: "Stanford University")
	alex = hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "University of Iowa")
	robert = hospital2.doctors.create!(name: "Robert Stark", specialty: "Pediatric Surgery", university: "University of Minnesota")
	
	visit hospital_path(hospital1.id)
	
	expect(page).to have_content(hospital1.name)
	expect(page).to have_content('Number of Doctors: 3')
	expect(page).to have_content('Stanford University', count: 1)
	expect(page).to have_content('University of Iowa')
	
	expect(page).to_not have_content(hospital2.name)
	expect(page).to_not have_content('Number of Doctors: 1')
	expect(page).to_not have_content("University of Minnesota")
  end
end