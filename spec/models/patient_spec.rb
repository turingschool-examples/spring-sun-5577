require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    describe '#age_before_beauty' do
      it 'sorts all patients from oldest to youngest' do
        patient_1 = Patient.create!(name: "Julian", age: 35)
        patient_2 = Patient.create!(name: "Bubbles", age: 33)
        patient_3 = Patient.create!(name: "Ricky", age: 34)
        patient_4 = Patient.create!(name: "Randy", age: 31)
        patient_5 = Patient.create!(name: "Lahey", age: 54)

        expect(Patient.age_before_beauty).to eq([patient_5, patient_1, patient_3, patient_2, patient_4])
      end
    end
  end
end
