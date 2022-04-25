require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  before :each do
    @hospital_1 = Hospital.create!(name: "St. Anthonys Hospital")
    @hospital_2 = Hospital.create!(name: "Mercy Hospital")

    @doctor_1 = @hospital_1.doctors.create!(name: "Blaise Pascale", specialty: "General Practice", university: "Notre Dame")
    @doctor_2 = @hospital_1.doctors.create!(name: "Kevin Kierl", specialty: "Emergency Medicine", university: "Notre Dame")
    @doctor_3 = @hospital_1.doctors.create!(name: "Matt Berry", specialty: "Orthopaeadics", university: "Oklahoma University")
    @doctor_4 = @hospital_1.doctors.create!(name: "Roy Claggett", specialty: "Sports Medicine", university: "University of Florida")
    @doctor_5 = @hospital_1.doctors.create!(name: "Emily Wunsch", specialty: "Neuro-Surgery", university: "Oklahoma State University")
    @doctor_6 = @hospital_2.doctors.create!(name: "Brian Smith", specialty: "New Age Medicine", university: "Kansas University")

    @patient_1 = @doctor_1.patients.create!(name: "Buda Bobby", age: 87)
    @patient_2 = @doctor_1.patients.create!(name: "Francine Gerry", age: 23)
    @patient_3 = @doctor_1.patients.create!(name: "Oakley Gunderson", age: 47)
    @patient_4 = @doctor_1.patients.create!(name: "Adam Hanty", age: 17)
  end

  it 'displays the hospitals name' do
    visit "/hospitals/#{@hospital_1.id}"

    expect(page).to have_content("St. Anthonys Hospital")
    expect(page).to_not have_content("Mercy Hospital")
  end

  it 'displays a number of how many doctors work at the hospital' do
    visit "/hospitals/#{@hospital_1.id}"

    within("div#total-docs") do
      expect(page).to have_content("5")
      expect(page).to_not have_content("7")
    end
  end

  it 'displays a unique list of universitys the doctors attended'

end
