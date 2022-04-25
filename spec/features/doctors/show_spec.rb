require 'rails_helper'

RSpec.describe 'doctors show page' do

  before :each do
    @hospital_1 = Hospital.create!(name: "General Hospital")
    @hospital_2 = Hospital.create!(name: "Bonfie Medical Center")
    @doctor_1 = @hospital_1.doctors.create!(name: "David Apple", specialty: "family practice", university: "University of Vermont")
    @doctor_2 = @hospital_2.doctors.create!(name: "Jeremy Buxbaum", specialty: "dermatoloty", university: "Rush")
    @patient_1 = @doctor_1.patients.create!(name: "Bob", age: 42)
    @patient_2 = @doctor_1.patients.create!(name: "Phill", age: 34)
    @patient_3 = @doctor_2.patients.create!(name: "Jeremy", age: 25)

    visit "/doctors/#{@doctor_1.id}/"
  end

  it "shows a doctor's name, specialty and university" do
    expect(page).to have_content(@doctor_1.name)
    expect(page).to have_content(@doctor_1.specialty)
    expect(page).to have_content(@doctor_1.university)
    expect(page).not_to have_content(@doctor_2.name)
    expect(page).not_to have_content(@doctor_2.specialty)
    expect(page).not_to have_content(@doctor_2.university)
  end

  it "shows a doctor's parent hospital" do
    expect(page).to have_content(@hospital_1.name)
    expect(page).not_to have_content(@hospital_2.name)
  end

  it "shows the names of all a doctor's patients" do
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).not_to have_content(@patient_3.name)
  end

end
