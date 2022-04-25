require 'rails_helper'

RSpec.describe 'the hospital show page' do
 it 'shows the number of doctors' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
    ploppy= hospital.doctors.create!(name: "Ploppy Gutcutter", specialty: "Gore", university: "Power Butcher University")
    duke = hospital.doctors.create!(name: "Duke Gutcutter", specialty: "Gore", university: "Oregon State University")
      visit "hospitals/#{hospital.id}"
      expect(page).to have_content("Number of Doctors: 4")
  end

 it 'shows unique list of universitys' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    mcdreamy = hospital.doctors.create!(name: "Patrick Dempsy", specialty: "Brains", university: "Oregon State University")
    ploppy= hospital.doctors.create!(name: "Ploppy Gutcutter", specialty: "Gore", university: "Power Butcher University")
    duke = hospital.doctors.create!(name: "Duke Gutcutter", specialty: "Gore", university: "Oregon State University")
      visit "hospitals/#{hospital.id}"
      expect(page).to have_content("Oregon State University", :count => 1)
      expect(page).to have_content("Power Butcher University")
      expect(page).to have_content("Stanford University")
  end
end
