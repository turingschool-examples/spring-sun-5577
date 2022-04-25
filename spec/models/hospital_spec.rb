require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do

    it 'returns a unique list of universities that a hospitals doctors attended' do 
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

      expect(hos1.unique_universities).to eq(["Houston University", "San Francisco State", "Wrigley College"])

    end 

  end 


end
