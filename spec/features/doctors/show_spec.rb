require "rails_helper"

RSpec.describe "Doctors Show Page" do
  before :each do
    @cuddle_town = Hospital.create!(name: "Cuddle Town Emergency Center")
    @broken_bones = Hospital.create!(name: "Break Your Bones Emergency Center")

    @doc_1 = @cuddle_town.doctors.create!(name: "Dr. Oopsies", specialty: "Messing Up", university: "Cute College")
    @doc_2 = @cuddle_town.doctors.create!(name: "Dr. Nono", specialty: "Fumbling Delicate Tools", university: "UPENN")

    @johnny = Patient.create!(name: "Johnny Bowman", age: 99)
    @mike = Patient.create!(name: "Mike Dao", age: 29)
    @dani = Patient.create!(name: "Dani Coleman", age: 28)

    @dp_1 = DoctorPatient.create!(doctor_id: @doc_1.id, patient_id: @johnny.id)
    @dp_2 = DoctorPatient.create!(doctor_id: @doc_1.id, patient_id: @mike.id)
    @dp_3 = DoctorPatient.create!(doctor_id: @doc_2.id, patient_id: @dani.id)
  end

  it "displays the doctor name, specialty, and university" do
    visit "/doctors/#{@doc_1.id}"

    expect(page).to have_content(@doc_1.name)
    expect(page).to have_content(@doc_1.specialty)
    expect(page).to have_content(@doc_1.university)

    expect(page).to_not have_content(@doc_2.name)
  end

  it "displays the hopsital the doctor works at, as well as patient names they have" do
    visit "/doctors/#{@doc_1.id}"

    expect(page).to have_content(@cuddle_town.name)

    expect(page).to have_content(@johnny.name)
    expect(page).to have_content(@mike.name)

    expect(page).to_not have_content(@dani.name)
    expect(page).to_not have_content(@broken_bones.name)
  end
end
