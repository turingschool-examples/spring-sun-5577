require 'rails_helper'

RSpec.describe 'Doctor show' do
  it "displays doctor age, specialty, university" do
    hospital = Hospital.create!(name: "St. Hospital")
    doctor = Doctor.create!(name: "Doc Holiday", specialty: "ENT", university: "UC", hospital: hospital)

    visit "/doctors/#{doctor.id}/"
      within("#doctor-info") do
        expect(page).to have_content(doctor.name)
        expect(page).to have_content(doctor.specialty)
        expect(page).to have_content(doctor.university)
      end

  end
end
