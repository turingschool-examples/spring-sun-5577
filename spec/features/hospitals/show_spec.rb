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

    #should have info for hospital_1 and NOT for hospital_2
    expect(page).to have_content("Rose Medical")
    expect(page).to_not have_content("Fake Hospital")

    #should have number of doctors for ONLY hospital_1
    expect(page).to have_content("Total Doctors: 4")

    #this wasn't part of the user story, I misread it intitially, just didn't delete it because it works
    within "#doctors" do
      expect(page).to have_content("Dr. Speth")
      expect(page).to have_content("Dr. Dog")
      expect(page).to have_content("Dr. LeGate")
      expect(page).to have_content("Dr. Smith")
      expect(page).to_not have_content("Dr. Jan Itor")
    end

    #should have universities for docs at hospital_1 and NOT at hospital_2
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