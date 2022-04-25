require 'rails_helper'

RSpec.describe 'patients show page' do
  describe 'as a user' do
    describe 'when i visit a patient show page' do
      it 'i see that only that patients name' do
        patient_1 = Patient.create!(name: "Julian", age: 35)
        patient_2 = Patient.create!(name: "Bubbles", age: 33)
        patient_3 = Patient.create!(name: "Ricky", age: 34)
        patient_4 = Patient.create!(name: "Randy", age: 31)
        patient_5 = Patient.create!(name: "Lahey", age: 54)

        visit "/patients/#{patient_1.id}"

        expect(page).to have_content("Julian")
        expect(page).not_to have_content("Bubbles")
        expect(page).not_to have_content("Ricky")
        expect(page).not_to have_content("Randy")
        expect(page).not_to have_content("Lahey")
      end
    end
  end
end
