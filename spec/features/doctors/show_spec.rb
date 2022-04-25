require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  describe 'When I visit the doctors show page' do
    it 'I see all of that doctors information including name, specialty, university' do
      hosp = Hospital.create!(name: 'Grace')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')

      visit doctor_path(doc1.id)

      expect(page).to have_content(doc1.name)
      expect(page).to have_content(doc1.specialty)
      expect(page).to have_content(doc1.university)
      expect(page).to_not have_content(doc2.name)
      expect(page).to_not have_content(doc2.specialty)
      expect(page).to_not have_content(doc2.university)
    end
  end
end