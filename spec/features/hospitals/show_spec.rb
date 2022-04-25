require 'rails_helper'


RSpec.describe 'Hospitals Show Page' do

  describe 'As a Visitor' do

    it 'has the hospitals name, and the number of doctors working there' do
      hos1 = Hospital.create!(name: 'Big Hospital')
      hos2 = Hospital.create!(name: 'Other Hospital')
      #hos1 docs
      doc1 = Doctor.create!(name: 'Barry Bonds', specialty: "Steroids", university: "San Fransciso State", hospital_id: hos1.id)
      doc2 = Doctor.create!(name: 'Sammy Sosa', specialty: "Corking Bats", university: "Wrigley College", hospital_id: hos1.id)
      doc3 = Doctor.create!(name: 'Moises Alou', specialty: "Hand Surgeon", university: "Wrigley College", hospital_id: hos1.id)
      doc4 = Doctor.create!(name: 'Mike Jones', specialty: "Speach Impediments", university: "Houston University", hospital_id: hos1.id)
      doc5 = Doctor.create!(name: '50 Cent', specialty: "Money Removal", university: "Wrigley College", hospital_id: hos1.id)
      #hos2 docs
      doc6 = Doctor.create!(name: 'Mark McGuire', specialty: "Homeruns", university: "St. Louis College", hospital_id: hos2.id)
      doc7 = Doctor.create!(name: 'Cheese Man', specialty: "Cheese", university: "Cheese College", hospital_id: hos2.id)

      visit "/hospitals/#{hos1.id}"
      save_and_open_page
      expect(page).to have_content("Hospital Name: Big Hospital")
      expect(page).to have_content("Number of Current Doctors: 5")
      
      expect(page).to_not have_content("Other Hospital")      
    end

  end 
end 