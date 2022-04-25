require 'rails_helper'

RSpec.describe "Doctor show page" do 
    it 'displays doctors info' do 
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    bailey = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    visit "/doctors/#{bailey.id}"
    expect(page).to have_content("Bailey")
    expect(page).to have_content("Surgery")
    expect(page).to have_content("Stanford")
    end
end