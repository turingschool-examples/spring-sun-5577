require "rails_helper"

RSpec.describe "Doctors show page" do
  let!(:seattle_grace) { Hospital.create!(name: "Seattle Grace Mercy West Hospital") }
  let!(:grey) { Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }
  let!(:denny) { Patient.create!(name: "Denny Duquette", age: 37) }
  let!(:lenny) { Patient.create!(name: "Lenny Luquette", age: 37) }

  let!(:grey_denny) { DoctorPatient.create!(doctor_id: grey.id, patient_id: denny.id) }
  let!(:grey_lenny) { DoctorPatient.create!(doctor_id: grey.id, patient_id: lenny.id) }

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
      expect(page).to have_content("Lenny Luquette")
    end
  end

  it "removes patient from caseload" do
    within "##{lenny.id}" do
      click_button "Remove"
    end
    expect(current_path).to eq("/doctors/#{grey.id}")
    expect(page).to have_content("Denny Duquette")
    expect(page).to_not have_content("Lenny Luquette")
  end
end
