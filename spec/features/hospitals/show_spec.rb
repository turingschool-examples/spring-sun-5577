require 'rails_helper'

RSpec.describe 'hospitals show page' do
  it 'displays name, number of doctors, and unique universities' do
    hosp_1 = Hospital.create!(name: 'City Health')
    hosp_2 = Hospital.create!(name: 'County Medical')
    doc_1 = hosp_1.doctors.create(name: 'Jim Pfeiffer', specialty: 'Pediatrics', university: 'Vanderbilt')
    doc_2 = hosp_1.doctors.create(name: 'Ted Leftwich', specialty: 'Proctology', university: 'Emory')
    doc_3 = hosp_1.doctors.create(name: 'Corbin Meikle', specialty: 'Brain Surgery', university: 'Emory')
    doc_4 = hosp_2.doctors.create(name: 'Brian Grimes', specialty: 'Sports Medicine', university: 'University of Tennessee')

    visit "hospitals/#{hosp_1.id}"

    expect(page).to have_content('City Health')
    expect(page).to have_content('3')
    expect(page).to have_content('Emory', count: 1)
    expect(page).to have_content('Vanderbilt')
    expect(page).to have_no_content('County Medical')
    expect(page).to have_no_content('Brian Grimes')
    expect(page).to have_no_content('University of Tennessee')
  end
end
