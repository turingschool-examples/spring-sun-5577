require 'rails_helper'

RSpec.describe "Hospital Show Page", type: :feature do

  it 'Shows an individual hospital with count of all doctors and unique names of universities' do
    hospital_1 = Hospital.create(name: "Pro Wrestling General Hospital")
    hospital_2 = Hospital.create(name: "New Japan Pro General")
    doctor_1 = Doctor.create(name: "Buff Bagwell", specialty: "The Stuff", university: "Hard Knocks", hospital_id: hospital_1.id)
    doctor_2 = Doctor.create(name: "Kidd Bandit", specialty: "Anime Surgery", university: "Game Changer University", hospital_id: hospital_1.id)
    doctor_3 = Doctor.create(name: "Nick Gage", specialty: "Pizza-cutter Surgery", university: "Game Changer University", hospital_id: hospital_1.id)

    visit hospital_path(hospital_1.id)

    within "#hospital-info" do
      expect(page).to have_content(hospital_1.name)
      expect(page).to_not have_content(hospital_2.name)
      expect(page).to have_content("Doctor Count: #{hospital_1.doctors.count}")
      expect(page).to_not have_content("Doctor Count: 100000000000")
    end

    within "#universities" do
      expect(page).to have_content(doctor_1.university, count: 1)
      expect(page).to have_content(doctor_2.university, count: 1)
    end
  end
end