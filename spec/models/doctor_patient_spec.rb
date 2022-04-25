require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  describe 'relationships' do
    it { should belong_to :doctor }
    it { should belong_to :patient }
  end

  describe 'instance methods' do

    it 'returns the name of a patient associated with a doctor_patient' do 
      hos1 = Hospital.create!(name: 'Big Hospital')
      doc1 = Doctor.create!(name: 'Barry Bonds', specialty: "Steroids", university: "San Fransciso State", hospital_id: hos1.id)

      pat1 = Patient.create!(name: 'Skeeter', age: 35)
      pat2 = Patient.create!(name: 'LugNut', age: 23)
      pat3 = Patient.create!(name: 'Ruby', age: 44)

      #doc1 patients 
      docpat1 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat1.id)
      docpat2 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat2.id)
      docpat3 = DoctorPatient.create!(doctor_id: doc1.id, patient_id: pat3.id)

      expect(docpat1.patient_name).to eq('Skeeter')
    end 
  end 

end 