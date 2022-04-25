require "rails_helper"

RSpec.describe "Patients Index page" do
  before (:each) do
    @patient1 = Patient.create!(name: "Joseph D", age: 36)
    @patient2 = Patient.create!(name: "Lee K", age: 37)
    @patient3 = Patient.create!(name: "Megan G", age: 40)

    visit "/patients"
  end

  describe "when I visit the index page" do
    xit "displays the names of all patients" do
      expect(page).to have_content("Joseph D")
      expect(page).to have_content("Lee K")
      expect(page).to have_content("Megan G")
    end

    xit "orders by age" do
      expect("Megan G").to appear_before("Lee K")
      expect("Lee K").to appear_before("Joseph D")
    end
  end
end
