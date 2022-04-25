require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do

  it "Shows an individual doctor's information" do
    hospital_1 = Hospital.new(name: "Pro Wrestling General Hospital")
    hospital_2 = Hospital.new(name: "New Japan Pro General")
    doctor_1 = Doctor.new(name: "Buff Bagwell", specialty: "The Stuff", university: "Hard Knocks", hospital_id: hospital_1.id)
    doctor_2 = Doctor.new(name: "Kidd Bandit", specialty: "Anime Surgery", university: "Game Changer University", hospital_id: hospital_2.id)
    patient_1 = Patient.new(name: "Kenny Omega", age: 36)
    patient_2 = Patient.new(name: "Edge", age: 43)
    patient_3 = Patient.new(name: "Sting", age: 65)
    DoctorsPatient.new(patient_id: patient_1.id, doctor_id: doctor_1.id)
    DoctorsPatient.new(patient_id: patient_2.id, doctor_id: doctor_1.id)
    DoctorsPatient.new(patient_id: patient_3.id, doctor_id: doctor_2.id)
    DoctorsPatient.new(patient_id: patient_2.id, doctor_id: doctor_2.id)

    visit "/doctors/#{doctor_1.id}"

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

    visit "/doctors/#{doctor_2.id}"

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