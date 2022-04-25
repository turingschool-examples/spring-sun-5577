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

    @patient_3 = Patient.create!(name: "Jack", age: 54)
    @patient_4 = Patient.create!(name: "Trey", age: 31)
    @patient_2 = Patient.create!(name: "Scotty", age: 29)
    @patient_6 = Patient.create!(name: "Chris", age: 29)


    @doctor_patient_1 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_3.id)
    @doctor_patient_2 = DoctorPatient.create!(doctor_id: @doctor_3.id, patient_id: @patient_4.id)
    @doctor_patient_3 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_2.id)
    @doctor_patient_4 = DoctorPatient.create!(doctor_id: @doctor_2.id, patient_id: @patient_6.id)

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

      visit doctor_path(@doctor_2)
      within "#doctor-info" do
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_2.specialty)
        expect(page).to have_content(@doctor_2.university)
        expect(page).to have_content(@hospital_1.name)

        expect(page).to_not have_content(@doctor_9.name)
        expect(page).to_not have_content(@doctor_9.specialty)
        expect(page).to_not have_content(@doctor_9.university)
        expect(page).to_not have_content(@hospital_2.name)
      end
    end

    it "shows all patients the doctor has" do
      within "#patients" do
        expect(page).to have_content(@patient_4.name)
        expect(page).to have_content(@patient_3.name)
        expect(page).to_not have_content(@patient_6.name)
        expect(page).to_not have_content(@patient_2.name)
      end

      visit doctor_path(@doctor_2)
      within "#patients" do
        expect(page).to have_content(@patient_2.name)
        expect(page).to have_content(@patient_6.name)
        expect(page).to_not have_content(@patient_3.name)
        expect(page).to_not have_content(@patient_4.name)
      end
    end

    it 'has a link to remove patient'
      within "#patient-#{@patient_4.id}" do
        expect(page).to have_button("Remove #{@patient_4.name}")
      end

      within "#patient-#{@patient_3.id}" do
        expect(page).to have_button("Remove #{@patient_3.name}")
      end
    end

    it 'removes a patient from a doctor' do
      click_button "Remove #{@patient_3.name}"

      expect(current_path).to eq(doctor_path(@doctor_3))
      within "#patients" do
        expect(page).to have_content(@patient_4.name)
        expect(page).to_not have_content(@patient_6.name)
        expect(page).to_not have_content(@patient_3.name)
      end
    end
  end