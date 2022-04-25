require "rails_helper"

RSpec.describe "Patients index page" do
  let!(:seattle_grace) { Hospital.create!(name: "Seattle Grace Mercy West Hospital") }

  let!(:grey) { Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }

  let!(:jenny) { Patient.create!(name: "Jenny Juquette", age: 35) }
  let!(:lenny) { Patient.create!(name: "Lenny Luquette", age: 36) }
  let!(:denny) { Patient.create!(name: "Denny Duquette", age: 37) }

  before :each do
    visit "/patients/"
  end

  it "lists all patients oldest to youngest" do
    expect("Denny").to appear_before("Lenny")
    expect("Lenny").to appear_before("Jenny")
  end
end
