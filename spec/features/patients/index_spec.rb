require 'rails_helper'

RSpec.describe 'Patients Index Page' do

  it 'Contains all patients' do
    patient_1 = Patient.create(name: "Edge", age: 43)
    patient_2 = Patient.create(name: "Kenny Omega", age: 36)
    patient_3 = Patient.create(name: "Sting", age: 65)
    patient_4 = Patient.create(name: "Kidd Bandit", age: 25)

    visit patients_path()

    patient_1_info = "#{patient_1.name}, Age #{patient_1.age}"
    patient_2_info = "#{patient_2.name}, Age #{patient_2.age}"
    patient_3_info = "#{patient_3.name}, Age #{patient_3.age}"
    patient_1_info = "#{patient_4.name}, Age #{patient_4.age}"

    within "#patients" do
      expect(page).to have_content(patient_1_info)
      expect(page).to have_content(patient_2_info)
      expect(page).to have_content(patient_3_info)
      expect(page).to have_content(patient_4_info)
    end
  end
end