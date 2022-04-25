require "rails_helper"

RSpec.describe "Hospital Show" do
  before do
    @hospital = Hospital.create!(name: "HospitalName")
    @hospital2 = Hospital.create!(name: "Hospital2Name")
    @doctor1 = @hospital.doctors.create!(name: "Doctor1Name", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital.doctors.create!(name: "Doctor2Name", specialty: "Malpractice", university: "Bogata Community College")
    @doctor3 = @hospital.doctors.create!(name: "Doctor3Name", specialty: "Podiatry", university: "Bogata Community College")
    @doctor4 = @hospital2.doctors.create!(name: "Doctor4Name", specialty: "Psychiatry", university: "Manson School for the Gifted")

    visit "/hospitals/#{@hospital.id}"
  end


  it "shows hospital name, # of doctors work there, uniq list of universities they studied from" do
    within "#hospital_info" do
      expect(page).to have_content("HospitalName")
      expect(page).to have_content("Total Number of Doctors: 3")
    end

    within "#universities" do
      expect(page).to have_content("Bogata Community College")
      expect(page).to have_content("Stanford University")
    end
  end
end
