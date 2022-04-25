require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do

  it "Shows an individual doctor's information" do
    hospital_1 = Hospital.create(name: "Pro Wrestling General Hospital")
    hospital_2 = Hospital.create(name: "New Japan Pro General")
    doctor_1 = Doctor.create(name: "Buff Bagwell", specialty: "The Stuff", university: "Hard Knocks", hospital_id: hospital_1.id)
    doctor_2 = Doctor.create(name: "Kidd Bandit", specialty: "Anime Surgery", university: "Game Changer University", hospital_id: hospital_2.id)
    patient_1 = Patient.create(name: "Kenny Omega", age: 36)
    patient_2 = Patient.create(name: "Edge", age: 43)
    patient_3 = Patient.create(name: "Sting", age: 65)
    DoctorsPatient.create(patient_id: patient_1.id, doctor_id: doctor_1.id)
    DoctorsPatient.create(patient_id: patient_2.id, doctor_id: doctor_1.id)
    DoctorsPatient.create(patient_id: patient_3.id, doctor_id: doctor_2.id)
    DoctorsPatient.create(patient_id: patient_2.id, doctor_id: doctor_2.id)


    visit doctor_path(doctor_1.id)

    within "#doctor-info" do
      expect(page).to have_content(doctor_1.name)
      expect(page).to_not have_content(doctor_2.name)
      expect(page).to have_content(doctor_1.specialty)
      expect(page).to_not have_content(doctor_2.specialty)
      expect(page).to have_content(doctor_1.university)
      expect(page).to_not have_content(doctor_2.university)
      expect(page).to have_content(hospital_1.name)
      expect(page).to_not have_content(hospital_2.name)
    end

    within "#patients" do
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to_not have_content(patient_3.name)
    end

    visit doctor_path(doctor_2.id)

    within "#doctor-info" do
      expect(page).to_not have_content(doctor_1.name)
      expect(page).to have_content(doctor_2.name)
      expect(page).to_not have_content(doctor_1.specialty)
      expect(page).to have_content(doctor_2.specialty)
      expect(page).to_not have_content(doctor_1.university)
      expect(page).to have_content(doctor_2.university)
      expect(page).to_not have_content(hospital_1.name)
      expect(page).to have_content(hospital_2.name)
    end

    within "#patients" do
      expect(page).to_not have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
    end
  end
end