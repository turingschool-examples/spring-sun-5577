require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    it 'removes patient from doctor' do
      hospital = Hospital.create!(name: 'Kaiser')
      doctor = hospital.doctors.create!(name: 'Amy', specialty: 'Cardiology', university: 'Harvard')
      paul = Patient.create!(name: 'Paul', age: 25)
      doctor_patient = DoctorPatient.create!(patient_id: paul.id, doctor_id: doctor.id)
      expect(doctor.remove_patient(paul.name).first).to eq(doctor_patient)
    end
  end
end
