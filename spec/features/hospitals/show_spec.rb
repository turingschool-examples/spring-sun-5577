require 'rails_helper'

RSpec.describe "hospitals show page", type: :feature do
  it 'has all the hospital info' do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    alex = hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Iowa State")
    yang = hospital.doctors.create!(name: "Christina Yang", specialty: "Cardio", university: "Colombia")
    avery = hospital.doctors.create!(name: "Jackson Avery", specialty: "Plastics", university: "Stanford University")
    april = hospital.doctors.create!(name: "April Kepner", specialty: "Trauma", university: "Boston University")

    hospital2 = Hospital.create!(name: "Mercy West")
    doctor = hospital2.doctors.create!(name: "Unimportant", specialty: "Neuro", university: "Harvard")

    visit "/hospitals/#{hospital.id}"

    expect(page).to have_content(hospital.name)
    expect(page).to have_content("Number of Doctors: 5")
    expect(page).to have_content("Stanford University", count: 1)
    expect(page).to have_content("Boston University")
    expect(page).to have_content("Colombia")
    expect(page).to have_content("Iowa State")
    expect(page).not_to have_content("Cardio")
    expect(page).not_to have_content("Harvard")
  end
end
