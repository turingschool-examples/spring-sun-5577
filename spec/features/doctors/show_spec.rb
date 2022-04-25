require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  before :each do
    @hospital_1 = Hospital.create!(name: "St. Anthonys Hospital")
    @hospital_2 = Hospital.create!(name: "Mercy Hospital")

    @doctor_1 = @hospital_1.doctors.create!(name: "Blaise Pascale", specialty: "General Practice", university: "Notre Dame")
    @doctor_2 = @hospital_2.doctors.create!(name: "Kevin Kierl", specialty: "Emergency Medicine", university: "Oklahoma University")

    @patient_1 = @doctor_1.patients.create!(name: "Buda Bobby", age: 87)
    @patient_2 = @doctor_1.patients.create!(name: "Francine Gerry", age: 23)
    @patient_3 = @doctor_1.patients.create!(name: "Oakley Gunderson", age: 47)
    @patient_4 = @doctor_1.patients.create!(name: "Adam Hanty", age: 17)
  end

  it 'displays a doctors attributes' do
    visit "/doctors/#{@doctor_1.id}"

    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)
    expect(page).to_not have_content(@doctor_2.name)
    expect(page).to_not have_content(@doctor_2.specialty)
    expect(page).to_not have_content(@doctor_2.university)
  end

  it 'displays the hospital the doctor works for' do
    visit "/doctors/#{@doctor_1.id}"

    expect(page).to have_content("Current Hospital:")
    expect(page).to have_content("St. Anthonys Hospital")
    expect(page).to_not have_content("Mercy Hospital")
  end

  it 'displays the names of all patients the doctor has' do
    patient_5 = @doctor_2.patients.create!(name: "Testy Tom", age: 65)
    patient_6 = @doctor_2.patients.create!(name: "Rspec Richard", age: 23)

    visit "/doctors/#{@doctor_1.id}"

    expect(page).to have_content("Buda Bobby")
    expect(page).to have_content("Francine Gerry")
    expect(page).to have_content("Oakley Gunderson")
    expect(page).to have_content("Adam Hanty")
    expect(page).to_not have_content("Testy Tom")
    expect(page).to_not have_content("Rspec Richard")
  end

  it 'has a button to remove patient from doctor that redirects to doctor show page' do
    visit "/doctors/#{@doctor_1.id}"

    within('div#patient-list') do
      expect(page).to have_button("Delete #{@patient_1.name}")
    end
  end

  it 'deletes the patient record entirely' do
    visit "/doctors/#{@doctor_1.id}"

    within("div#patient-list") do
      click_button("Delete #{@patient_1.name}")
    end

    expect(page).to_not have_content("Buda Bobby")

    expect(current_path).to eq("/doctors/#{@doctor_1.id}/")
  end
end
