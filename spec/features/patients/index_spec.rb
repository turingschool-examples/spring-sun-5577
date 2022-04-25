require 'rails_helper'


RSpec.describe 'Patients Index Page' do

  describe 'As a Visitor' do

    it 'patient names are displayed from oldest to youngest' do
      pat1 = Patient.create!(name: 'Skeeter', age: 35)
      pat2 = Patient.create!(name: 'LugNut', age: 23)
      pat3 = Patient.create!(name: 'Ruby', age: 44)
      pat4 = Patient.create!(name: 'Wubbie', age: 67)
      
      visit "/patients"

      expect("Wubbie").to appear_before("Ruby")
      expect("Ruby").to appear_before("LugNut")



    end 


  end 
end 