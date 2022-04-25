require 'rails_helper'

describe 'doctor show page', type: :feature do
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

    @patient_3 = Patient.new(name: "Jack", age: 54)
    @patient_4 = Patient.new(name: "Trey", age: 31)
    @patient_2 = Patient.new(name: "Scotty", age: 29)
    @patient_6 = Patient.new(name: "Chris", age: 29)


    @doctor_patient_1 = DoctorPatient.new(doctor_id: @doctor_3.id, patient_id: @patient_3.id)
    @doctor_patient_2 = DoctorPatient.new(doctor_id: @doctor_3.id, patient_id: @patient_4.id)
    @doctor_patient_3 = DoctorPatient.new(doctor_id: @doctor_2.id, patient_id: @patient_2.id)
    @doctor_patient_4 = DoctorPatient.new(doctor_id: @doctor_2.id, patient_id: @patient_6.id)

    visit doctor_path(@doctor_3)
  end

  describe 'display' do
    it "shows all of the doctor's personal info" do
      within "#doctor-info" do
        expect(page).to have_content(@doctor_3.name)
        expect(page).to have_content(@doctor_3.specialty)
        expect(page).to have_content(@doctor_3.university)
        expect(page).to have_content(@hospital_2.name)

        expect(page).to_not have_content(@doctor_2.name)
        expect(page).to_not have_content(@doctor_2.specialty)
        expect(page).to_not have_content(@doctor_2.university)
        expect(page).to_not have_content(@hospital_1.name)
      end
    end
  end
end