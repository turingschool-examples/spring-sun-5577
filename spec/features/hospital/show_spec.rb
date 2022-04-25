require "rails_helper"

RSpec.describe "Hospitals show page" do
  let!(:seattle_grace) { Hospital.create!(name: "Seattle Grace Mercy West Hospital") }
  let!(:sacred_heart) { Hospital.create!(name: "Sacred Heart") }
  let!(:grey) { Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }
  let!(:grey_2) { Doctor.create!(name: "Other Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }
  let!(:shepherd) { Doctor.create!(name: "Derek Shepherd", specialty: "Neurosurgery", university: "Columbia", hospital_id: seattle_grace.id) }
  let!(:jd) { Doctor.create!(name: "John Dorian", specialty: "Medical", university: "William and Mary", hospital_id: sacred_heart.id) }
  let!(:denny) { Patient.create!(name: "Denny Duquette", age: 37) }

  let!(:grey_denny) { DoctorPatient.create!(doctor_id: grey.id, patient_id: denny.id) }

  before :each do
    visit "/hospitals/#{seattle_grace.id}"
  end

  it "shows hospital info" do
    expect(page).to have_content("Seattle Grace Mercy West Hospital")
    expect(page).to have_content("Doctors: 3")

    within ".universities" do
      expect(page).to have_content("Dartmouth")
      expect(page).to have_content("Columbia")
      expect(page).to_not have_content("William and Mary")
    end
  end
end
