require 'rails_helper'

RSpec.describe "hospitals show page" do

  before :each do
    @hospital_1 = Hospital.create!(name: "General Hospital")
    @hospital_2 = Hospital.create!(name: "Bonfie Medical Center")
    @doctor_1 = @hospital_1.doctors.create!(name: "David Apple", specialty: "family practice", university: "University of Vermont")
    @doctor_2 = @hospital_2.doctors.create!(name: "Jeremy Buxbaum", specialty: "dermatoloty", university: "Rush")
    @doctor_3 = @hospital_1.doctors.create!(name: "Andrew Rosenbaum", specialty: "pediatrics", university: "University of Colorado Boulder")
    @patient_1 = @doctor_1.patients.create!(name: "Bob", age: 42)
    @patient_2 = @doctor_1.patients.create!(name: "Phill", age: 34)
    @patient_3 = @doctor_2.patients.create!(name: "Jeremy", age: 25)
    @patient_4 = @doctor_3.patients.create!(name: "Tom", age: 13)

    visit "/hospitals/#{@hospital_1.id}/"
  end

  it "shows a hospital's name, the number of associated doctors, and a list of unique doctors' universities" do
save_and_open_page
    expect(page).to have_content(@hospital_1.name)
    expect(page).not_to have_content(@hospital_2.name)

    expect(page).to have_content("Total Care Providers: #{@hospital_1.doctors.length}")

    expect(page).to have_content(@doctor_1.university)
    expect(page).to have_content(@doctor_3.university)
    expect(page).not_to have_content(@doctor_2.university)

    @doctor_3.update(university: "University of Vermont")
    visit "/hospitals/#{@hospital_1.id}/"

    expect(page).not_to have_content("University of Colorado Boulder")
    expect(page).to have_content("University of Vermont", count: 1)
  end

end
