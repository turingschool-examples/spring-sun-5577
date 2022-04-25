require "rails_helper"

RSpec.describe "Hospital Show page" do
  before (:each) do
    @hospital = Hospital.create!(name: "Denver Health")

    @doctor1 = @hospital.doctors.create!(name: "Alex Trebek", specialty: "Feet", university: "Florida State")
    @doctor2 = @hospital.doctors.create!(name: "Sheldon Cooper", specialty: "Hearts", university: "Maine University")
    @doctor3 = @hospital.doctors.create!(name: "Paige Hallowell", specialty: "Eyes", university: "Metro State")
    @doctor4 = @hospital.doctors.create!(name: "Prue Hallowell", specialty: "Cancer", university: "Metro State")

    @patient1 = Patient.create!(name: "Joseph D", age: 36)
    @patient2 = Patient.create!(name: "Lee K", age: 37)
    @patient3 = Patient.create!(name: "Megan G", age: 40)

    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient1.id)

    visit "/hospitals/#{@hospital.id}"
  end

  describe "when I visit a hospital show page" do
    it "displays the hospitals name" do
      expect(page).to have_content("Denver Health")
    end

    it "displays the number of doctors that work there" do
      expect(page).to have_content("4")
    end

    it "uniquely lists the universities that doctors attended" do
      expect(page).to have_content("Florida State")
      expect(page).to have_content("Maine University")
      expect(page).to have_content("Metro State", count: 1)
    end
  end
end
