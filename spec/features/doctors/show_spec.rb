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

    expect(page).to have_content(doctor1.name)
    expect(page).to have_content(doctor1.specialty)
    expect(page).to have_content(doctor1.university)
    expect(page).to have_content(hospital1.name)
    expect(page).to have_content(patient1.name)
    expect(page).to have_content(patient2.name)
    expect(page).to_not have_content(doctor2.name)
    expect(page).to_not have_content(patient3.name)
  end

  it "has button to delete a patient that deletes patient" do
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

    patient1 = Patient.create!(name: "John Elway", age: 66)
    patient2 = Patient.create!(name: "Terrell Davis", age: 52)
    patient3 = Patient.create!(name: "Rod Smith", age: 55)

    DoctorPatient.create!(doctor: doctor1, patient: patient1)
    DoctorPatient.create!(doctor: doctor1, patient: patient2)
    DoctorPatient.create!(doctor: doctor1, patient: patient3)

    visit doctor_path(doctor1.id)

    expect(page).to have_button("Delete John Elway")

    expect(page).to have_content("John Elway")
    expect(page).to have_content("Terrell Davis")
    expect(page).to have_content("Rod Smith")

    click_button "Delete John Elway"

    expect(page).to have_content("Terrell Davis")
    expect(page).to have_content("Rod Smith")
    expect(page).to_not have_content("John Elway")
  end

  it "has button to create a patient" do
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

    patient1 = Patient.create!(name: "John Elway", age: 66)
    patient2 = Patient.create!(name: "Terrell Davis", age: 52)
    patient3 = Patient.create!(name: "Rod Smith", age: 55)

    DoctorPatient.create!(doctor: doctor1, patient: patient1)
    DoctorPatient.create!(doctor: doctor1, patient: patient2)
    DoctorPatient.create!(doctor: doctor1, patient: patient3)

    visit doctor_path(doctor1.id)

    expect(page).to have_button("Create Patient")

    expect(page).to have_content("John Elway")
    expect(page).to have_content("Terrell Davis")
    expect(page).to have_content("Rod Smith")

    click_button "Delete John Elway"

    expect(page).to have_content("Terrell Davis")
    expect(page).to have_content("Rod Smith")
    expect(page).to_not have_content("John Elway")
  end
end
