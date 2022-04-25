require "rails_helper"

RSpec.describe "Doctors show page" do
  let!(:seattle_grace) { Hospital.create!(name: "Seattle Grace Mercy West Hospital") }
  let!(:grey) { Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }
  let!(:denny) { Patient.create!(name: "Denny Duquette", age: 37) }

  let!(:grey_denny) { DoctorPatient.create!(doctor_id: grey.id, patient_id: denny.id) }

  before :each do
    visit "/doctors/#{grey.id}"
  end

  it "shows doctor info" do
    expect(page).to have_content("Meredith Grey")
    expect(page).to have_content("General Surgery")
    expect(page).to have_content("Dartmouth")
    expect(page).to have_content("Seattle Grace Mercy West Hospital")
    within ".patients" do
      expect(page).to have_content("Denny Duquette")
    end
  end
end
