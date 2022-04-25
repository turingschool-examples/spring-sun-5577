require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it 'can return a unique list of doctor universities' do
      hosp = Hospital.create!(name: 'Grace')
      hosp2 = Hospital.create!(name: 'Mercy')

      doc1 = hosp.doctors.create!(name: 'John', specialty: 'general', university: 'top u')
      doc2 = hosp2.doctors.create!(name: 'Jim', specialty: 'heart', university: 'bottom u')
      doc3 = hosp2.doctors.create!(name: 'Mary', specialty: 'brain', university: 'this u')
      doc4 = hosp2.doctors.create!(name: 'Sarah', specialty: 'cancer', university: 'this u')

      expect(hosp2.unique_universities).to eq(['bottom u', 'this u'])
    end
  end
end
