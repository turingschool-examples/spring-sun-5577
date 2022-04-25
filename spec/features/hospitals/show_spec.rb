require 'rails_helper'

RSpec.describe 'Doctor show' do
  it "displays hospital info" do
    hospital = Hospital.create!(name: "St. Hospital")
    doctor = Doctor.create!(name: "Doc Holiday", specialty: "ENT", university: "UC", hospital: hospital)
    patient1 = Patient.create!(name:"Jim", age: 18)
    patient2 = Patient.create!(name:"Tim", age: 20)
    doctorpatient1 = DoctorPatient.create!(doctor: doctor, patient: patient1)
    doctorpatient2 = DoctorPatient.create!(doctor: doctor, patient: patient2)
    doctor4 = Doctor.create!(name: "Another Doc", specialty: "ENT", university: "UC", hospital: hospital)


    patient3 = Patient.create!(name:"Pam", age: 22)
    doctor2 = Doctor.create!(name: "Bad Doc", specialty: "ENT", university: "Illinois", hospital: hospital)
    doctorpatient3 = DoctorPatient.create!(doctor: doctor2, patient: patient3)

    hospital2 = Hospital.create!(name: "Bad Hospital")
    patient4 = Patient.create!(name:"Pam", age: 22)
    doctor3 = Doctor.create!(name: "Bad Doc", specialty: "ENT", university: "DeVry", hospital: hospital2)
    doctorpatient4 = DoctorPatient.create!(doctor: doctor3, patient: patient4)

    visit "/hospitals/#{hospital.id}/"
      within("#hospital-doctors") do
        expect(page).to have_content(3)
      end

      within("#hospital-doctors-universities") do
        expect(page).to have_content("UC")
        expect(page).to have_content("Illinois")
        expect(page).to_not have_content("DeVry")
      end

  end
end
