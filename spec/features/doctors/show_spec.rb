require 'rails_helper'

RSpec.describe "Doctor Show", type: :feature do
  before do
    @hospital = Hospital.create!(name: "Hospital1Name")
    @doctor1 = @hospital.doctors.create!(name: "Doctor1Name", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital.doctors.create!(name: "Doctor2Name", specialty: "Malpractice", university: "Bogata Community College")
    @patient1 = @doctor1.patients.create!(name: "Patient1Name", age: 10)
    @patient2 = @doctor1.patients.create!(name: "Patient2Name", age: 20)
    @patient3 = @doctor1.patients.create!(name: "Patient3Name", age: 30)
    @patient4 = @doctor2.patients.create!(name: "Patient4Name", age: 40)
    @pd1 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor1.id)
    @pd2 = PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor1.id)
    @pd3 = PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @doctor1.id)
    @pd4 = PatientDoctor.create!(patient_id: @patient4.id, doctor_id: @doctor2.id)

    visit "/doctors/#{@doctor1.id}"
  end

  it "shows doctor's: name, hospital, and list of patients" do
    within "#doctor_info" do
      save_and_open_page
      expect(page).to have_content("Doctor1Name")
      expect(page).to have_content("General Surgery")
      expect(page).to have_content("Hospital1Name")
    end
  end

  xit "lists all the patients associated with the doctor" do
    within "patient_list" do
      expect(page).to have_content("Patient1Name")
      expect(page).to have_content("Patient2Name")
      expect(page).to have_content("Patient3Name")
      expect(page).to_not have_content("Patient4Name")
    end
  end
end
