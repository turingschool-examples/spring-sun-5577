require 'rails_helper'
RSpec.describe 'Doctors Show Page', type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doc = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
  end

  it 'Shows an individual doctor and all related attributes' do
    visit doctor_path(@doc.id)

      save_and_open_page
    within("#doc-#{@doc.id}") do
      expect(page).to have_content("Name: #{@doc.name}")
      expect(page).to have_content("Specialty: #{@doc.specialty}")
      expect(page).to have_content("University: #{@doc.university}")
      expect(page).to have_content(@hospital.name)

    end
  end
end
