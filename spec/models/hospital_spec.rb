require "rails_helper"

RSpec.describe Hospital, type: :model do
  describe "relationships" do
    it { should have_many(:doctors) }
    it { should have_many(:patients).through(:doctors) }
  end

  describe "class methods", type: :model do
    it "displays a unique list of universities the doctors attended" do
      hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")

      doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      doctor2 = hospital1.doctors.create!(name: "John Quincey", specialty: "Kidney Surgery", university: "Colorado University")
      doctor3 = hospital1.doctors.create!(name: "Hawkeye Pierce", specialty: "Oral Surgery", university: "Arizona University")
      doctor4 = hospital1.doctors.create!(name: "Charles Winchester", specialty: "Knee Surgery", university: "Stanford University")

      expect(hospital1.doctors_uniq_universities).to eq(["Stanford University", "Colorado University", "Arizona University"])
    end
  end
end
