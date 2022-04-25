require 'rails_helper'

RSpec.describe 'doctors show page' do

  before :each do
    @hospital = Hospital.create!(name: "General Hospital")
    @doctor_1 = @hospital.doctors.create!(name: "David Apple", specialty: "family practice", university: "University of Vermont")
    @doctor_2 = @hospital.doctors.create!(name: "Jeremy Buxbaum", specialty: "dermatoloty", university: "Rush")
  end

  it "shows a doctor's name, specialty and university" do
    visit "/doctors/#{@doctor_1.id}/"
    expect(page).to have_content("David Apple")
    expect(page).to have_content("family practice")
    expect(page).to have_content("University of Vermont")
    expect(page).not_to have_content("Jeremy Buxbaum")
    expect(page).not_to have_content("dermatology")
    expect(page).not_to have_content("Rush")
  end

end
