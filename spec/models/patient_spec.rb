require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors) }
  end

  before do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial")

    @doc1 = @hospital1.doctors.create!(name:"Meredith Grey", specialty: "General Surgery", university: "Dartmouth")
    @doc2 = @hospital1.doctors.create!(name:"Alex Karev", specialty: "Pediatrics", university: "School U")

    @d1_pat1 = Patient.create!(name: "Buddy the Elf", age: 35)
    @d1_pat2 = Patient.create!(name: "Cruddy the Shelf", age: 34)
    @d1p1_rel = DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat1.id)
    @d1p2_rel = DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @d1_pat2.id)

    @d2_pat1 = Patient.create!(name: "A Child", age: 3)
    @d2p1_rel = DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d2_pat1.id)
    @d2p2_rel = DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @d1_pat2.id)
  end

  describe 'instance methods' do
    it '#this_doctor_patient' do
      expect(@d1_pat2.this_doctor_patient(@doc1).id).to eq(@d1p2_rel.id)
      expect(@d1_pat2.this_doctor_patient(@doc2).id).to eq(@d2p2_rel.id)
    end
  end
end
