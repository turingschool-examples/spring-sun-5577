require "rails_helper"

RSpec.describe "Hospital Show" do
  before do
    @hospital = Hospital.create!(name: "HospitalName")
    @doctor1 = @hospital.doctors.create!(name: "Doctor1Name", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital.doctors.create!(name: "Doctor2Name", specialty: "Malpractice", university: "Bogata Community College")
    @doctor3 = @hospital.doctors.create!(name: "Doctor3Name", specialty: "Podiatry", university: "Bogata Community College")
    @patient1 = @doctor1.patients.create!(name: "Patient1Name", age: 10)
    @patient2 = @doctor1.patients.create!(name: "Patient2Name", age: 20)
    @patient3 = @doctor1.patients.create!(name: "Patient3Name", age: 30)
    @patient4 = @doctor2.patients.create!(name: "Patient4Name", age: 40)
    @pd1 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor1.id)
    @pd2 = PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor1.id)
    @pd3 = PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @doctor1.id)
    @pd4 = PatientDoctor.create!(patient_id: @patient4.id, doctor_id: @doctor2.id)

    visit "/hospitals/#{@hospital.id}"
  end
  it "show hospital name, # of doctors work there, uniq list of universities they studied from" do
    within "#hospital info" do
      expect(page).to have_content("HospitalName")
      expect(page).to have_content("Total Number of Doctors: 3")
    end
    within "#universities" do
      expect(page).to have_content("Bogata Community College")
      expect(page).to have_content("Stanford University")
    end
  end
end
