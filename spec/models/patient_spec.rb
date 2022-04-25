require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctors) }
    it { should have_many(:doctors_patients) }
  end

  describe 'Sorting Methods' do
    patient_1 = Patient.create(name: "Edge", age: 43)
    patient_2 = Patient.create(name: "Kenny Omega", age: 36)
    patient_3 = Patient.create(name: "Sting", age: 65)
    patient_4 = Patient.create(name: "Kidd Bandit", age: 25)

    patients = Patient.sort_by_age

    within patients do
      expect(patient_3).to appear_before(patient_1)
      expect(patient_3).to appear_before(patient_2)
      expect(patient_3).to appear_before(patient_4)
      expect(patient_1).to_not appear_before(patient_3)
      expect(patient_1).to appear_before(patient_2)
      expect(patient_1).to appear_before(patient_4)
      expect(patient_2).to_not appear_before(patient_1)
      expect(patient_2).to_not appear_before(patient_3)
      expect(patient_2).to appear_before(patient_4)
      expect(patient_4).to_not appear_before(patient_2)
      expect(patient_4).to_not appear_before(patient_1)
      expect(patient_4).to_not appear_before(patient_3)
    end
  end
end
