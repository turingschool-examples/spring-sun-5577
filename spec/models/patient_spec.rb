require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'relationships' do 
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }

  end 

  describe 'class methods' do 

    it 'returns all patients (as objects), in order by age, oldest to youngest' do 
      pat1 = Patient.create!(name: 'Skeeter', age: 35)
      pat2 = Patient.create!(name: 'LugNut', age: 23)
      pat3 = Patient.create!(name: 'Ruby', age: 44)
      pat4 = Patient.create!(name: 'Wubbie', age: 67)
      expect(Patient.oldest_to_youngest).to eq([pat4, pat3, pat1, pat2])
    end 
  end 

end 