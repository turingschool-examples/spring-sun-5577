require "rails_helper"

RSpec.describe "Hospital Show Page" do
  it "displays a doctors attributes" do
    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    hospital2 = Hospital.create!(name: "Denver General Hospital")

    doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    doctor2 = hospital1.doctors.create!(name: "John Quincey", specialty: "Kidney Surgery", university: "Colorado University")
    doctor3 = hospital1.doctors.create!(name: "Hawkeye Pierce", specialty: "Oral Surgery", university: "Arizona University")
    doctor4 = hospital1.doctors.create!(name: "Charles Winchester", specialty: "Knee Surgery", university: "Stanford University")
    doctor5 = hospital2.doctors.create!(name: "David Chow", specialty: "Brain Surgery", university: "Oregon University")

    visit hospital_path(hospital1.id)

    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Number of Doctors: 4")
    expect(page).to_not have_content("Denver General Hospital")
  end
end
