require 'rails_helper'
RSpec.describe 'Hospital Show Page', type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital1 = Hospital.create!(name: "Not my Hospital")
    @doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doc1 = @hospital.doctors.create!(name: "Paul", specialty: "General Surgery", university: "Webster University")
    @doc2 = @hospital1.doctors.create!(name: "John", specialty: "Internal Med", university: "Colorado University")
  end

  it 'Shows an individual Hospital and all related attributes' do
    visit hospital_path(@hospital.id)

    expect(page).to have_content("Name: #{@hospital.name}")
    expect(page).to have_content("Number of doctors: 2" )

    expect(page).to have_content("Stanford University")
    expect(page).to have_content("Webster University")
    expect(page).to_not have_content("Colorado University")

  end
end
