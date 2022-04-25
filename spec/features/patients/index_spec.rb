require 'rails_helper'

RSpec.describe 'patients index page' do
  describe 'as a user' do
    describe 'when i visit the patient index page' do
      it 'i see the names of all patients listed from oldest to youngest' do
        hospital_1 = Hospital.create!(name: "Denver Hospital")
        hospital_2 = Hospital.create!(name: "DC Hospital")
        doctor_1 = hospital_1.doctors.create!(name: "Something Kennedy", specialty: "Cancer", university: "VCU")
        doctor_2 = hospital_1.doctors.create!(name: "Bill Notadoctor", specialty: "Gastrointestinal", university: "NYU")
        doctor_3 = hospital_2.doctors.create!(name: "Brian Definitelynotadoctor", specialty: "Sports injuries", university: "Johns Hopkins")
        patient_1 = doctor_1.patients.create!(name: "Julian", age: 35)
        patient_2 = doctor_1.patients.create!(name: "Bubbles", age: 33)
        patient_3 = doctor_2.patients.create!(name: "Ricky", age: 34)
        patient_4 = doctor_3.patients.create!(name: "Randy", age: 31)
        patient_5 = doctor_3.patients.create!(name: "Lahey", age: 54)

        visit "/patients"

        expect(patient_5.name).to appear_before(patient_1.name)
        expect(patient_1.name).to appear_before(patient_3.name)
        expect(patient_3.name).to appear_before(patient_2.name)
        expect(patient_2.name).to appear_before(patient_4.name)
      end
    end
  end
end
