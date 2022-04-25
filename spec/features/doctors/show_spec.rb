require "rails_helper"

RSpec.describe "Doctor Show Page" do
  it "displays a doctors attributes" do
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    hospital2 = Hospital.create!(name: "Denver General Hospital")

    doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    doctor2 = hospital2.doctors.create!(name: "David Chow", specialty: "Brain Surgery", university: "Oregon University")

    patient1 = Patient.create!(name: "John Elway", age: 66)
    patient2 = Patient.create!(name: "Terrell Davis", age: 52)
    patient3 = Patient.create!(name: "Rod Smith", age: 55)

    DoctorPatient.create!(doctor: doctor1, patient: patient1)
    DoctorPatient.create!(doctor: doctor1, patient: patient2)
    DoctorPatient.create!(doctor: doctor2, patient: patient3)

    visit doctor_path(doctor1.id)

    expect(page).to have_content("Miranda Bailey")
    expect(page).to have_content("General Surgery")
    expect(page).to have_content("Stanford University")
    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Patients: John Elway, Terrell Davis")
    expect(page).to_not have_content("David Chow")
    expect(page).to_not have_content("Brain Surgery")
    expect(page).to_not have_content("Oregon University")
    expect(page).to_not have_content("Denver General Hospital")
    expect(page).to_not have_content("Patients: Rod Smith")
  end
end
