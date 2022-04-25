require 'rails_helper'

describe "patients index page", type: :feature do
  before do
      @hospital_2 = Hospital.create!(name: 'Sacred Heart Hospital')
    @doctor_9 = Doctor.create!(
      name: 'J.D.',
      specialty: 'Human Connection',
      university: 'Iowa State',
      hospital_id: @hospital_2.id
    )
    @doctor_3 = Doctor.create!(
      name: 'Cox',
      specialty: 'Sarcasm',
      university: 'University of Chicago',
      hospital_id: @hospital_2.id
    )
    @doctor_6 = Doctor.create!(
      name: 'Turk',
      specialty: 'Neurogly',
      university: 'NorthWestern',
      hospital_id: @hospital_2.id
    )

    @hospital_1 = Hospital.create!(name: "Princeton - Plainsboro Teaching Hospital")
    @doctor_4 = Doctor.create!(
      name: 'House',
      specialty: 'Neurogly',
      university: 'Harvard',
      hospital_id: @hospital_1.id
    )
    @doctor_2 = Doctor.create!(
      name: 'Wilson',
      specialty: 'Parasites',
      university: 'Princeton',
      hospital_id: @hospital_1.id
    )

    @patient_3 = Patient.create!(name: "Jack", age: 54)
    @patient_4 = Patient.create!(name: "Trey", age: 31)
    @patient_2 = Patient.create!(name: "Scotty", age: 29)
    @patient_6 = Patient.create!(name: "Chris", age: 30)


    @doctor_patient_1 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_3.id)
    @doctor_patient_2 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_4.id)
    @doctor_patient_3 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_2.id)
    @doctor_patient_4 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_6.id)

    visit patients_path
  end

  describe 'display' do

    it 'has all the patients listed from oldest to youngest' do
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_6.name)
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_content(@patient_4.name)

      expect(@patient_3.name).to appear_before(@patient_4.name)
      expect(@patient_4.name).to appear_before(@patient_6.name)
      expect(@patient_6.name).to appear_before(@patient_2.name)
    end
  end
end