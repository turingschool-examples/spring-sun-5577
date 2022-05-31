require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'instance methods' do 
    describe '.order_by_age_desc' do 
      it 'orders patients from the oldest to youngest' do 
        patient1 = Patient.create!(name: 'Katie Bryce', age: 25)
        patient2 = Patient.create!(name: 'Denny Duquette', age: 30)
        patient3 = Patient.create!(name: 'Cece Colvin', age: 18)
        patient4 = Patient.create!(name: 'Henry Burton', age: 72)
        patient5 = Patient.create!(name: 'Mary Portman', age: 55)

        expect(Patient.order_by_age_desc).to eq([patient4, patient5, patient2, patient1, patient3])
      end
    end
  end
end
