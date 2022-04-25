require "rails_helper"

RSpec.describe Hospital do
  describe "relationships" do
    it { should have_many(:doctors) }
    it { should have_many(:doctor_patients).through(:doctors) }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  let!(:seattle_grace) { Hospital.create!(name: "Seattle Grace Mercy West Hospital") }
  let!(:grey) { Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }
  let!(:grey_2) { Doctor.create!(name: "Other Grey", specialty: "General Surgery", university: "Dartmouth", hospital_id: seattle_grace.id) }
  let!(:shepherd) { Doctor.create!(name: "Derek Shepherd", specialty: "Neurosurgery", university: "Columbia", hospital_id: seattle_grace.id) }

  describe "instance methods" do
    it "#universities gets unique list of universities" do
      expect(seattle_grace.universities).to eq(["Dartmouth", "Columbia"])
    end
  end
end
