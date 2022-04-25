require 'rails_helper'

RSpec.describe "hospital show page" do
  it "has the hospital name, all the doctors who work there, and a unique list of universities that this hospital's doctors attended" do
    hospital_1 = Hospital.create!(name: "Rose Medical")
    hospital_2 = Hospital.create!(name: "Fake Hospital")
    doc_1 = hospital_1.doctors.create!(name: "Dr. Speth", specialty: "Optometry", university: "SCCO")
    doc_2 = hospital_1.doctors.create!(name: "Dr. Dog", specialty: "Music", university: "The Streets")
    doc_3 = hospital_1.doctors.create!(name: "Dr. LeGate", specialty: "Optometry", university: "SCCO")
    doc_4 = hospital_1.doctors.create!(name: "Dr. Smith", specialty: "Chiropractic", university: "SCUHS")
    doc_5 = hospital_2.doctors.create!(name: "Dr. Jan Itor", specialty: "Custodial Sciences", university: "Sacred Heart")

    visit "/hospitals/#{hospital_1.id}"

    expect(page).to have_content("Rose Medical")
    expect(page).to_not have_content("Fake Hospital")

    expect(page).to have_content("Total Doctors: 4")

    within "#doctors" do
      expect(page).to have_content("Dr. Speth")
      expect(page).to have_content("Dr. Dog")
      expect(page).to have_content("Dr. LeGate")
      expect(page).to have_content("Dr. Smith")
      expect(page).to_not have_content("Dr. Jan Itor")
    end

    within "#universities" do
      expect(page).to have_content("SCCO")
      expect(page).to have_content("The Streets")
      expect(page).to have_content("SCUHS")
      expect(page).to_not have_content("Sacred Heart")
    end
  end
end

# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended