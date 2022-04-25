require 'rails_helper'

RSpec.describe 'Doctor show' do
  it "displays doctor age, specialty, university" do
    hospital = Hospital.create!(name: "St. Hospital")
    doctor = Doctor.create!(name: "Doc Holiday", specialty: "ENT", university: "UC", hospital: hospital)
    patient1 = Patient.create!(name:"Jim", age: 18)
    patient2 = Patient.create!(name:"Tim", age: 20)
    doctorpatient1 = DoctorPatient.create!(doctor: doctor, patient: patient1)
    doctorpatient2 = DoctorPatient.create!(doctor: doctor, patient: patient2)

    patient3 = Patient.create!(name:"Pam", age: 22)
    doctor2 = Doctor.create!(name: "Bad Doc", specialty: "ENT", university: "UC", hospital: hospital)
    doctorpatient3 = DoctorPatient.create!(doctor: doctor2, patient: patient3)
    visit "/doctors/#{doctor.id}/"
      within("#doctor-info") do
        #save_and_open_page
        expect(page).to have_content(doctor.name)
        expect(page).to have_content(doctor.specialty)
        expect(page).to have_content(doctor.university)
        expect(page).to have_content(doctor.hospital.name)
      end

      within("#doctor-patients") do
        expect(page).to have_content(patient1.name)
        expect(page).to have_content(patient2.name)
        expect(page).to_not have_content(patient3.name)
      end

      within("#doctor-patients") do
        expect(page).to have_content(patient1.name)
        expect(page).to have_button("Remove #{patient1.name}")
        click_button "Remove #{patient1.name}"


        expect(page).to_not have_content(patient1.name)
      end

  end
end
