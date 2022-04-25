require 'rails_helper'

RSpec.describe 'patients index page' do
  describe 'as a user' do
    describe 'when i visit the patient index page' do
      it 'i see the names of all patients listed from oldest to youngest' do
        patient_1 = Patient.create!(name: "Julian", age: 35)
        patient_2 = Patient.create!(name: "Bubbles", age: 33)
        patient_3 = Patient.create!(name: "Ricky", age: 34)
        patient_4 = Patient.create!(name: "Randy", age: 31)
        patient_5 = Patient.create!(name: "Lahey", age: 54)

        visit "/patients"

        expect(patient_5.name).to appear_before(patient_1.name)
        expect(patient_1.name).to appear_before(patient_3.name)
        expect(patient_3.name).to appear_before(patient_2.name)
        expect(patient_2.name).to appear_before(patient_4.name)
      end
    end
  end
end
