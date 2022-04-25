require 'rails_helper'

describe Patient, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end

  describe 'relationships' do
    it {should have_many(:doctors)}
    it {should have_many(:doctor_patients)}
  end

  describe 'methods' do
    it '.age_order' do
      @patient_3 = Patient.create!(name: "Jack", age: 54)
      @patient_4 = Patient.create!(name: "Trey", age: 31)
      @patient_2 = Patient.create!(name: "Scotty", age: 29)
      @patient_6 = Patient.create!(name: "Chris", age: 30)

      expect(Patient.age_order).to eq([@patient_3, @patient_4, @patient_6, @patient_2])
    end
  end
end
