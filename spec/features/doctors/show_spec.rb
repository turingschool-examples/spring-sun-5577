require "rails_helper"

RSpec.describe "Doctor show page", type: :feature do
  before (:each) do
    @hospital = Hospital.create!(name: "Denver Health")

    @doctor1 = @hospital.doctors.create!(name: "Alex Trebek", specialty: "Feet", university: "Florida State")
    @doctor2 = @hospital.doctors.create!(name: "Sheldon Cooper", specialty: "Hearts", university: "Maine University")
    @doctor3 = @hospital.doctors.create!(name: "Paige Hallowell", specialty: "Eyes", university: "Metro State")

    @patient1 = Patient.create!(name: "Joseph D", age: 36)
    @patient2 = Patient.create!(name: "Lee K", age: 37)
    @patient3 = Patient.create!(name: "Megan G", age: 40)

    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient1.id)
  end

  describe "when I visit a doctor's show page" do
    it "displays all the doctors info" do
      visit "/doctors/#{@doctor1.id}"
      expect(page).to have_content("Alex Trebek")
      expect(page).to have_content("Florida State")
      expect(page).to have_content("Denver Health")
      expect(page).to_not have_content("Sheldon Cooper")
    end

    it "displays all the patients for the doctor" do
      visit "/doctors/#{@doctor1.id}"
      expect(page).to have_content("Joseph D")
      expect(page).to have_content("Lee K")
      expect(page).to_not have_content("Megan G")
    end
  end
end
