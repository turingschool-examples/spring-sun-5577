require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  describe 'When I visit a hospital show page' do
    it 'I see the hospitals name' do
      hosp = Hospital.create!(name: 'Grace')
      hosp2 = Hospital.create!(name: 'Mercy')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp2.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')
      doc3 = hosp2.doctors.create!(name: 'Mary', specialty: 'brain', university: 'this u')
      doc4 = hosp2.doctors.create!(name: 'Sarah', specialty: 'cancer', university: 'this u')

      visit hospital_path(hosp2.id)

      expect(page).to have_content(hosp2.name)
      expect(page).to_not have_content(hosp.name)
    end

    it 'I see the number of doctors that work at this hospital' do
      hosp = Hospital.create!(name: 'Grace')
      hosp2 = Hospital.create!(name: 'Mercy')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp2.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')
      doc3 = hosp2.doctors.create!(name: 'Mary', specialty: 'brain', university: 'this u')
      doc4 = hosp2.doctors.create!(name: 'Sarah', specialty: 'cancer', university: 'this u')

      visit hospital_path(hosp2.id)

      expect(page).to have_content("Number of Doctors: 3")
    end

    it 'I see a unique list of universities that this hospitals doctors attended' do
      hosp = Hospital.create!(name: 'Grace')
      hosp2 = Hospital.create!(name: 'Mercy')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp2.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')
      doc3 = hosp2.doctors.create!(name: 'Mary', specialty: 'brain', university: 'this u')
      doc4 = hosp2.doctors.create!(name: 'Sarah', specialty: 'cancer', university: 'this u')

      visit hospital_path(hosp2.id)
      save_and_open_page
      expect(page).to have_content("bottom u")
      expect(page).to have_content("this u")
      expect(page).to_not have_content("top u")
    end
  end
end