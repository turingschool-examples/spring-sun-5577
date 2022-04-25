require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:patient_doctors) }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  describe 'class methods' do
    it '#oldest_to_youngest' do
      pat_1 = Patient.create!(name: 'Justin Hill', age: 39)
      pat_2 = Patient.create!(name: 'Mark Gainey', age: 46)
      pat_3 = Patient.create!(name: 'Liz Hagler', age: 35)
      pat_4 = Patient.create!(name: 'Henry Mosley', age: 20)

      expect(Patient.oldest_to_youngest).to eq([pat_2, pat_1, pat_3, pat_4])
    end
  end
end
